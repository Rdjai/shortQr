import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_shortner_app/model/myuri.model.dart';
import 'package:url_shortner_app/utils/app_colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController shortQrController = TextEditingController();

  bool isLoading = true;
  List<MyUri> urlList = [];

  @override
  void initState() {
    super.initState();
    fetchUrls();
  }

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
        body:
            isLoading
                ? Center(child: CircularProgressIndicator())
                : urlList.isEmpty
                ? Center(child: Text("No URLs found"))
                : ListView.builder(
                  itemCount: urlList.length,
                  itemBuilder: (context, index) {
                    var item = urlList[index];
                    return ListTile(
                      title: Text(item.title ?? "No Title"),
                      subtitle: Text(item.shortId ?? "Id Not find"),
                    );
                  },
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
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: () {},
          child: Text("+", style: GoogleFonts.hammersmithOne(fontSize: 20)),
        ),
      ),
    );
  }

  Future<List<MyUri>> fetchUrls() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      final res = await http.get(
        Uri.parse("http://192.168.1.14:3000/api/my-url"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (res.statusCode == 200) {
        print("Data: ${res.body}");

        final Map<String, dynamic> data = json.decode(res.body);
        List<dynamic> urlData = data['data']; // Assuming 'data' contains a list

        List<MyUri> myUris =
            urlData.map((item) => MyUri.fromJson(item)).toList();

        setState(() {
          urlList = myUris;
          isLoading = false;
        });

        return myUris;
      } else {
        print("Error: ${res.body}");
        setState(() => isLoading = false);
        return [];
      }
    } catch (e) {
      print("Exception: $e");
      setState(() => isLoading = false);
      return [];
    }
  }
}
