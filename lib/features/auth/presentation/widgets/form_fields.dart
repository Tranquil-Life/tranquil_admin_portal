import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/app/presentation/theme/app_colors.dart';
import 'package:tranquil_admin_portal/app/presentation/widgets/custom_form_field.dart';
import 'package:tranquil_admin_portal/core/utils/services/validators.dart';
import 'package:tranquil_admin_portal/features/auth/presentation/controllers/auth_controller.dart';

//email field
CustomFormField emailFormField(){
  return CustomFormField(
    labelText: 'Email',
    hint: "abc@domain.com",
    textEditingController: AuthController.instance.emailTEC,
    textInputType: TextInputType.emailAddress,
    validator: (val) {
      if (val!.isEmpty) {
        return 'Please input your email';
      }
      if (!Validator.isEmail(val)) {
        return 'Please input a valid email address';
      }
      return null;
    },
    inputBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

  );
}

//Password field
CustomFormField passwordField(){
  return CustomFormField(
    obscureText: !AuthController.instance.isPasswordVisible.value,
    textInputType: TextInputType.visiblePassword,
    textEditingController: AuthController.instance.passwordTEC,
    labelText: 'Password',
    hint: "Enter password",
    suffix: Icon(Icons.visibility),
    // suffix: GestureDetector(
    //   onTap: (){
    //     AuthController.instance.isPasswordVisible.value = !AuthController.instance.isPasswordVisible.value;
    //   },
    //   child: AuthController.instance.isPasswordVisible.value
    //       ? const Icon(
    //     Icons.visibility,
    //     color: AppColors.green,
    //   )
    //       : const Icon(Icons.visibility_off),
    // ),
    validator: (val){
      if (val!.isEmpty) {
        return 'Please input a strong password';
      }
      if (val.length < 6) {
        return 'Your password should be at least 6 characters long';
      }
      return null;
    },
    inputBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

    //onChanged: (text)=> AuthController.instance.params.password = text,
  );
}
