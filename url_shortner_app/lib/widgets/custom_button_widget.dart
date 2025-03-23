import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonWidget extends StatelessWidget {
  final String btnName;
  final VoidCallback func;
  final Color clr;
  const CustomButtonWidget({
    super.key,
    required this.btnName,
    required this.func,
    required this.clr,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: func,
        child: Text(btnName, style: GoogleFonts.alikeAngular(fontSize: 18)),
        style: ElevatedButton.styleFrom(
          backgroundColor: clr,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
