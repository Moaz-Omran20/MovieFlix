import 'package:flutter/material.dart';
import '../../../constants.dart';

class CustomButton extends StatelessWidget {
  String label;
  VoidCallback? onTap;

  CustomButton({required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          backgroundColor: kPrimaryColor),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
