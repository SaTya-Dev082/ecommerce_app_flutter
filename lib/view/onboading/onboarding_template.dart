import 'package:e_commerce_app/constants/constant.dart';
import 'package:flutter/material.dart';

class OnboardingTemplate extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingTemplate({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(image, height: 400, fit: BoxFit.cover),
            ),

            const SizedBox(height: 32),

            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // Description
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),

            const Spacer(),

            // Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5B5BD6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Create Account',
                  style: TextStyle(fontSize: 18, color: kColorTextLight),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Login text
            TextButton(
              onPressed: () {},
              child: const Text('Already Have an Account'),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
