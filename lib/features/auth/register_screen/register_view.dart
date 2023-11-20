import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/features/auth/widgets/custom_button.dart';
import 'package:movies_app/features/auth/widgets/custom_textField.dart';
import '../../../core/utils/app_images.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email;

  String? password;

  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      color: kPrimaryColor,
      progressIndicator: const CircularProgressIndicator(
        color: kPrimaryColor,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            autovalidateMode: autovalidateMode,
            key: formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                      child: Image.asset(
                        AppImages.logo1,
                        fit: BoxFit.fill,
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    labelText: "Name",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    onChanged: (userEmail) {
                      email = userEmail;
                    },
                    labelText: "Email",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    labelText: "Phone",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    labelText: "Password",
                    onChanged: (userPassword) {
                      password = userPassword;
                    },
                    obSecureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * .06,
                    child: CustomButton(
                      label: "Sign Up",
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await userRegister();
                            showSnackbar(context,
                                message: "Account created successfully");
                            GoRouter.of(context).pop();
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackbar(context,
                                  message:
                                      "The password provided is too weak.");
                            } else if (e.code == 'email-already-in-use') {
                              showSnackbar(context,
                                  message:
                                      "The account already exists for that email.");
                            }
                          }
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                        isLoading = false;
                        setState(() {});
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackbar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> userRegister() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
