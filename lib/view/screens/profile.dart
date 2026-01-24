import 'package:e_commerce_app/view/widgets/setting_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kColorBackground, body: SettingsScreen());
  }
}
