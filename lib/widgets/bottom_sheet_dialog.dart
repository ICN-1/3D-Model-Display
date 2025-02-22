import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_dimensional_display/controllers/bottom_sheet_controller.dart';
import 'package:three_dimensional_display/controllers/theme_controller.dart';
import 'package:three_dimensional_display/utils/constants/app_colors.dart';
import 'package:three_dimensional_display/widgets/app_buttton.dart';

class BottomSheetDialog extends StatelessWidget {
  const BottomSheetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    BottomSheetController bottomSheetController = Get.put(
      BottomSheetController(),
    );

    ThemeController themeController = Get.put(ThemeController());

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),

                GestureDetector(
                  onTap: () => bottomSheetController.onDiscard(), 
                  child: Icon(
                    Icons.close_rounded, 
                    size: 28.0,
                  ),
                ),
              ],
            ),

            SizedBox(height: 30.0),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "App Theme",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Light Theme",
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Obx(
                      () => Radio<String>(
                        value: bottomSheetController.lightThemeValue,
                        groupValue: bottomSheetController.selectedThemeValue,
                        onChanged:
                            (theme) => bottomSheetController.onThemeSelected(
                              bottomSheetController.lightThemeValue,
                            ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Dark Theme",
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Obx(
                        () => Radio<String>(
                          value: bottomSheetController.darkThemeValue,
                          groupValue: bottomSheetController.selectedThemeValue,
                          onChanged:
                              (theme) => bottomSheetController.onThemeSelected(
                                bottomSheetController.darkThemeValue,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.0),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Change Avatar",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
            ),

            SizedBox(height: 10.0),

            Row(
              children: [
                Text(
                  "First Avatar:  ",
                  style: TextStyle(fontSize: 18.0,),
                ),

                SizedBox(
                  width: 100.0,
                  child: Obx(
                    () => Text(
                      bottomSheetController.selectedAvatarA,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: GestureDetector(
                    onTap: () => bottomSheetController.selectAnAvatar("a"),
                    child: Text(
                      "Change",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.pink,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.0),

            Row(
              children: [
                Text(
                  "Second Avatar:  ",
                  style: TextStyle(fontSize: 18.0,),
                ),

                SizedBox(
                  width: 100.0,
                  child: Obx(
                    () => Text(
                      bottomSheetController.selectedAvatarB,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: GestureDetector(
                    onTap: () => bottomSheetController.selectAnAvatar("b"),
                    child: Text(
                      "Change",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.pink,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),

            AppButtton(
              buttonText: "Save",
              textColor:
                  themeController.currentTheme == ThemeMode.light
                      ? AppColors.white
                      : AppColors.dark,
              backgroundColor: AppColors.pink,
              onPressed: () => bottomSheetController.onSave(),
            ),

            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
