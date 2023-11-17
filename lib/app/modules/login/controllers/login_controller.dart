import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_store_horizon/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/api_endpoints.dart';
import '../../../models/user_model.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordVisible = true.obs;
  final isLoading = false.obs;
  final error = ''.obs;
  final RxBool isLoggedIn = false.obs;
  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  List<UserModel> users = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    // Reset form fields or clear data
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> fetchUsers() async {
    final box = GetStorage();
    try {
      isLoading(true);
      var email = emailController.text;
      var password = passwordController.text;
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      final response = await http.get(url).timeout(const Duration(minutes: 1));
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the users from the JSON
        final List<dynamic> data = jsonDecode(response.body);

        users = data.map((userJson) => UserModel.fromJson(userJson)).toList();

        box.write('userId', users[0].id);

        print("user is ${users[0].id}");
        login(email, password);
      } else {
        if (response.statusCode == 401) {
          error.value = "Unauthorized access";
        } else {
          error.value = "Failed to load users";
        }
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } on TimeoutException {
      // Handle timeout exception
      error.value = "Request timed out. Please try again.";
    } on SocketException {
      // Handle SocketException (network error)
      error.value = "Network error. Please check your internet connection.";
    } catch (exceptionError) {
      // Handle other exceptions, such as parsing errors
      error.value = "Unauthorized access";
    } finally {
      isLoading(false);
    }
  }

  void login(String email, String password) {
    // Check if the provided email and password match any user in the list
    final authenticatedUser = users.firstWhereOrNull(
      (user) => user.email == email && user.password == password,
    );
    if (authenticatedUser != null) {
      isLoading(false);
      // Authentication successful
      isLoggedIn.value = true;
      currentUser.value = authenticatedUser;
      Get.snackbar('Success', 'Login successful',
          backgroundColor: Colors.green, snackPosition: SnackPosition.BOTTOM);
      // Navigate to the next screen or perform other actions as needed
      Get.offAndToNamed(Routes.PRODUCTS);
    } else {
      isLoading(false);
      // Authentication failed
      error.value = "Invalid email or password";
    }
  }
}
