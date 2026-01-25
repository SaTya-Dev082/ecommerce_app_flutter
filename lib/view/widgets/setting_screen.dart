import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/constants/constant.dart';
import 'package:e_commerce_app/controller/authentication_controller.dart';
import 'package:e_commerce_app/view/widgets/change_password_screen.dart';
import 'package:e_commerce_app/view/widgets/edit_profile_screen.dart';
import 'package:e_commerce_app/view/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final AuthenticationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Settings"),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Obx(() {
            final user = controller.currentUser.value;

            if (user == null) {
              return const CircularProgressIndicator();
            }

            return Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child:
                      user.avatar != null
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              imageUrl: "http://10.0.2.2:8000${user.avatar}",
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          )
                          : Image.network(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                            fit: BoxFit.cover,
                          ),
                ),
                const SizedBox(height: 6),
                Text(
                  user.name!,
                  style: TextStyle(
                    fontSize: kSizeMedium,
                    fontWeight: FontWeight.bold,
                    color: kColorTextDark,
                  ),
                ),
                Text(
                  user.email!,
                  style: TextStyle(fontSize: kSizeSmall, color: kColorTextGrey),
                ),
              ],
            );
          }),
          sectionTitle("General"),
          settingTile(
            icon: Icons.person_outline,
            title: "Edit Profile",
            onTap: () {
              Get.to(EditProfileScreen(user: controller.currentUser.value!));
            },
          ),
          settingTile(
            icon: Icons.lock_outline,
            title: "Change Password",
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ChangePasswordScreen(),
                  ),
                ),
          ),
          settingTile(icon: Icons.notifications_none, title: "Notifications"),
          settingTile(icon: Icons.security, title: "Security"),
          settingTile(
            icon: Icons.language,
            title: "Language",
            trailing: const Text(
              "English",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 24),
          sectionTitle("Preferences"),
          settingTile(
            icon: Icons.description_outlined,
            title: "Legal and Policies",
          ),
          settingTile(icon: Icons.help_outline, title: "Help & Support"),
          const SizedBox(height: 16),
          logoutTile(
            "Log Out",
            onTap: () {
              controller.logoutCurrent();
            },
          ),
          logoutTile(
            "Log Out all devices",
            onTap: () {
              controller.logoutAll();
            },
          ),
        ],
      ),
    );
  }
}
