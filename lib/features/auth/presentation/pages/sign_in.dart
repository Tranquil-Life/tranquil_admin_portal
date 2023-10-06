import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tranquil_admin_portal/app/presentation/theme/app_colors.dart';
import 'package:tranquil_admin_portal/app/presentation/widgets/custom_text.dart';
import 'package:tranquil_admin_portal/features/auth/presentation/controllers/auth_controller.dart';
import 'package:tranquil_admin_portal/features/auth/presentation/widgets/form_fields.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/pages/dashboard.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/pages/site_layout.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          //padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/tranquil_life_logo.png", height: 150, width: 150),

              const SizedBox(height: 30),

              Text("Login", style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.w700)),

              const SizedBox(height: 15),

              const CustomText(
                text: "Welcome back to the admin panel.",
                color: AppColors.grey,
                size: 18,
                weight: FontWeight.normal,
              ),

              SizedBox(height: 30),

              emailFormField(),

              SizedBox(height: 15),

              passwordField(),

              SizedBox(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  SizedBox(
                    width: 200,
                    child: Wrap(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Checkbox(value: true, onChanged: (value){}),
                        CustomText(
                          text: "Remember Me",
                          color: AppColors.black,
                          size: 14,
                          weight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ),

                  CustomText(
                    text: "Forgot password?",
                    color: AppColors.green,
                    size: 14,
                    weight: FontWeight.normal,
                  ),
                ],
              ),

              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                  Get.to(SiteLayout());
                  /*authController.login(
                      authController.emailTEC.text,
                      authController.passwordTEC.text);*/
                },
                child: Container(
                  decoration: BoxDecoration(color: AppColors.green,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(2.0, 2.0), // shadow direction: bottom right
                        )
                      ]
                  ),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: CustomText(
                    text: "Login",
                    color: Colors.white,
                    size: 14,
                    weight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
