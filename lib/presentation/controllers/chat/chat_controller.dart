import 'package:chatapp/app/helpers/snack_bar_helper.dart';
import 'package:chatapp/app/routes/app_routes.dart';
import 'package:chatapp/domain/repositories/user_repository.dart';
import 'package:chatapp/presentation/controllers/base_controller.dart';
import 'package:get/get.dart';

class ChatController extends BaseController {
  final userRepository = Get.find<UserRepository>();

  Future<void> logoutUser() async {
    try {
      pageLoadingOn();
      userRepository.logout();
      SnackBarHelper.successSnackBar('Logged out successfully');
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