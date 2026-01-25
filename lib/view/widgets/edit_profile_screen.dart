import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/authentication_controller.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/view/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.user});
  final UserModel user;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final AuthenticationController controller = Get.find();
  final HomeController homeController = Get.find();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String avatar = "";
  @override
  void initState() {
    super.initState();
    usernameController.text = widget.user.name != null ? widget.user.name! : "";
    emailController.text = widget.user.email != null ? widget.user.email! : "";
    avatar = widget.user.avatar != null ? widget.user.avatar! : "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Edit Profile"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  homeController.pickImage(ImageSource.gallery);
                },
                child: GetBuilder<HomeController>(
                  builder:
                      (controller) => InkWell(
                        onTap: () {
                          controller.pickImage(ImageSource.gallery);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child:
                                controller.avatar != null
                                    // 🟢 New picked image
                                    ? Image.file(
                                      controller.avatar!,
                                      fit: BoxFit.cover,
                                    )
                                    // 🔵 Old avatar from DB
                                    : CachedNetworkImage(
                                      imageUrl:
                                          "http://10.0.2.2:8000${authController.currentUser.value!.avatar}",
                                      fit: BoxFit.cover,
                                    ),
                          ),
                        ),
                      ),
                ),
              ),
              const SizedBox(height: 24),
              inputField(
                controller: usernameController,
                label: "Username",
                value: usernameController.text,
                icon: Icons.person_outline,
              ),
              inputField(
                controller: emailController,
                label: "Email or Phone Number",
                value: emailController.text,
                icon: Icons.email_outlined,
              ),
              // const Spacer(),
              GetBuilder<AuthenticationController>(
                builder:
                    (controller) => primaryButton(
                      "Save Changes",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.updateProfile(
                            name: usernameController.text,
                            email: emailController.text,
                            avatar: homeController.avatar,
                          );
                        }
                      },
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
