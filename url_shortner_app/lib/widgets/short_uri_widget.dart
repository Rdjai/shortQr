import 'package:flutter/material.dart';
import 'package:url_shortner_app/utils/app_colors.dart';

class ShortUriWidget extends StatefulWidget {
  const ShortUriWidget({super.key});

  @override
  State<ShortUriWidget> createState() => _ShortUriWidgetState();
}

class _ShortUriWidgetState extends State<ShortUriWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Row(
        children: [
          Image.asset("assets/qrcode.webp", height: 60),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Link Name"),
              Text("https://yesdomain.io"),
              Text("shortedlink"),
            ],
          ),
        ],
      ),
    );
  }
}
