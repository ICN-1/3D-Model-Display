import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_dimensional_display/controllers/home_controller.dart';
import 'package:three_dimensional_display/controllers/theme_controller.dart';

class BottomSheetController extends GetxController {
  ThemeController themeController = Get.put(ThemeController());

  @override
  void onInit() {
    super.onInit();

    loadTheme();
  }

  final RxString _lightThemeValue = "light".obs;
  String get lightThemeValue => _lightThemeValue.value;

  final RxString _darkThemeValue = "dark".obs;
  String get darkThemeValue => _darkThemeValue.value;

  final RxString _selectedThemeValue =
      ThemeMode.system == ThemeMode.light ? "light".obs : "dark".obs;
  String get selectedThemeValue => _selectedThemeValue.value;

  final RxString _selectedAvatarA = "Ashley".obs;
  String get selectedAvatarA => _selectedAvatarA.value;

  final RxString _selectedAvatarAPath = "".obs;
  String get selectedAvatarAPath => _selectedAvatarAPath.value;

  final RxString _selectedAvatarB = "Chloe".obs;
  String get selectedAvatarB => _selectedAvatarB.value;

  final RxString _selectedAvatarBPath = "".obs;
  String get selectedAvatarBPath => _selectedAvatarBPath.value;

  void loadTheme() {
    _selectedThemeValue.value =
        themeController.currentTheme == ThemeMode.light ? "light" : "dark";
  }

  void onThemeSelected(String theme) {
    _selectedThemeValue.value = theme;
  }

  Future<void> selectAnAvatar(String avatar) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path!.endsWith('.glb')) {
      if (avatar == "a") {
        _selectedAvatarA.value = result.files.single.name;
        _selectedAvatarAPath.value = result.files.single.path ?? "";
      } else {
        _selectedAvatarB.value = result.files.single.name;
        _selectedAvatarBPath.value = result.files.single.path ?? "";
      }
    } else {
      Get.snackbar("Unaccepted File Input", "Select a .glb file.");
    }
  }

  void onChangeAvatarA(String avatarName) {
    _selectedAvatarA.value = avatarName;
    _selectedAvatarAPath.value = "";
  }

  void onChangeAvatarB(String avatarName) {
    _selectedAvatarB.value = avatarName;
    _selectedAvatarBPath.value = "";
  }

  void onDiscard() {
    Get.back();
  }

  void onSave() {
    themeController.onSetCurrent(selectedThemeValue);
    if (selectedAvatarAPath != "") {
      Get.find<HomeController>().onChangeAvatarA(selectedAvatarAPath);
      // homeController.onChangeAvatarA(selectedAvatarAPath);
    } else if (selectedAvatarBPath != "") {
      Get.find<HomeController>().onChangeAvatarB(selectedAvatarBPath);
      // homeController.onChangeAvatarB(selectedAvatarBPath);
    }
    Get.back();
  }
}
