import 'package:flutter/material.dart';

class ShortUriWidget extends StatefulWidget {
  const ShortUriWidget({super.key});

  @override
  State<ShortUriWidget> createState() => _ShortUriWidgetState();
}

class _ShortUriWidgetState extends State<ShortUriWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Row(children: [Image.asset("assets/qrcode.webp", height: 60)]),
    );
  }
}
