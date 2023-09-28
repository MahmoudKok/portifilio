import 'package:get/get.dart';
import 'package:portifilio/Desktop/controllers/land_section_controller.dart';

class LandSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LandSectionController());
  }
}
