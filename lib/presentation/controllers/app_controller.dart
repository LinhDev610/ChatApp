import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatapp/app/services/user_service.dart';
import 'package:chatapp/app/helpers/snack_bar_helper.dart';
import 'package:chatapp/app/routes/app_routes.dart';

class AppController extends GetxController {
  bool isLoggedIn= false;

  init() async {
    await initAuth();
  }

  @override
  void onClose() {
    Get.reset();
    super.onClose();
  }

  Future<void> initAuth() async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      if (user != null) {
        // Nguoi dung da dang nhap
        Get.offNamed(AppRoutes.chat);
        isLoggedIn = true;
      }
    } catch(e) {
      SnackBarHelper.errorSnackBar(e.toString());
    }

    if (!isLoggedIn) {
      await onLogout(isGoToLoginPage: false);
      SnackBarHelper.errorSnackBar('Vui lòng đăng nhập để tiếp tục');
    }
  }

  Future<void> onLogout({bool isGoToLoginPage = true}) async {
    try {
      final userService = Get.find<UserService>();
      await userService.logout();
      if (isGoToLoginPage) {
        Get.offNamed(AppRoutes.login);
      }
    } catch(e) {
      SnackBarHelper.errorSnackBar(e.toString());
    }
  }
}