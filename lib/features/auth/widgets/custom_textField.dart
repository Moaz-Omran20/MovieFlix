import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool obSecureText;
   Function(String)? onChanged;

  CustomTextField(
      {super.key, required this.labelText, this.obSecureText = false, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "*Field is required*";
        } else if (labelText == "Email") {
          final bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.com+")
              .hasMatch(value);
          if (!emailValid) {
            return "Please,enter a valid mail";
          }
        } else if (labelText == "Phone") {
          final bool phoneValid =
              RegExp(r'^01[0-2,5]{1}[0-9]{8}$').hasMatch(value);
          if (!phoneValid) {
            return "Please,enter a valid phone number";
          }
        } else if (labelText == "Password") {
          final bool passwordValid =
              RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
                  .hasMatch(value);
          if (!passwordValid) {
            return "Minimum eight characters,\n at least one letter \n at least one number";
          }
        }
      },
      onChanged: onChanged,
      obscureText: obSecureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
