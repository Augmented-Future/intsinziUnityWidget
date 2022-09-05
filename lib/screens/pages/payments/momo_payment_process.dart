import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/controllers/user_account_controller.dart';
import 'package:globaltrailblazersapp/models/product_pay.dart';
import 'package:globaltrailblazersapp/services/payment_service.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:lottie/lottie.dart';

class PaymentProcessPageMomo extends StatefulWidget {
  const PaymentProcessPageMomo(
      {Key? key,
      required this.mobileNumber,
      required this.momoName,
      required this.productPay})
      : super(key: key);
  final ProductPay productPay;
  final String mobileNumber;
  final String momoName;
  @override
  State<PaymentProcessPageMomo> createState() => _PaymentProcessPageMomoState();
}

class _PaymentProcessPageMomoState extends State<PaymentProcessPageMomo> {
  final _user = Get.find<UserAccountController>();
  late IsLoading _isLoading;
  ErrorException? _error;
  Map<String, dynamic>? _success;
  void pay() async {
    setState(() {
      _isLoading = IsLoading.loading;
    });
    dynamic result = await PaymentService(
            productPay: widget.productPay, user: _user.userAccountInfo.value!)
        .payWithMomo(widget.mobileNumber, widget.momoName);
    if (result.runtimeType == ErrorException) {
      setState(() {
        _error = result;
        _isLoading = IsLoading.failed;
      });
      return;
    }
    setState(() {
      _isLoading = IsLoading.done;
      _success = result;
    });
  }

  @override
  void initState() {
    pay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Intsinzi App Payment",
                style: TextStyle(fontSize: 30, color: color100),
              ),
              const SizedBox(height: 20),
              _isLoading == IsLoading.loading
                  ? Column(
                      children: [
                        SizedBox(
                            width: screenHeight(context) / 3,
                            child: Lottie.asset(
                                "assets/lottie/card_swiping.json")),
                        const Text(
                          "Transaction Loading..",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )
                  : _isLoading == IsLoading.failed
                      ? Text("(${_error!.statusCode}) ${_error!.errorMessage}")
                      : Text(
                          "(${_success!["statusCode"]}) ${_success!["message"]}",
                        ),
              if (_isLoading != IsLoading.loading)
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, ProcessResponse.fail),
                  child: const Text(
                    "RETRY",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        fontSize: 13),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: coolYellow,
                      shadowColor: Colors.transparent,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 20)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
