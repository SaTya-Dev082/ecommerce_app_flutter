// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:e_commerce_app/controller/authentication_controller.dart';
// import 'package:e_commerce_app/model/user_model.dart';
// import 'package:e_commerce_app/view/widgets/reusable_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({super.key, required this.user});
//   final UserModel user;
//
//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }
//
// class _EditProfileScreenState extends State<EditProfileScreen> {
//   final AuthenticationController controller = Get.find();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   String avatar = "";
//   @override
//   void initState() {
//     super.initState();
//     usernameController.text = widget.user.name != null ? widget.user.name! : "";
//     avatar = widget.user.avatar != null ? widget.user.avatar! : "";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBar("Edit Profile"),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: GetBuilder<AuthenticationController>(
//           builder:
//               (controller) => Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     // SizedBox(
//                     //   width: 100,
//                     //   height: 100,
//                     //   child:
//                     //       widget.user.avatar != null
//                     //           ? ClipRRect(
//                     //             borderRadius: BorderRadius.circular(50),
//                     //             child: CachedNetworkImage(
//                     //               imageUrl: "http://10.0.2.2:8000$avatar",
//                     //               width: 90,
//                     //               height: 90,
//                     //               fit: BoxFit.cover,
//                     //             ),
//                     //           )
//                     //           : Image.network(
//                     //             "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
//                     //             fit: BoxFit.cover,
//                     //           ),
//                     // ),
//                     const SizedBox(height: 24),
//                     inputField(
//                       controller: usernameController,
//                       label: "Username",
//                       value: usernameController.text,
//                       icon: Icons.person_outline,
//                     ),
//                     inputField(
//                       controller: emailController,
//                       label: "Email or Phone Number",
//                       value: emailController.text,
//                       icon: Icons.email_outlined,
//                     ),
//                     // const Spacer(),
//                     primaryButton(
//                       "Save Changes",
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           controller.updateProfile(
//                             name: usernameController.text,
//                             email: emailController.text,
//                             avatar: avatar,
//                           );
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//         ),
//       ),
//     );
//   }
// }

import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/view/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/authentication_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key, required this.userModel});
  final UserModel userModel;
  final AuthenticationController controller = Get.find();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Edit Profile"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://i.pinimg.com/736x/51/b6/b4/51b6b404e5a029c5e97087340be4eb90.jpg",
              ),
            ),
            const SizedBox(height: 24),
            inputField(
              label: "Username",
              value: "Satya",
              icon: Icons.person_outline,
              controller: usernameController,
            ),
            inputField(
              label: "Email or Phone Number",
              value: "soeunnoraksatya@gmail.com",
              icon: Icons.email_outlined,
              controller: emailController,
            ),

            primaryButton("Save Changes", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
