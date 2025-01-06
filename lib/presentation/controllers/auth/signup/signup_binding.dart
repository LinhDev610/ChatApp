import 'package:chatapp/app/services/user_service.dart';
import 'package:chatapp/domain/repositories/user_repository.dart';
import 'package:chatapp/presentation/controllers/app_controller.dart';
import 'package:chatapp/presentation/controllers/auth/signup/signup_controller.dart';
import 'package:get/get.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => UserService());
    Get.lazyPut(() => AppController());
  }
}