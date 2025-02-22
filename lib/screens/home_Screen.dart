import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:get/get.dart';
import 'package:three_dimensional_display/utils/constants/app_colors.dart';
import 'package:three_dimensional_display/widgets/bottom_sheet_dialog.dart';
import '../controllers/home_controller.dart';
import '../controllers/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    ThemeController themeController = Get.put(ThemeController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Avatar Display",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color:
                themeController.currentTheme == ThemeMode.light
                    ? AppColors.white
                    : AppColors.black,
          ),
        ),
        backgroundColor: AppColors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => homeController.onReset(),
                    child: Icon(Icons.replay, size: 28.0, weight: 80,),
                  ),

                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isDismissible: false,
                        enableDrag: false,
                        builder: (BuildContext context) {
                          return const BottomSheetDialog();
                        },
                      );
                    },
                    child: Icon(Icons.settings, size: 28.0),
                  ),
                ],
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 500,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          height: 400,
                          child: Obx(
                            () => Flutter3DViewer(
                              src: homeController.avatarA,
                              controller: homeController.controllerA,
                              activeGestureInterceptor: true,
                              progressBarColor: Colors.orange,
                              enableTouch: true,
                              onProgress: (double progressValue) {
                                debugPrint(
                                  'model loading progressA : $progressValue',
                                );
                              },
                              onLoad: (String modelAddress) {
                                debugPrint('model loadedA : $modelAddress');
                              },
                              onError: (String error) {
                                debugPrint('model failed to loadA : $error');
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          height: 400,
                          child: Obx(
                            () => Flutter3DViewer(
                              src: homeController.avatarB,
                              controller: homeController.controllerB,
                              activeGestureInterceptor: true,
                              progressBarColor: Colors.orange,
                              enableTouch: true,
                              onProgress: (double progressValue) {
                                debugPrint(
                                  'model loading progressB : $progressValue',
                                );
                              },
                              onLoad: (String modelAddress) {
                                debugPrint('model loadedB : $modelAddress');
                              },
                              onError: (String error) {
                                debugPrint('model failed to loadB : $error');
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),

              Obx(
                () => GestureDetector(
                  onTap: () {
                    homeController.play == false
                        ? homeController.onPlay()
                        : homeController.onPause();
                  },
                  child: Icon(
                    homeController.play == true
                        ? Icons.pause_circle_filled_rounded
                        : Icons.play_circle_fill_rounded,
                    size: 52,
                    color:
                        homeController.play == true
                            ? AppColors.red
                            : AppColors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
