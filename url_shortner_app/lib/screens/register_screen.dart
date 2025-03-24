import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_shortner_app/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_shortner_app/widgets/custom_button_widget.dart';
import 'package:url_shortner_app/widgets/custom_input_field.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
      child: Material(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.qr_code, size: 45, color: AppColors.primaryColor),
                  SizedBox(),
                  Text(
                    "ShortQr",
                    style: GoogleFonts.hammersmithOne(fontSize: 45),
                  ),
                ],
              ),
              SizedBox(height: 50),
              CustomInputField(
                controller: nameController,
                hint: "Name",
                keyboardtype: TextInputType.emailAddress,
                lebel: "Rdj Kashyap",
                obsecureText: false,
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Email cannot be empty";

                  return null;
                },
              ),
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
              // SizedBox(height: 5),
              CustomInputField(
                controller: passwordController,
                hint: "password",
                keyboardtype: TextInputType.text,
                lebel: "secret password",
                obsecureText: false,
                icon: Icons.password,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Email cannot be empty";

                  return null;
                },
              ),

              SizedBox(height: 4),
              CustomButtonWidget(
                btnName: "create account",
                func: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await register(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                    context,
                  );
                  setState(() {
                    isLoading = false;
                  });
                },
                clr: AppColors.primaryColor,
              ),
              SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
                child: Text("Already have an account?Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> register(
    String name,
    String email,
    String pass,
    BuildContext context,
  ) async {
    try {
      print("the value is ${name} ${email} ${pass}");
      final response = await http.post(
        Uri.parse("http://192.168.1.24:3000/api/register"),
        body: {"Name": name, "email": email, "password": pass},
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Account created successfully!")),
        );
        print("ragistered ${response.body}");
        Navigator.pushReplacementNamed(context, "/login");
        return true;
      } else {
        print("somethong went wrong ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("registration failed: ${response.statusCode}"),
          ),
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
    }

    return true;
  }
}
