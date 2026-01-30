import 'package:flutter/material.dart';

class AddMultiImage extends StatefulWidget {
  const AddMultiImage({super.key});

  @override
  State<AddMultiImage> createState() => _AddMultiImageState();
}

class _AddMultiImageState extends State<AddMultiImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi Image")),
      body: Column(children: [Center(child: Text("Add Multi Image Screen"))]),
    );
  }
}
