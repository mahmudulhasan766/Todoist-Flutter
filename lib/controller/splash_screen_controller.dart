import 'package:get/get.dart';

class SplashScreenController extends GetxController{
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3))
        .then((_) => Get.offAndToNamed('/home'));
    super.onInit();
  }



}