import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/models/product.dart';
import 'package:globaltrailblazersapp/models/product_pay.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/components/delivery_controller.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/components/product_list_view.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/widgets/choose_location.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/widgets/pay_button.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/widgets/quantity_widget.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/widgets/share_widget.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/widgets/text_field.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/widgets/video_player_widget.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Widget? selectedThumb;
  int selectedImage = 1;
  final _purchaseChoiceController = Get.put(DeliveryController());
  int _purchaseQuantity = 1;
  late int priceToDeliver;
  late int priceToPrint;
  @override
  void initState() {
    selectedThumb = Image.network(
      widget.product.productImage1,
      fit: BoxFit.fill,
    );
    priceToDeliver = widget.product.priceToDeliver;
    priceToPrint = widget.product.priceToPrint;
    _purchaseChoiceController.priceToPay.value = widget.product.priceToDeliver;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${widget.product.ages} years| ${widget.product.grade}| ${widget.product.course}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: screenWidth(context),
                    height: screenHeight(context) / 4,
                    decoration: const BoxDecoration(color: primaryColor),
                    child: selectedThumb,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildThumbWidget(
                          context: context,
                          imgUrl: widget.product.productImage1,
                          index: 1),
                      if (widget.product.productImage2 != null)
                        buildThumbWidget(
                            context: context,
                            imgUrl: widget.product.productImage2,
                            index: 2),
                      if (widget.product.productImage3 != null)
                        buildThumbWidget(
                            context: context,
                            imgUrl: widget.product.productImage3,
                            index: 3),
                      buildThumbWidget(
                          context: context,
                          isLast: true,
                          imgUrl: widget.product.productImage1,
                          video: widget.product.productVideo,
                          index: 4),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              child: InkWell(
                                onTap: () =>
                                    _purchaseChoiceController.deliveryChoosed(
                                        true,
                                        priceToDeliver * _purchaseQuantity),
                                child: Ink(
                                  width: 40,
                                  height: 40,
                                  color:
                                      _purchaseChoiceController.deliver.isTrue
                                          ? brandYellowColor
                                          : grayColor,
                                  child:
                                      _purchaseChoiceController.deliver.isTrue
                                          ? const Icon(Icons.check,
                                              color: primaryColor, size: 35)
                                          : Container(),
                                ),
                              ),
                            );
                          }),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.product.priceToDeliver} Frw",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const Text(
                                  "Get goods delivered\nat your doorsteps")
                            ],
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              child: InkWell(
                                onTap: () => _purchaseChoiceController
                                    .deliveryChoosed(false, priceToPrint),
                                child: Ink(
                                  width: 40,
                                  height: 40,
                                  color:
                                      _purchaseChoiceController.deliver.isTrue
                                          ? grayColor
                                          : brandYellowColor,
                                  child:
                                      _purchaseChoiceController.deliver.isTrue
                                          ? Container()
                                          : const Icon(Icons.check,
                                              color: primaryColor, size: 35),
                                ),
                              ),
                            );
                          }),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.product.priceToPrint} Frw",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const Text("Download and print\nfor your self")
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Obx(() {
                    if (_purchaseChoiceController.deliver.isTrue) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/icons/quantity.svg"),
                                const Padding(
                                  padding: EdgeInsets.only(left: 20, right: 50),
                                  child: Text(
                                    "Quantity",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                QuantityWidget(
                                  decrease: () => setState(() {
                                    if (_purchaseQuantity > 1) {
                                      _purchaseChoiceController
                                          .decrementQuantityPrice(
                                              _purchaseChoiceController
                                                      .deliver.isTrue
                                                  ? widget
                                                      .product.priceToDeliver
                                                  : widget
                                                      .product.priceToPrint);
                                      _purchaseQuantity--;
                                    }
                                  }),
                                  increase: () => setState(() {
                                    _purchaseQuantity++;

                                    _purchaseChoiceController
                                        .incrementQuantityPrice(
                                            widget.product.priceToDeliver);
                                  }),
                                  quantity: _purchaseQuantity,
                                )
                              ],
                            ),
                          ),
                          const TextWidgetProduct(
                              textInputType: TextInputType.phone,
                              text: "Cell Phone"),
                          const TextWidgetProduct(
                              textInputType: TextInputType.streetAddress,
                              text: "Location"),
                          const Text(
                            "Where your products will be delivered",
                            style: TextStyle(color: Colors.red),
                          ),
                          const FindLocationWidget(),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }),
                  const SizedBox(height: 20),
                  Obx(
                    () {
                      return PayButton(
                        price: _purchaseChoiceController.priceToPay.value,
                        purchaseType: _purchaseChoiceController.deliver.isTrue
                            ? PurchaseType.delivery
                            : PurchaseType.print,
                        quantity: _purchaseQuantity,
                        product: widget.product,
                        location: _purchaseChoiceController.deliver.isTrue
                            ? _purchaseChoiceController.location.value
                            : null,
                        cellPhone: _purchaseChoiceController.deliver.isTrue
                            ? _purchaseChoiceController.cellPhone.value
                            : null,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ShareWidget(product: widget.product),
                  const SizedBox(height: 20),
                  const Text("Recommended Products"),
                  ProductListView(products: productsList),
                ],
              ),
            ),
          )
        ],
      ),
      backgroundColor: whiteColor,
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }

  Widget buildThumbWidget(
      {required BuildContext context,
      bool? isLast,
      required String imgUrl,
      required int index,
      String? video}) {
    return GestureDetector(
      onTap: () => setState(
        () {
          if (isLast != null && video != null) {
            selectedThumb =
                VideoPlayerWidget(videoUrl: video, thumbnail: imgUrl);
          } else {
            selectedThumb = Image.network(
              imgUrl,
              fit: BoxFit.fill,
            );
          }

          selectedImage = index;
        },
      ),
      child: Container(
        width: screenWidth(context) / 5,
        height: 50,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: primaryColor,
          border: selectedImage == index
              ? Border.all(width: 2.5, color: brandYellowColor)
              : Border.all(width: 0.0, color: whiteColor),
          image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.fill),
        ),
        child: isLast != null
            ? const Icon(Icons.play_circle, color: whiteColor)
            : Container(),
      ),
    );
  }
}
