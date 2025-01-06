import 'package:chatapp/presentation/controllers/app_controller.dart';
import 'package:get/get.dart';

abstract class BaseController<C> extends GetxController {
  final appController = Get.find<AppController>();

  final isPageLoading = false.obs;

  void pageLoadingOn() => isPageLoading.value = true;
  void pageLoadingOff() => isPageLoading.value = false;

  bool get pageLoading => isPageLoading.value;
}