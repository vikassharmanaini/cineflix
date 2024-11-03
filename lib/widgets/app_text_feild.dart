import 'package:cineflix/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextFeild extends StatelessWidget {
  const AppTextFeild(
      {super.key,
      required this.text,
      required this.EC,
      this.validation,
      this.hinttext,
      this.placeholder,
      this.enable,
      this.keyboard,
      this.ontap,
      this.suffix});
  final bool? enable;
  final void Function()? ontap;
  final TextInputType? keyboard;
  final Widget? placeholder;
  final String? hinttext;
  final String? Function(String?)? validation;
  final RxString? text;
  final TextEditingController EC;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    final borderside = BorderSide(
      width: 1,
      color: Color(0xFF242424),
    );
    return TextFormField(
      onTap: ontap,
      validator: validation,
      keyboardType: enable == false ? TextInputType.none : keyboard,
      onChanged: (v) {
        if (text != null) text!.value = v;
      },
      controller: EC,
      decoration: InputDecoration(
        suffixIcon: suffix,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), borderSide: borderside),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), borderSide: borderside),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), borderSide: borderside),
        label: placeholder ??
            Text(
              hinttext ?? "Your mobile number",
              style: TextStyle(
                color: Color(0xFF8596A2),
                fontSize: 16,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
                height: 0.07,
                letterSpacing: 0.20,
              ),
            ),
        // hintText:hinttext?? ,
        labelStyle: TextStyle(
          color: Color(0xFF8596A2),
          fontSize: 16,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w400,
          height: 0.07,
          letterSpacing: 0.20,
        ),
      ),
    );
  }
}
