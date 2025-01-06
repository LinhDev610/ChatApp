import 'package:chatapp/app/helpers/snack_bar_helper.dart';
import 'package:chatapp/app/routes/app_routes.dart';
import 'package:chatapp/domain/repositories/user_repository.dart';
import 'package:chatapp/presentation/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends BaseController {
  final userRepository = Get.find<UserRepository>();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  Future<void> registerUser() async {
    try {
      pageLoadingOn();
      userRepository.signup(
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );
      SnackBarHelper.successSnackBar('Account created successfully');
      await onLogin();
    } catch (e) {
      SnackBarHelper.errorSnackBar(e.toString());
    } finally {
      pageLoadingOff();
    }
  }

  Future<void> onLogin() async {
    try {
      Get.offNamed(AppRoutes.login);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
