import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:globaltrailblazersapp/models/product.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants/colors.dart';

class ShareWidget extends StatelessWidget {
  const ShareWidget({Key? key, required this.product}) : super(key: key);
  final Product product;

  gotoShare(String urlA) async {
    Uri url = Uri.parse(urlA);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      Fluttertoast.showToast(
        msg: "Failed to open link. ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.grey[200],
        textColor: primaryColor,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Share"),
          InkWell(
            onTap: () => gotoShare(
                "https://twitter.com/intent/tweet?url=https://intsinzi.app/shop-details/${product.slug}&text=${product.name}"),
            child: Ink(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/twitter.svg'),
            ),
          ),
          InkWell(
            onTap: () => gotoShare(
                "https://api.whatsapp.com/send?text=${product.name} from Intsinzi Market https://intsinzi.app/shop-details/${product.slug}"),
            child: Ink(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/tsap.svg'),
            ),
          ),
          InkWell(
            onTap: () => gotoShare(
                "https://www.facebook.com/sharer/sharer.php?u=https://intsinzi.app/shop-details/${product.id}&t=${product.name}"),
            child: Ink(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/fb.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
