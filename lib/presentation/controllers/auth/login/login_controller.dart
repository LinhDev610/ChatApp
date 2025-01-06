import 'package:chatapp/app/helpers/snack_bar_helper.dart';
import 'package:chatapp/app/routes/app_routes.dart';
import 'package:chatapp/domain/repositories/user_repository.dart';
import 'package:chatapp/presentation/controllers/base_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  final userRepository = Get.find<UserRepository>();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Kiểm tra tính hợp lệ của email và mật khẩu
    if (!isValidEmail(email)) {
      SnackBarHelper.errorSnackBar('Please enter a valid email address!');
      return;
    }
    if (password.isEmpty || password.length < 6) {
      SnackBarHelper.errorSnackBar(
          'Password must be at least 6 characters long!');
      return;
    }

    try {
      pageLoadingOn();

      // Gửi yêu cầu đăng nhập
      await userRepository.login(
          email: emailController.text, password: passwordController.text);

      SnackBarHelper.successSnackBar('Logged in successfully');
      await onChat();
    } on FirebaseAuthException catch (e) {
      // Xử lý lỗi cụ thể từ Firebase
      String errorMessage = 'An error occurred!';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email!';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided!';
      }
      SnackBarHelper.errorSnackBar(errorMessage);
    } catch (e) {
      // Xử lý lỗi khác
      print("Error in loginUser: $e");
      SnackBarHelper.errorSnackBar('Error: ${e.toString()}');
    } finally {
      pageLoadingOff();
    }
  }

  // Hàm kiểm tra tính hợp lệ của email
  bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
    );
    return emailRegex.hasMatch(email);
  }

  Future<void> onChat() async {
    try {
      Get.offNamed(AppRoutes.chat);
    } catch (e) {
      SnackBarHelper.errorSnackBar('Error navigating to chat: ${e.toString()}');
    }
  }
}
