import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/components/delivery_controller.dart';
import 'package:latlong2/latlong.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';

import '../../../../constants/colors.dart';

class FindLocationWidget extends StatefulWidget {
  const FindLocationWidget({Key? key}) : super(key: key);

  @override
  State<FindLocationWidget> createState() => _FindLocationWidgetState();
}

class _FindLocationWidgetState extends State<FindLocationWidget> {
  final deliverController = Get.find<DeliveryController>();
  showMap() {
    showDialog(
      context: context,
      builder: (_) {
        LatLng coorsMarker = LatLng(-1.9218595, 30.0815515);
        MapController mapController = MapController();

        return Dialog(
          backgroundColor: whiteColor,
          child: SizedBox(
            height: screenHeight(context) / 1.85,
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
                      child: FlutterMap(
                        mapController: mapController,
                        options: MapOptions(
                          center: LatLng(-1.9218595, 30.0815515),
                          zoom: 13,
                          maxZoom: 15,
                          minZoom: 5,
                          onTap: (tapPosition, point) {
                            setState(() {
                              coorsMarker = point;

                              mapController.move(point, 13);
                            });
                          },
                        ),
                        layers: [
                          TileLayerOptions(
                              urlTemplate:
                                  "https://maps.wikimedia.org/osm-intl/{z}/{x}/{y}.png"),
                          MarkerLayerOptions(
                            markers: [
                              Marker(
                                point: coorsMarker,
                                builder: (ctx) => const Icon(
                                  Icons.location_on,
                                  color: primaryColor,
                                  size: 48.0,
                                ),
                                height: 80,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: TextFormField(
                        cursorColor: grayColor,
                        decoration: const InputDecoration(
                          hintText: "E.g KG 562 ST",
                          filled: true,
                          fillColor: whiteColor,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    deliverController.changeLocation(coorsMarker);
                    Navigator.pop(context);
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
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: showMap,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(12)),
        child: const Icon(
          Icons.location_searching,
          color: whiteColor,
        ),
      ),
    );
  }
}
