import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_shortner_app/utils/app_colors.dart';
import 'package:url_shortner_app/widgets/custom_button_widget.dart';
import 'package:url_shortner_app/widgets/custom_input_field.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:url_shortner_app/widgets/short_uri_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController shortQrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: .5,
          title: Row(
            children: [
              Icon(Icons.qr_code, size: 20, color: AppColors.primaryColor),
              SizedBox(),

              Text("ShortQr", style: GoogleFonts.hammersmithOne(fontSize: 20)),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter Url or Text",
                style: GoogleFonts.hammersmithOne(fontSize: 20),
              ),
              CustomInputField(
                lebel: "https://yesdomain.io",
                hint: "https://yesdomain.io",
                controller: shortQrController,
                keyboardtype: TextInputType.text,
                obsecureText: false,
              ),
              SizedBox(height: 25),
              CustomButtonWidget(
                btnName: "Generate",
                func: () => print("Generate QR Code"),
                clr: AppColors.primaryColor,
              ),
              SizedBox(height: 25),
              CustomButtonWidget(
                btnName: "Shorten URL",
                func: () => print("Generate QR Code"),
                clr: AppColors.primaryColor,
              ),
              SizedBox(height: 25),
              ShortUriWidget(),
            ],
          ),
        ),
        bottomNavigationBar: GNav(
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          gap: 8,
          activeColor: Colors.black,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: Colors.grey[100]!,
          color: Colors.black,
          tabs: [
            GButton(icon: LineIcons.home, text: 'Home'),
            GButton(icon: LineIcons.heart, text: 'Likes'),
            GButton(icon: LineIcons.search, text: 'Search'),
            GButton(icon: LineIcons.user, text: 'Profile'),
          ],
          // selectedIndex: _selectedIndex,
          // onTabChange: (index) {
          //   setState(() {
          //     _selectedIndex = index;
          //   });
          // },
        ),
      ),
    );
  }
}
