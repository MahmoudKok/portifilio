import 'package:get/get.dart';
import 'package:portifilio/bindings/land_section_binding.dart';

import '../Desktop/widgets/land_section/mobile_land.dart';

class Routes {
  static var pages = [
    GetPage(
      name: '/land',
      page: () => MobileLand(),
      binding: LandSectionBinding(),
    ),
  ];
}
