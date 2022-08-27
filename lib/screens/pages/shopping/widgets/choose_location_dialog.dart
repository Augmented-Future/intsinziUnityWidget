import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/components/delivery_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/shared.dart';
import '../../../../models/product_pay.dart';

class ChooseLocationDialog extends StatefulWidget {
  const ChooseLocationDialog({Key? key}) : super(key: key);

  @override
  State<ChooseLocationDialog> createState() => _ChooseLocationDialogState();
}

class _ChooseLocationDialogState extends State<ChooseLocationDialog> {
  final _textSearchController = TextEditingController();
  final _deliveryController = Get.find<DeliveryController>();
  late GoogleMapController _googleMapController;

  final DeliverLocation _kigaliPosition = DeliverLocation(
      position: const LatLng(-1.939329, 30.085749655962),
      adminiStrativeArea: "",
      country: "",
      isoCountryCode: "",
      locality: "",
      name: "",
      street: "",
      subAdministrativeArea: "");

  late CameraPosition _initialPositionKigali;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  addMarker(DeliverLocation location) async {
    var markerIdVal = location.name;
    final MarkerId markerId = MarkerId(markerIdVal);

    // creating a new MARKER
    Marker marker = Marker(
      markerId: markerId,
      position: location.position,
      infoWindow: InfoWindow(title: markerIdVal, snippet: location.street),
      onTap: () {},
    );

    setState(() {
      markers.clear();
      // adding a new marker to map
      markers[markerId] = marker;

      _isLoadingNewLocation = IsLoading.loading;
    });

    //Geocoding location
    List<Placemark> placemarks = await placemarkFromCoordinates(
        location.position.latitude, location.position.longitude);
    if (placemarks.isNotEmpty && mounted) {
      setState(() {
        _choosenLocation = DeliverLocation(
            position: location.position,
            adminiStrativeArea: placemarks[0].administrativeArea!,
            country: placemarks[0].country!,
            isoCountryCode: placemarks[0].isoCountryCode!,
            locality: placemarks[0].locality!,
            name: placemarks[0].name!,
            street: placemarks[0].street!,
            subAdministrativeArea: placemarks[0].subAdministrativeArea!);
        _isLoadingNewLocation = IsLoading.done;
      });
    }
  }

  DetailsResult? selectedPosition;
  late FocusNode inputFocusNode;

  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  Timer? _debounce;

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  DeliverLocation? _choosenLocation;
  IsLoading _isLoadingNewLocation = IsLoading.none;

  @override
  void initState() {
    _initialPositionKigali = CameraPosition(
      target: _kigaliPosition.position,
      zoom: 15,
    );
    super.initState();
    String apiKEY = "AIzaSyBiXBnVhpaYzFLWuvhkoyJOiphu7rm54Ac";
    googlePlace = GooglePlace(apiKEY);

    inputFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    inputFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      child: SizedBox(
        height: screenHeight(context) / 1.85,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Container(),
                    const Text(
                      "Delivery Address",
                      style: TextStyle(fontSize: 18),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Ink(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          "assets/icons/white_close.svg",
                          color: primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: screenHeight(context) / 2.5,
                    child: GoogleMap(
                      initialCameraPosition: _initialPositionKigali,
                      mapType: MapType.hybrid,
                      markers: Set<Marker>.of(markers.values),
                      onMapCreated: (controller) =>
                          _googleMapController = controller,
                      onTap: (positionTapped) {
                        addMarker(
                          DeliverLocation(
                            position: positionTapped,
                            adminiStrativeArea: "",
                            country: "",
                            isoCountryCode: "",
                            locality: "",
                            name: "",
                            street: "",
                            subAdministrativeArea: "",
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        TextField(
                          controller: _textSearchController,
                          autofocus: false,
                          cursorColor: grayColor,
                          focusNode: inputFocusNode,
                          decoration: InputDecoration(
                              hintText: "Eg: KG 567 ST, Kigali, Rwanda",
                              filled: true,
                              fillColor: whiteColor,
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(20),
                              suffixIcon: _textSearchController.text.isNotEmpty
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          predictions = [];
                                          _textSearchController.clear();
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.clear_outlined,
                                        color: grayColor,
                                      ))
                                  : null),
                          onChanged: (value) {
                            if (_debounce?.isActive ?? false) {
                              _debounce!.cancel();
                            }
                            _debounce =
                                Timer(const Duration(milliseconds: 1000), () {
                              if (value.isNotEmpty) {
                                //Call our search place api here.
                                autoCompleteSearch(value);
                              } else {
                                //Clear out the results
                                setState(() {
                                  predictions = [];
                                  selectedPosition = null;
                                });
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 2),
                        SizedBox(
                          height: predictions.isEmpty ? 0 : 200,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: predictions.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  final placeId = predictions[index].placeId!;
                                  final details =
                                      await googlePlace.details.get(placeId);
                                  if (details != null &&
                                      details.result != null &&
                                      mounted) {
                                    if (inputFocusNode.hasFocus) {
                                      setState(() {
                                        selectedPosition = details.result;
                                        _textSearchController.text =
                                            details.result!.name!;
                                        predictions = [];
                                      });
                                    }
                                    if (selectedPosition != null && mounted) {
                                      setState(() {
                                        addMarker(DeliverLocation(
                                            position: LatLng(
                                                selectedPosition!
                                                    .geometry!.location!.lat!,
                                                selectedPosition!
                                                    .geometry!.location!.lng!),
                                            adminiStrativeArea:
                                                selectedPosition!.adrAddress!,
                                            country: "",
                                            isoCountryCode: "",
                                            locality: "",
                                            name: selectedPosition!.name!,
                                            street: selectedPosition!
                                                .formattedAddress!,
                                            subAdministrativeArea:
                                                selectedPosition!.adrAddress!));
                                      });
                                      _googleMapController.moveCamera(
                                          CameraUpdate.newLatLngZoom(
                                              LatLng(
                                                  selectedPosition!
                                                      .geometry!.location!.lat!,
                                                  selectedPosition!.geometry!
                                                      .location!.lng!),
                                              15.5));
                                    }
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                    color: whiteColor,
                                    border: Border(
                                      bottom: BorderSide(
                                          color: grayColor200, width: 0.45),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.location_on,
                                          color: primaryColor, size: 30),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: Text(
                                          predictions[index]
                                              .description
                                              .toString(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: grayColor, borderRadius: BorderRadius.circular(4)),
                child: Row(
                  children: [
                    if (_isLoadingNewLocation != IsLoading.loading)
                      const Icon(
                        Icons.location_on,
                        color: whiteColor,
                        size: 40,
                      ),
                    if (_isLoadingNewLocation == IsLoading.loading)
                      const CircularProgressIndicator(
                        color: whiteColor,
                      ),
                    if (_choosenLocation == null)
                      const Expanded(
                        child: Text(
                          "Please choose location..",
                          style: TextStyle(color: whiteColor),
                        ),
                      ),
                    const SizedBox(width: 5),
                    if (_choosenLocation != null)
                      Expanded(
                        child: Text(
                          "${_choosenLocation!.street}, ${_choosenLocation!.subAdministrativeArea}, ${_choosenLocation!.adminiStrativeArea}, ${_choosenLocation!.locality}-${_choosenLocation!.country}(${_choosenLocation!.isoCountryCode}) ${_choosenLocation!.name}",
                          style: const TextStyle(color: whiteColor),
                        ),
                      ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  if (_choosenLocation != null &&
                      _choosenLocation!.street.isNotEmpty) {
                    _deliveryController.changeLocation(_choosenLocation!);
                    Navigator.pop(context);
                  } else if (_choosenLocation!.street.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Please choose street nearby you",
                        backgroundColor: coolGreen,
                        textColor: whiteColor);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Please choose location",
                        backgroundColor: coolGreen,
                        textColor: whiteColor);
                  }
                },
                splashColor: brandYellowColor.withOpacity(0.6),
                highlightColor: whiteColor.withOpacity(0.5),
                child: Ink(
                  width: screenWidth(context) / 2,
                  height: 40,
                  padding: const EdgeInsets.only(top: 9),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/fullBtn.png"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
