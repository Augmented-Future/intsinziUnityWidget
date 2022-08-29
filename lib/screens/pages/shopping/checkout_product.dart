import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      body: const Center(
        child: Text("Checkout products page"),
      ),
    );
  }
}
