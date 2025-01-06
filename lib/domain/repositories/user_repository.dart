import 'package:chatapp/app/services/user_service.dart';
import 'package:chatapp/domain/repositories/base_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends BaseRepository {

  final _userService = Get.find<UserService>();

  Future<void> login({required String email, required String password}) async {
    await _userService.login(email: email, password: password);
  }

  Future<void> signup({required String email, required String password, required String confirmPassword}) async{
    if (confirmPassword == password) {
      await _userService.signup(email: email, password: password, confirmPassword: confirmPassword);
    } else {
      Get.snackbar(
        'Error',
        'Xác thực mật khẩu không khớp!',
        colorText: Colors.white,
        backgroundColor: Colors.black54,
      );
    }

  }

  Future<void> logout() => _userService.logout();
}