import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/screens/pages/payments/pay_with_card.dart';
import 'package:globaltrailblazersapp/screens/pages/payments/payment_controller.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_button.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';

import 'pay_with_momo.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _paymentController = Get.put(PaymentController());
  int _payingWith = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BackButtonWidget(),
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        toolbarHeight: 80,
        centerTitle: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/payingCard-bg.png'),
              fit: BoxFit.cover),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: screenHeight(context) / 4.5,
              backgroundColor: Colors.transparent,
              shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50.0),
                ),
              ),
              leading: Container(),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    color: brandYellowColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "PAYMENT",
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            letterSpacing: 2.2,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: coolYellow,
                          borderRadius: BorderRadius.all(
                            Radius.circular(80),
                          ),
                        ),
                        child: Image.asset('assets/images/coins.png'),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          _paymentController.switchPaymentMethodWithCard(false);
                          setState(() => _payingWith = 0);
                        },
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: _payingWith == 0
                                    ? brandYellowColor
                                    : whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: _payingWith == 0
                                      ? whiteColor
                                      : primaryColor.withOpacity(0.5),
                                  width: 1.0,
                                ),
                              ),
                              width: screenWidth(context) * 0.3,
                              height: 100,
                              child: Image.asset(
                                'assets/images/mtn.png',
                                width: 80,
                              ),
                            ),
                            if (_payingWith == 0)
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SvgPicture.asset(
                                  'assets/icons/tick.svg',
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                          onTap: () {
                            _paymentController
                                .switchPaymentMethodWithCard(true);
                            setState(() => _payingWith = 1);
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: screenWidth(context) * 0.3,
                                height: 100,
                                margin: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: _payingWith == 1
                                      ? brandYellowColor
                                      : whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: _payingWith == 1
                                        ? whiteColor
                                        : primaryColor.withOpacity(0.5),
                                    width: 1.0,
                                  ),
                                ),
                                child: Image.asset('assets/images/visa.png'),
                              ),
                              if (_payingWith == 1)
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/tick.svg',
                                  ),
                                ),
                            ],
                          )),
                    ],
                  ),
                  Obx(() {
                    if (_paymentController.payWithCard.isFalse) {
                      return PayWithMomoWidget();
                    } else {
                      return PayWithCardWidget();
                    }
                  })
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
