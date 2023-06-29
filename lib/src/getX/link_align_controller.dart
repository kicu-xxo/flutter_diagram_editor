import 'package:get/get.dart';

class LinkAlignController extends GetxController {
  bool isAlignVertically = true;
  String isLineOption = "straight";

  void changeIsAlignHorizontally(bool state) {
    isAlignVertically = state;
    update();
  }

  void changeIsLineOption(String state) {
    isLineOption = state;
    update();
  }
}
