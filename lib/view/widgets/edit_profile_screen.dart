import 'package:e_commerce_app/view/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Edit Profile"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 42,
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=47"),
            ),
            const SizedBox(height: 24),
            inputField(
              label: "Username",
              value: "Magdalena Succrose",
              icon: Icons.person_outline,
            ),
            inputField(
              label: "Email or Phone Number",
              value: "magdalena83@gmail.com",
              icon: Icons.email_outlined,
            ),
            inputField(
              label: "Account Linked With",
              value: "Google",
              icon: Icons.g_mobiledata,
            ),
            const Spacer(),
            primaryButton("Save Changes"),
          ],
        ),
      ),
    );
  }
}
