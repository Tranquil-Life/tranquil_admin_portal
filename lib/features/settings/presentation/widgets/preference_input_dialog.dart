import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart' as fcp;
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_button.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/features/settings/domain/entities/affirmation.dart';
import 'package:tranquil_admin_portal/features/settings/presentation/controllers/affirmation_controller.dart';

void showPrefInputDialog(
    {required BuildContext context,
    required AffirmationController affirmationController,
    Affirmation? preference}) {
  showDialog(
    context: context,
    builder: (context) {
      PlatformFile? selectedFile;
      final titleController = TextEditingController();
      final descriptionController = TextEditingController();
      Color? selectedColor;

      if (preference != null) {
        titleController.text = preference.title;
        descriptionController.text = preference.description;
        selectedColor ??= (preference.color?.isNotEmpty == true)
            ? Color(int.parse(preference.color!))
            : Colors.blue;

        // if (preference.icon != null) {
        //   setState(() {
        //     selectedFile = svgStringToPlatformFile(preference.icon!);
        //   });
        // }
      }

      return StatefulBuilder(
        builder: (context, setState) {


          return AlertDialog(
            backgroundColor: AppColors.white,
            title:
                Text("${preference != null ? "Edit" : "Add new"} preference"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: "Title",
                      labelStyle: TextStyle(color: AppColors.green),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Description
                  TextField(
                    controller: descriptionController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: "Description",
                      labelStyle: TextStyle(color: AppColors.green),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // File Upload
                  SizedBox(
                      width: 150,
                      child: CustomButton(
                        bgColor: AppColors.white,
                        onPressed: () async {
                          final result = await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['svg']);
                          if (result != null) {
                            setState(() {
                              selectedFile = result.files.single;
                            });
                          }
                        },
                        child: const CustomText(
                          text: "Upload File",
                          color: AppColors.green,
                        ),
                      )),
                  if (selectedFile != null && selectedFile!.name.isNotEmpty)
                    Text(
                      selectedFile!.name,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  const SizedBox(height: 10),

                  // Color Picker
                  Row(
                    children: [
                      const Text("Pick Color: "),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                  title: const Text("Select a color"),
                                  content: Container(
                                    child: Column(
                                      children: [
                                        fcp.ColorPicker(
                                            pickerColor: Colors.black,
                                            hexInputBar: true,
                                            onColorChanged: (color) {
                                              setState(() {
                                                selectedColor = color;
                                              });
                                            }),
                                        SizedBox(height: 32),
                                        SizedBox(
                                            width: 200,
                                            child: CustomButton(
                                              onPressed: () => Get.back(),
                                              text: "Done",
                                            ))
                                      ],
                                    ),
                                  )

                                  // fcp.ColorPickerInput(
                                  //   Colors.blue,
                                  //   (color) {
                                  //     setState(() {
                                  //       selectedColor = color;
                                  //     });
                                  //     // Navigator.of(context).pop();
                                  //   },
                                  // )
                                  //
                                  // fcp.BlockPicker(
                                  //   pickerColor: selectedColor,
                                  //   onColorChanged: (color) {
                                  //     setState(() {
                                  //       selectedColor = color;
                                  //     });
                                  //     Navigator.of(context).pop();
                                  //   },
                                  // ),
                                  );
                            },
                          );
                        },
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: selectedColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black26),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,

                    child: CustomButton(onPressed: ()=>Get.back(), text: "Cancel", bgColor: AppColors.white, textColor: AppColors.green),
                  ),

                  SizedBox(width: 22),

                  Expanded(
                    flex: 1,
                    child: CustomButton(
                      onPressed: () async {
                        if (preference != null) {
                          await affirmationController.editPreference(
                              title: titleController.text,
                              description: descriptionController.text,
                              svgFile: selectedFile,
                              color: '0x${selectedColor?.value.toRadixString(16)}',
                              id: preference.id!);

                          Get.back();
                        } else {
                          await affirmationController.addPreference(
                              title: titleController.text,
                              description: descriptionController.text,
                              svgFile: selectedFile,
                              color: '0x${selectedColor?.value.toRadixString(16)}');

                          Get.back();
                        }
                      },
                      child:
                      const CustomText(text: "Submit", color: AppColors.white),
                    ),
                  )
                ],
              )
            ],
          );
        },
      );
    },
  );
}
