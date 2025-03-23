import 'package:flutter/material.dart';
import 'package:url_shortner_app/utils/app_colors.dart';

class CustomInputField extends StatelessWidget {
  final String lebel;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardtype;
  final bool obsecureText;
  final IconData? icon;
  final String? Function(String?)? validator;
  const CustomInputField({
    Key? key,
    required this.lebel,
    required this.hint,
    required this.controller,
    required this.keyboardtype,
    required this.obsecureText,
    this.icon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardtype,
        obscureText: obsecureText,
        validator: validator,
        decoration: InputDecoration(
          labelText: lebel,
          hintText: hint,
          prefixIcon: icon != null ? Icon(icon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.green,
              width: 2,
            ), // Change when focused
          ),
        ),
      ),
    );
  }
}
