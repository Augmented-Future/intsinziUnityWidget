import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/controllers/user_account_controller.dart';
import 'package:globaltrailblazersapp/models/product_pay.dart';
import 'package:globaltrailblazersapp/services/payment_service.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:lottie/lottie.dart';

class PaymentProcessPageCard extends StatefulWidget {
  const PaymentProcessPageCard(
      {Key? key,
      required this.card,
      required this.cvv,
      required this.expDate,
      required this.names,
      required this.productPay})
      : super(key: key);
  final ProductPay productPay;
  final String names, card, expDate, cvv;
  @override
  State<PaymentProcessPageCard> createState() => _PaymentProcessPageCardState();
}

class _PaymentProcessPageCardState extends State<PaymentProcessPageCard> {
  final _user = Get.find<UserAccountController>();
  late IsLoading _isLoading;
  ErrorException? _error;
  Map<String, dynamic>? _success;
  void pay() async {
    setState(() {
      _isLoading = IsLoading.loading;
    });
    String expMonth = "${widget.expDate[0]}${widget.expDate[1]}";
    String expYear = "${widget.expDate[3]}${widget.expDate[4]}";
    dynamic result = await PaymentService(
            productPay: widget.productPay, user: _user.userAccountInfo.value!)
        .payWithCard(widget.card, widget.names, widget.cvv, expMonth, expYear);
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
                      primary: coolYellow,
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
