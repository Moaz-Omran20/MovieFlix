import 'package:flutter/material.dart';
import '../../constants.dart';
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
          color: kPrimaryColor,
        ));
  }
}

class ErrorImageWidget extends StatelessWidget {
  const ErrorImageWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return const Center(child: Icon(Icons.error_outline,color: kPrimaryColor,));
  }
}

