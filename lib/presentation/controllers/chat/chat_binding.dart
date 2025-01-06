import 'package:chatapp/domain/repositories/user_repository.dart';
import 'package:chatapp/presentation/controllers/chat/chat_controller.dart';
import 'package:get/get.dart';
import 'package:chatapp/app/services/user_service.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserService());
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => UserRepository());
  }
}
