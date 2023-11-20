import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/app_routes.dart';
import 'package:movies_app/features/auth/widgets/custom_button.dart';
import 'package:movies_app/features/auth/widgets/custom_textField.dart';
import '../../../core/utils/app_images.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      color: kPrimaryColor,
      progressIndicator: const CircularProgressIndicator(
        color: kPrimaryColor,
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .28,
                      child: Image.asset(
                        AppImages.logo1,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Sign in",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      labelText: "Email",
                      onChanged: (userEmail) {
                        email = userEmail;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      onChanged: (userPassword) {
                        password = userPassword;
                      },
                      labelText: "Password",
                      obSecureText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * .06,
                      child: CustomButton(
                        label: "Log in",
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});
                            try {
                              await userLogIn();
                              showSnackMessage(context,
                                  message: "Logged in successfully");
                              GoRouter.of(context)
                                  .pushReplacement(AppRoutes.kHomeView);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                showSnackMessage(context,
                                    message: "No user found for that email.");
                              } else if (e.code == 'wrong-password') {
                                showSnackMessage(context,
                                    message:
                                        'Wrong password provided for that user.');
                              }
                            }
                          }
                          isLoading = false;
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: 1,
                          color: Colors.grey,
                        )),
                        const Text("  Or log in with  "),
                        Expanded(
                            child: Container(
                          height: 1,
                          color: Colors.grey,
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            signInWithGoogle();
                          },
                            child: const CircleAvatar(
                              backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage("assets/images/google.png"),
                                radius: 30)),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*.1,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Do not have an account ? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          InkWell(
                            onTap: () =>
                                GoRouter.of(context).push(AppRoutes.kRegisterView),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackMessage(context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> userLogIn() async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    GoRouter.of(context).go(AppRoutes.kHomeView);
    showSnackMessage(context, message: "Logged in successfully");
    // Once signed in, return the UserCredential

  }
}
