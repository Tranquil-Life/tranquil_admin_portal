import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';

// ignore: must_be_immutable
class CustomFormField extends StatelessWidget {
  final String hint;
  final String labelText;
  final String? initialValue;
  final TextEditingController? textEditingController;
  final bool showCursor;
  final Color? fillColor;
  final Function()? onTap;
  final TextInputType? textInputType;
  final bool readOnly, obscureText;
  final Widget? suffix, prefix;
  final String? Function(String?)? validator;
  void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final InputBorder inputBorder;

  CustomFormField({Key? key,
    this.hint = "",
    this.labelText = "",
    this.textEditingController,
    this.showCursor = false,
    this.onTap,
    this.textInputType,
    this.readOnly = false,
    this.obscureText= false,
    this.suffix,
    this.prefix,
    this.validator,
    this.initialValue,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.inputBorder = InputBorder.none,
    this.onChanged,
    this.fillColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 18, color: AppColors.black),
      autocorrect: false,
      readOnly: readOnly,
      initialValue: initialValue,
      obscureText: obscureText,
      controller: textEditingController,
      validator: validator,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      onTap: onTap,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hint,
          hintStyle:
          const TextStyle(
              fontSize: 18, color: Colors.grey),
          errorStyle: const TextStyle(color: Colors.white, fontSize: 14),
          fillColor: fillColor ?? Colors.white,
          border: inputBorder,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
              vertical: (hint=='Password' || hint=='Display Name') ? 17.0 : 22.0, horizontal: 24.0),
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffix: suffix,
          prefix: prefix),
    );
  }
}

