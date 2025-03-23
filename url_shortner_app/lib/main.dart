import 'package:flutter/material.dart';
import 'package:url_shortner_app/screens/home_screen.dart';
import 'package:url_shortner_app/screens/login_screen.dart';
import 'package:url_shortner_app/screens/register_screen.dart';
import 'package:url_shortner_app/screens/splash_screen.dart';
import './utils/theme.dart';
import './utils/font_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Abril Fatface", "ABeeZee");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/SplashScreen",
      routes: {
        "/": (context) => HomeScreen(),
        "/SplashScreen": (context) => SplashScreen(),
        "/login": (context) => loginScreen(),
        "/register": (context) => RegisterScreen(),
      },
    );
  }
}
