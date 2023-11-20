import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/core/utils/app_routes.dart';
import 'package:movies_app/features/auth/widgets/custom_button.dart';

class ProfileView extends StatelessWidget {
   User? user = FirebaseAuth.instance.currentUser;

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: user?.photoURL != null
                    ? NetworkImage(user!.photoURL!)
                    : const NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSE2Y_rKwPAhf1H1etkUwwrt2y4rjW6GrCr0w&usqp=CAU"),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Email : ${user!.email}",
            style: GoogleFonts.rubik(fontSize: 18),
          ),
          const Spacer(),
          CustomButton(
            label: "Sign Out",
            onTap: () {
              signOut(context);
            },
          ),
        ],
      ),
    );
  }

  void signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    GoRouter.of(context).go(AppRoutes.kLoginVIew);
  }
}
