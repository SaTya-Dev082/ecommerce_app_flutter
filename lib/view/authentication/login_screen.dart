import 'package:e_commerce_app/constants/constant.dart';
import 'package:e_commerce_app/controller/authentication_controller.dart';
import 'package:e_commerce_app/view/authentication/create_account_screen.dart';
import 'package:e_commerce_app/view/authentication/input_field_screen.dart';
import 'package:e_commerce_app/view/authentication/social_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final AuthenticationController controller = Get.find();

  // late AuthenticationController authController;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   authController = Get.find<AuthenticationController>();
  // }

  bool isShowPassword = false;
  bool isShowPasswordConfirm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Login Account',
                    style: TextStyle(
                      fontSize: kSizeAppBar,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Input(
                  label: 'Email or Phone Number',
                  hint: 'Enter your email or phone number',
                  icon: Icons.email_outlined,
                  controller: emailController,
                ),

                Input(
                  controller: passwordController,
                  label: 'Password',
                  hint: 'Enter your password',
                  icon: Icons.lock_outline,
                  obscure: true,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      _showModalBottomSheetForgotPassword(
                        context,
                        emailController.text,
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(fontSize: 16, color: kColorPrimary),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: GetBuilder<AuthenticationController>(
                    init: AuthenticationController(),
                    builder:
                        (controller) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kColorPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              controller.login(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                            }
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              color: kColorTextLight,
                            ),
                          ),
                        ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You don't have an account?",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: kSizeSmall,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAll(CreateAccountScreen());
                      },
                      child: Text(
                        "Sig Up",
                        style: TextStyle(
                          color: kColorPrimary,
                          decoration: TextDecoration.underline,
                          fontSize: kSizeMedium,
                        ),
                      ),
                    ),
                  ],
                ),

                SocialButton(
                  onPressed: () {},
                  text: 'Sign In with Google',
                  icon:
                      "https://i.pinimg.com/736x/1f/7d/49/1f7d49965c8f8d21314f6a39c1d92c3c.jpg",
                ),
                const SizedBox(height: 12),
                SocialButton(
                  onPressed: () {},
                  text: 'Sign In with Facebook',
                  icon:
                      "https://i.pinimg.com/736x/7b/ed/39/7bed398644d61cae7c4dd853b558a1c9.jpg",
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showModalBottomSheetForgotPassword(BuildContext context, String email) {
    showModalBottomSheet(
      backgroundColor: kColorTextLight,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          width: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: kColorTextDark,
                        fontSize: kSizeLarge,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Enter your email or phone number",
                      style: TextStyle(
                        color: kColorTextGrey,
                        fontSize: kSizeSmall,
                      ),
                    ),
                    SizedBox(height: 16),
                    Input(
                      controller: emailController,
                      label: 'Email or Phone number',
                      hint: 'Enter email or phone number',
                      icon: Icons.arrow_drop_down_circle_outlined,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5B5BD6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Send Code',
                          style: TextStyle(
                            fontSize: 16,
                            color: kColorTextLight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8.2,
                right: 8.2,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
