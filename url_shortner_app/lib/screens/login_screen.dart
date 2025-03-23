import 'dart:convert';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:url_shortner_app/model/url.model.dart';
import 'package:url_shortner_app/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_shortner_app/widgets/custom_button_widget.dart';
import 'package:url_shortner_app/widgets/custom_input_field.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return BlurryModalProgressHUD(
      dismissible: false,
      opacity: 0.4,
      inAsyncCall: isLoading,
      blurEffectIntensity: 4,
      progressIndicator: SpinKitSpinningCircle(
        color: AppColors.primaryColor,
        size: 150,
      ),

      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code,
                      size: 45,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(),

                    Text(
                      "ShortQr",
                      style: GoogleFonts.hammersmithOne(fontSize: 45),
                    ),
                  ],
                ),

                SizedBox(height: 50),
                CustomInputField(
                  controller: emailController,
                  hint: "xyz@mail.com",
                  keyboardtype: TextInputType.emailAddress,
                  lebel: "xyz@mail.com",
                  obsecureText: false,
                  icon: Icons.mail,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Email cannot be empty";
                    return null;
                  },
                ),
                CustomInputField(
                  controller: passwordController,
                  hint: "password",
                  keyboardtype: TextInputType.text,
                  lebel: "secret password",
                  obsecureText: true,
                  icon: Icons.password,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Password cannot be empty";
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Forget password?",
                    style: GoogleFonts.alikeAngular(
                      fontSize: 18,
                      color: AppColors.primaryColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 4),
                Builder(
                  builder: (BuildContext context) {
                    return CustomButtonWidget(
                      btnName: "Login",
                      func: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await login(
                          emailController.text,
                          passwordController.text,
                          context,
                        );
                        setState(() {
                          isLoading = false;
                        });
                      },
                      clr: AppColors.primaryColor,
                    );
                  },
                ),
                SizedBox(height: 15),
                CustomButtonWidget(
                  btnName: "Sign up",
                  func: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  clr: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> login(
    String userEmail,
    String pass,
    BuildContext context,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.1.13:8000/api/login"),
        body: {"email": userEmail, "password": pass},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> userData = json.decode(response.body);
        final LoginResponse loginResponse = LoginResponse.fromJson(userData);
        SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setString('token', loginResponse.loginToken);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Logged in successfully!")),
        );
        Navigator.pushReplacementNamed(context, "/");
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login failed: ${response.statusCode}")),
        );
        return false;
      }
    } catch (e) {
      print("Error during login: $e");
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("An error occurred: $e")));
      }
      return false;
    }
  }
}
