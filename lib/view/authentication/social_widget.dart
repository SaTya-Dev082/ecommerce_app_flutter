import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class SocialButton extends StatelessWidget {
  SocialButton({
    required this.text,
    required this.icon,
    required this.onPressed,
    super.key,
  });
  final String text;
  final String icon;
  Function? onPressed = () {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0XFFFEF7FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: kColorTextGrey),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                icon,
                height: 35,
                width: 35,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 15),
            Text(text, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
