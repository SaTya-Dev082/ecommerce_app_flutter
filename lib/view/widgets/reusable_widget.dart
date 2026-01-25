import 'package:e_commerce_app/constants/constant.dart';
import 'package:e_commerce_app/controller/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final AuthenticationController authController = Get.find();
AppBar appBar(String title) {
  return AppBar(
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  );
}

Widget sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
    ),
  );
}

Widget settingTile({
  required IconData icon,
  required String title,
  Widget? trailing,
  VoidCallback? onTap,
}) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    ),
  );
}

Widget logoutTile(String title, {required VoidCallback onTap}) {
  return GetBuilder<AuthenticationController>(
    builder:
        (controller) => Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: Text(title, style: TextStyle(color: Colors.red)),
            onTap: onTap,
          ),
        ),
  );
}

Widget inputField({
  required String label,
  required String value,
  required IconData icon,
  required TextEditingController controller,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: value,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget passwordField(String hint) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: const Icon(Icons.visibility_off),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget primaryButton(String text, {required VoidCallback onPressed}) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5B5ACB),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: 16, color: kColorTextLight)),
    ),
  );
}
