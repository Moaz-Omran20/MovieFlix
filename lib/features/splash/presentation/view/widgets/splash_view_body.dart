import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/core/utils/app_routes.dart';

class SplashViewBody extends StatefulWidget {
  bool isSignedIn = false;

  SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToHome();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppImages.logo1),
          //SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        widget.isSignedIn = isSignedIn();
        GoRouter.of(context).pushReplacement(
            widget.isSignedIn ? AppRoutes.kHomeView : AppRoutes.kLoginVIew);
      },
    );
  }

  bool isSignedIn() {
    User? user = FirebaseAuth.instance.currentUser;
    bool isSigned;
    if (user != null) {
      isSigned = true;
      return isSigned;
    } else {
      isSigned = false;
      return isSigned;
    }
  }
}
