import 'package:chatapp/app/services/user_service.dart';
import 'package:chatapp/domain/repositories/user_repository.dart';
import 'package:chatapp/presentation/controllers/app_controller.dart';
import 'package:chatapp/presentation/controllers/auth/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => UserService());
    Get.lazyPut(() => AppController());
  }
}