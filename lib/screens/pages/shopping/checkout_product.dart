import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:globaltrailblazersapp/models/product.dart';
import 'package:globaltrailblazersapp/models/product_pay.dart';
import 'package:globaltrailblazersapp/screens/pages/payments/payment_page.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:google_place/google_place.dart';
import 'package:latlong2/latlong.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../shared/funcs.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key, required this.products, required this.price})
      : super(key: key);
  final List<Product> products;
  final int price;
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late int price;
  late LatLng _initialPoint;
  DeliverLocation? _location;
  String? _cellPhone;

  Placemark? placemark;
  IsLoading _isLoading = IsLoading.none;

  Future<dynamic> getLocationFromCoordinates(LatLng point) async {
    try {
      setState(() {
        _isLoading = IsLoading.loading;
        _initialPoint = point;
      });
      List<Placemark> placemarks =
          await placemarkFromCoordinates(point.latitude, point.longitude);
      if (placemarks.isNotEmpty) {
        setState(() {
          _isLoading = IsLoading.done;
          placemark = placemarks[0];
        });
        return placemarks[0];
      }
    } catch (e) {
      setState(() {
        _isLoading = IsLoading.failed;
      });
      showToast(message: "Failed to get location, $e", success: false);
      return null;
    }
  }

  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  late FocusNode inputFocusNode;
  final _textSearchController = TextEditingController();
  Timer? _debounce;

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  double mainSize = 400;
  @override
  void initState() {
    price = widget.price;
    _initialPoint = LatLng(-1.9218595, 30.0815515);
    String apiKEY = "AIzaSyBiXBnVhpaYzFLWuvhkoyJOiphu7rm54Ac";
    googlePlace = GooglePlace(apiKEY);

    inputFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const Text("Choose where products will be delivered"),
              Column(
                children: [
                  Container(
                    height: mainSize,
                    color: color100,
                    margin: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        FlutterMap(
                          options: MapOptions(
                            center: _initialPoint,
                            zoom: 13,
                            maxZoom: 15,
                            onTap: (tapPosition, point) async {
                              setState(() {
                                _isLoading = IsLoading.loading;
                                _initialPoint = point;
                              });
                              dynamic response =
                                  await getLocationFromCoordinates(point);
                              if (response == null) {
                                setState(() {
                                  _isLoading = IsLoading.failed;
                                });
                                return;
                              }
                              setState(() {
                                _isLoading = IsLoading.done;
                                placemark = response;
                              });
                            },
                          ),
                          layers: [
                            TileLayerOptions(
                              urlTemplate:
                                  "https://maps.wikimedia.org/osm-intl/{z}/{x}/{y}.png",
                            ),
                            MarkerLayerOptions(
                              markers: [
                                Marker(
                                  point: _initialPoint,
                                  builder: (ctx) => const Icon(
                                    Icons.location_on,
                                    color: primaryColor,
                                    size: 48.0,
                                  ),
                                  height: 60,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              TextField(
                                autofocus: false,
                                focusNode: inputFocusNode,
                                controller: _textSearchController,
                                cursorColor: grayColor,
                                decoration: InputDecoration(
                                    hintText: "Eg: KG 567 ST, Kigali, Rwanda",
                                    filled: true,
                                    fillColor: whiteColor,
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(20),
                                    suffixIcon: _textSearchController
                                            .text.isNotEmpty
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
                                  _debounce = Timer(
                                      const Duration(milliseconds: 1000), () {
                                    if (value.isNotEmpty) {
                                      //Call our search place api here.
                                      autoCompleteSearch(value);
                                    } else {
                                      //Clear out the results
                                      setState(() {
                                        predictions = [];
                                      });
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                height: predictions.isEmpty
                                    ? 0
                                    : (predictions.length < 5
                                        ? predictions.length * 20
                                        : mainSize * 0.7),
                                child: ListView.builder(
                                  itemCount: predictions.length,
                                  itemBuilder: (context, index) => Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: const BoxDecoration(
                                      color: whiteColor,
                                      border: Border.symmetric(
                                        horizontal: BorderSide(
                                            width: 0.2, color: grayColor200),
                                      ),
                                    ),
                                    child: GestureDetector(
                                      onTap: () async {
                                        final details = await googlePlace
                                            .details
                                            .get(predictions[index].placeId!);
                                        if (details != null &&
                                            details.result != null &&
                                            mounted) {
                                          LatLng _points = LatLng(
                                            details.result!.geometry!.location!
                                                .lat!,
                                            details.result!.geometry!.location!
                                                .lng!,
                                          );
                                          if (inputFocusNode.hasFocus) {
                                            setState(() {
                                              _textSearchController.text =
                                                  details.result!.name!;
                                              predictions = [];
                                              _initialPoint = _points;
                                            });
                                          }
                                          getLocationFromCoordinates(_points);
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(Icons.location_on),
                                          const SizedBox(width: 5),
                                          Expanded(
                                            child: Text(
                                              predictions[index].description!,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: colorPurple.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _isLoading == IsLoading.loading
                            ? const SizedBox(
                                height: 20,
                                child: LoadingIndicator(
                                  indicatorType: Indicator.lineSpinFadeLoader,
                                  colors: [whiteColor],
                                ),
                              )
                            : const Icon(
                                Icons.location_on,
                                color: whiteColor,
                              ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            _isLoading == IsLoading.loading
                                ? "Location loading"
                                : (_isLoading == IsLoading.failed
                                    ? "Location failed"
                                    : (_isLoading == IsLoading.done
                                        ? "${placemark!.street!.isEmpty ? "[No street]" : "${placemark!.street}"}, ${placemark!.subAdministrativeArea}, ${placemark!.administrativeArea}, ${placemark!.locality!.isEmpty ? "[No locality]" : "${placemark!.locality} -"} ${placemark!.country}"
                                        : "Please choose location")),
                            style: const TextStyle(
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () {},
                    splashColor: brandYellowColor.withOpacity(0.6),
                    highlightColor: whiteColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(30),
                    child: Ink(
                      width: screenWidth(context) / 1.5,
                      height: 40,
                      padding: const EdgeInsets.only(top: 9),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/fullBtn.png"),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
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
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: Row(
                  children: const [
                    Expanded(
                        child: Divider(
                      color: primaryColor,
                    )),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "GO TO PAYMENT",
                        style: TextStyle(color: grayColor200),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      color: primaryColor,
                    )),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(
                        productPay: ProductPay(
                            products: widget.products,
                            priceToBePaid: price,
                            purchaseType: PurchaseType.delivery,
                            quantity: widget.products.length,
                            cellPhone: _cellPhone,
                            location: _location),
                      ),
                    ),
                  );
                },
                child: const Text("CONTINUE"),
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  shadowColor: Colors.transparent,
                  shape: const StadiumBorder(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
