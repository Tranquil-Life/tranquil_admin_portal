import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/features/auth/presentation/controllers/auth_controller.dart';
import 'package:tranquil_admin_portal/features/auth/presentation/widgets/form_fields.dart';

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
          constraints: const BoxConstraints(maxWidth: 400),
          //padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/tranquil_life_logo.png", height: 150, width: 150),

              const SizedBox(height: 30),

              Text(AppStrings.loginTitle, style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.w700)),

              const SizedBox(height: 15),

              const CustomText(
                text: AppStrings.welcomeBackMsg,
                color: AppColors.grey,
                size: 18,
                weight: FontWeight.normal,
              ),

              const SizedBox(height: 30),

              emailFormField(),

              const SizedBox(height: 15),

              passwordField(),

              const SizedBox(
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
                        const CustomText(
                          text: AppStrings.rememberMeMsg,
                          color: AppColors.black,
                          size: 14,
                          weight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ),

                  const CustomText(
                    text: AppStrings.forgotPwdMsg,
                    color: AppColors.green,
                    size: 14,
                    weight: FontWeight.normal,
                  ),
                ],
              ),

              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                  throw Exception('This is test exception');

                  // Get.to(SiteLayout());
                  /*authController.login(
                      authController.emailTEC.text,
                      authController.passwordTEC.text);*/
                },
                child: Container(
                  decoration: BoxDecoration(color: AppColors.green,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
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
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: const CustomText(
                    text: AppStrings.loginTitle,
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
