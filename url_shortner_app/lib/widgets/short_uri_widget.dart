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
      child: Row(
        children: [
          Image.network(
            "https://www.google.com/imgres?q=qr%20code%20image&imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fd%2Fd0%2FQR_code_for_mobile_English_Wikipedia.svg&imgrefurl=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FQR_code&docid=VO6MX2dtclzMgM&tbnid=AUAfJ9S28UM6kM&vet=12ahUKEwjl8Knjk_qLAxUYzTgGHUvTMcIQM3oECBYQAA..i&w=296&h=296&hcb=2&ved=2ahUKEwjl8Knjk_qLAxUYzTgGHUvTMcIQM3oECBYQAA",
          ),
        ],
      ),
    );
  }
}
