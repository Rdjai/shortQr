import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_shortner_app/utils/app_colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.qr_code, size: 45, color: AppColors.primaryColor),
                SizedBox(width: 12),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      RotateAnimatedText(
                        'ShortQr',
                        textStyle: GoogleFonts.hammersmithOne(
                          fontSize: 45,
                          color: Colors.black,
                        ),
                      ),

                      RotateAnimatedText(
                        'short URL',
                        textStyle: GoogleFonts.hammersmithOne(
                          fontSize: 45,
                          color: Colors.black,
                        ),
                      ),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getUserData() async {
    await Future.delayed(Duration(seconds: 2)); // Optional delay
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token!.isEmpty) {
      Navigator.pushReplacementNamed(context, "/login");
    } else {
      Navigator.pushReplacementNamed(context, "/");
    }
  }
}
