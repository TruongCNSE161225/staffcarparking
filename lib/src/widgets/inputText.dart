import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class InputText extends StatelessWidget {
  late TextEditingController controller;
  late String text;
  late bool isPassword;
  bool obscureText = false;
  Function()? onPressed;
  InputText({
    Key? key,
    required this.controller,
    required this.text,
    this.isPassword = false,
    this.obscureText = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Vui lòng điền $text';
          }
          return null;
        },
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility))
              : null,
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          labelText: text,
        ),
      ),
    );
  }
}
