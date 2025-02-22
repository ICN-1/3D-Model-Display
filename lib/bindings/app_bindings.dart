import 'package:get/get.dart';
import 'package:three_dimensional_display/controllers/bottom_sheet_controller.dart';
import 'package:three_dimensional_display/controllers/home_controller.dart';
import 'package:three_dimensional_display/controllers/theme_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => BottomSheetController());
    Get.lazyPut(() => ThemeController());
  }
}
