import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final String? title;
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.title,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 105,
      height: height ?? 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text(
          title.toString(),
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
