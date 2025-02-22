import 'package:get/get.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:three_dimensional_display/controllers/bottom_sheet_controller.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    controllerA = Flutter3DController();
    controllerB = Flutter3DController();
    load3DAssets();
  }

  late Flutter3DController controllerA;
  late Flutter3DController controllerB;

  final RxString _avatarA = "assets/anim_a_col.glb".obs;
  String get avatarA => _avatarA.value;

  final RxString _avatarB = "assets/anim_b_col.glb".obs;
  String get avatarB => _avatarB.value;

  final RxBool _play = false.obs;
  bool get play => _play.value;

  final RxBool _onLoadA = false.obs;
  bool get onLoadA => _onLoadA.value;

  final RxBool _onLoadB = false.obs;
  bool get onLoadB => _onLoadB.value;

  Future<void> load3DAssets() async {
    controllerA.onModelLoaded.addListener(() async {
      _onLoadA.value = true;
    });

    controllerB.onModelLoaded.addListener(() async {
      _onLoadB.value = true;
    });
  }

  void onReset() {
    controllerA.resetAnimation();
    controllerB.resetAnimation();
    controllerA.pauseAnimation();
    controllerB.pauseAnimation();
    _avatarA.value = "assets/anim_a_col.glb";
    _avatarB.value = "assets/anim_b_col.glb";
    Get.find<BottomSheetController>().onChangeAvatarA("Ashley");
    Get.find<BottomSheetController>().onChangeAvatarB("Chloe");
  }

  void onChangeAvatarA(String avatarPath) {
    _avatarA.value = "file://$avatarPath";
  }

  void onChangeAvatarB(String avatarPath) {
    _avatarB.value = "file://$avatarPath";
  }

  void onPlay() {
    if (onLoadA && onLoadB) {
      controllerA.playAnimation();
      controllerB.playAnimation();
      _play.value = true;
    }
  }

  void onPause() {
    if (onLoadA && onLoadB) {
      controllerA.pauseAnimation();
      controllerB.pauseAnimation();
      _play.value = false;
    }
  }
}
