import 'dart:convert';

import 'package:e_commerce_app/controller/storage_service.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/view/authentication/login_screen.dart';
import 'package:e_commerce_app/view/screens/main_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../constants/url.dart';

class AuthenticationController extends GetxController {
  bool isLoading = false;
  var userList = <UserModel>[];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
    String? avatar,
  }) async {
    try {
      isLoading = true;

      final request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/register"),
      );

      request.fields.addAll({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password_confirmation,
      });

      if (avatar != null) {
        request.files.add(await http.MultipartFile.fromPath('avatar', avatar));
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      final data = jsonDecode(response.body);

      if (response.statusCode == 201) {
        await StorageService.saveToken(data["token"]);
        Get.snackbar(
          "Success",
          "Registration successful",
          backgroundColor: Color(0xFF4BB543),
          colorText: Colors.white,
        );
      } else {
        Get.snackbar("Error", data['message'] ?? 'Register failed');
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading = false;
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await StorageService.saveToken(data['token']);
        Get.snackbar(
          "Success",
          "User logged in successfully",
          backgroundColor: Color(0xFF4BB543),
          colorText: Colors.white,
        );
        Get.offAll(MainScreen());
      } else {
        Get.snackbar("Error", data['message']);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> logoutCurrent() async {
    final token = StorageService.token;

    final response = await http.post(
      Uri.parse("$baseUrl/user/logout-currently"),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      await StorageService.clearToken();
      Get.offAll(LoginScreen());
    }
  }

  Future<void> logoutAll() async {
    final token = StorageService.token;

    final response = await http.post(
      Uri.parse("$baseUrl/user/logoutall"),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      await StorageService.clearToken();
      Get.offAll(LoginScreen());
    }
  }

  Rxn<UserModel> currentUser = Rxn<UserModel>();
  Future<void> getProfile() async {
    try {
      final token = await StorageService.token;
      Uri url = Uri.parse("$baseUrl/user/profile");

      final response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final userJson = jsonDecode(response.body);
        currentUser.value = UserModel.fromJson(userJson["user"]);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // Update user profile
  Future<void> updateProfile({
    required String name,
    required String email,
    String? avatar,
  }) async {
    try {
      isLoading = true;

      final token = await StorageService.token;
      final request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/user/update-profile"),
      );

      request.headers['Authorization'] = 'Bearer $token';
      if (avatar != null) {
        request.files.add(await http.MultipartFile.fromPath('avatar', avatar));
      }

      request.fields.addAll({'name': name});
      request.fields.addAll({'email': email});

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await getProfile();
        Get.snackbar(
          "Success",
          "Profile updated successfully",
          backgroundColor: Color(0xFF4BB543),
          colorText: Colors.white,
        );
      } else {
        Get.snackbar("Error", data['message'] ?? 'Update failed');
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading = false;
    }
  }
}
