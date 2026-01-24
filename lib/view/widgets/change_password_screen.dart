import 'package:e_commerce_app/view/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Change Password"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            passwordField("New Password"),
            passwordField("Confirm Password"),
            const Spacer(),
            primaryButton("Change Now", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
