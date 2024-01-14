import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

mixin ReferralPageController on Widget {
  void onCopy(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  void share(BuildContext context) async {
    // Replace the URL with the appropriate Facebook sharing URL
    const text = 'https://excelacademy.com/invite/potns?ruukjd';
    String facebookUrl = "https://www.facebook.com/sharer/sharer.php?u=$text";

    if (await canLaunch(facebookUrl)) {
      await launch(facebookUrl);
    } else {
      // Could not launch the URL
      print('Could not launch $facebookUrl');
    }
  }

  void share1(BuildContext context) {
    const text = 'https://excelacademy.com/invite/potns?ruukjd';
    Share.share(text, subject: 'Sharing to Facebook');
  }
}
