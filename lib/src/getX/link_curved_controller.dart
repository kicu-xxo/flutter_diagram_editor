import 'package:get/get.dart';

class LinkCurvedController extends GetxController {
  bool isCurved = false;

  changeIsCurved(bool newIsCurved) {
    isCurved = newIsCurved;
    print(isCurved);
  }
}
