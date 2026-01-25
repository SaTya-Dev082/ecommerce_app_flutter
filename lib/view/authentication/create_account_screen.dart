import 'dart:io';

import 'package:e_commerce_app/constants/constant.dart';
import 'package:e_commerce_app/controller/authentication_controller.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/view/authentication/input_field_screen.dart';
import 'package:e_commerce_app/view/authentication/login_screen.dart';
import 'package:e_commerce_app/view/authentication/social_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final HomeController homeController = Get.find();
  final AuthenticationController authController = Get.find();

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
                    'Create Account',
                    style: TextStyle(
                      fontSize: kSizeAppBar,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 32),
                GetBuilder<HomeController>(
                  builder:
                      (controller) => Center(
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: InkWell(
                            onTap: () {
                              controller.pickImage(ImageSource.gallery);
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: kColorPrimary,
                                      width: 2,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child:
                                        controller.avatar != null
                                            ? Image.file(
                                              File(controller.avatar!.path),
                                              fit: BoxFit.cover,
                                            )
                                            : Image.network(
                                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                                              fit: BoxFit.cover,
                                            ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -10,
                                  right: 42,
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: kColorPrimary,
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                ),

                Input(
                  label: 'Username',
                  hint: 'Create your username',
                  icon: Icons.person_outline,
                  controller: usernameController,
                ),

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
                  // obscuringCharacter: "*",
                  obscure: true,
                ),
                Input(
                  controller: passwordConfirmController,
                  label: 'Password Confirmation',
                  hint: 'Create your password confirmation',
                  icon: Icons.lock_outline,
                  obscure: true,
                ),

                GetBuilder<AuthenticationController>(
                  builder:
                      (controller) => SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              controller.register(
                                name: usernameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                password_confirmation:
                                    passwordConfirmController.text,
                                avatar: homeController.avatar,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF5B5BD6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Create account',
                            style: TextStyle(
                              fontSize: 16,
                              color: kColorTextLight,
                            ),
                          ),
                        ),
                      ),
                ),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: kSizeSmall,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAll(LoginScreen());
                        },
                        child: Text(
                          'Sig In',
                          style: TextStyle(
                            color: kColorPrimary,
                            fontSize: kSizeMedium,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SocialButton(
                  onPressed: () {},
                  text: 'Sign Up with Google',
                  icon:
                      "https://i.pinimg.com/736x/1f/7d/49/1f7d49965c8f8d21314f6a39c1d92c3c.jpg",
                ),
                const SizedBox(height: 12),
                SocialButton(
                  onPressed: () {},
                  text: 'Sign Up with Facebook',
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
}
