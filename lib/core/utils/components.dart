import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DefaultButton extends StatelessWidget {
  final double width;
  final double height;
  final Color background;
  final TextStyle textStyle;
  final bool isUpperCase;
  final double radius;
  final Function function;
  final String text;

  const DefaultButton({
    super.key,
    this.width = double.infinity,
    this.height = 40,
    this.background = Colors.blue,
    this.textStyle = const TextStyle(
      color: Colors.white,
    ),
    this.isUpperCase = true,
    this.radius = 3.0,
    required this.function,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function as void Function()?,
        child: Text(isUpperCase ? text.toUpperCase() : text, style: textStyle),
      ),
    );
  }
}

class DefaultTextButton extends StatelessWidget {
  final Function function;
  final String text;
  final TextStyle textStyle;

  const DefaultTextButton({
    super.key,
    required this.function,
    this.textStyle = const TextStyle(
      color: Colors.white,
    ),
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function as void Function()?,
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final void Function(String)? onSubmit;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final bool isPassword;
  final String? Function(String?)? validate;
  final String label;
  final IconData? suffix;
  final void Function()? suffixPressed;
  final bool isClickable;

  const DefaultFormField({
    super.key,
    required this.controller,
    required this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.isPassword = false,
    required this.validate,
    required this.label,
    this.suffix,
    this.suffixPressed,
    this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: label,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
  }
}

void showToast({
  required String text,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0,
    );
