import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: AppBar(
        backgroundColor: kColorBackground,
        title: Text(
          "Favorite",
          style: TextStyle(fontSize: kSizeAppBar, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(child: Column(children: [])),
    );
  }
}
