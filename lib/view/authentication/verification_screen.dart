import 'dart:ui';

import 'package:e_commerce_app/view/authentication/otp_screen.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Verification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Icon
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF5B5BD6).withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.verified_user_outlined,
                size: 50,
                color: Color(0xFF5B5BD6),
              ),
            ),

            const SizedBox(height: 24),

            // Title
            const Text(
              'Verification Code',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Description
            const Text(
              'We have to sent the code verification to\nmagdalena83@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 32),

            // OTP Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) => OtpBox()),
            ),

            const Spacer(),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5B5BD6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Submit', style: TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 16),

            // Resend
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't receive the code?",
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(onPressed: () {}, child: const Text('Resend')),
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
