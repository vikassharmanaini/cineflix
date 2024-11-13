import 'dart:developer';

import 'package:cineflix/controllers/authController.dart';
import 'package:cineflix/resources/colors.dart';
import 'package:cineflix/widgets/AppButtons.dart';
import 'package:cineflix/widgets/app_text_feild.dart';
import 'package:cineflix/widgets/commonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CreateProfileView extends StatelessWidget {
  CreateProfileView({super.key});
  final _controller = Get.find<Authcontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBar(),
            height_space(10),
            Center(
              child: logoWidget(),
            ),
            height_space(60),
            Expanded(
              child: SizedBox(
                width: 366,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 69,
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      'Complete Your Profile',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      'Almost There! Just a Few Details',
                                      style: TextStyle(
                                        color: Color(0xFFCCCCCC),
                                        fontSize: 20,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 36),
                            AppTextFeild(
                              text: "".obs,
                              hinttext: "Full Name",
                              EC: _controller.name,
                            ),
                            const SizedBox(height: 36),
                            AppTextFeild(
                              text: "".obs,
                              placeholder: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      color: Color(0xFF8596A2),
                                      fontSize: 16,
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                      height: 0.07,
                                      letterSpacing: 0.20,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  SizedBox(
                                    width: 8,
                                    height: 20,
                                    child: Text(
                                      '*',
                                      style: TextStyle(
                                        color: Color(0xFFE50914),
                                        fontSize: 16,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w400,
                                        height: 0.07,
                                        letterSpacing: 0.20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              EC: _controller.email,
                            ),
                            const SizedBox(height: 36),
                            AppTextFeild(
                              ontap: () async {
                                log("message");
                                final date = await showDatePicker(
                                    builder: (context, child) => Theme(
                                        data: ThemeData(
                                          colorScheme: ColorScheme.dark(
                                            primary: AppColors().indicator,
                                            onPrimary: Colors
                                                .white, // header text color
                                            onSurface: Colors.white,
                                          ),
                                        ),
                                        child: child!),
                                    context: context,
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime.now());
                                if (date != null) {
                                  _controller.dob.text =
                                      DateFormat('dd/MM/y').format(date);
                                }
                              },
                              enable: false,
                              suffix: Icon(
                                Icons.calendar_month_outlined,
                                color: AppColors().indicator,
                              ),
                              text: "".obs,
                              placeholder: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Date of Birth',
                                          style: TextStyle(
                                            color: Color(0xFF8596A2),
                                            fontSize: 16,
                                            fontFamily: 'SF Pro',
                                            fontWeight: FontWeight.w400,
                                            height: 0.07,
                                            letterSpacing: 0.20,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        SizedBox(
                                          width: 8,
                                          height: 20,
                                          child: Text(
                                            '*',
                                            style: TextStyle(
                                              color: Color(0xFFE50914),
                                              fontSize: 16,
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.w400,
                                              height: 0.07,
                                              letterSpacing: 0.20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Container(
                                    width: 24,
                                    height: 24,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [],
                                    ),
                                  ),
                                ],
                              ),
                              EC: _controller.dob,
                            ),
                            const SizedBox(height: 36),
                            Container(
                              width: 114,
                              height: 114,
                              clipBehavior: Clip.hardEdge,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFF2AA4C),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: GestureDetector(
                                onTap: () async {
                                  final image = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  if (image != null) {
                                    _controller.imagedata.value =
                                        await image.readAsBytes();
                                  }
                                },
                                child: Obx(
                                  () => Container(
                                    decoration: BoxDecoration(
                                        image: _controller
                                                .imagedata.value.isNotEmpty
                                            ? DecorationImage(
                                                image: MemoryImage(_controller
                                                    .imagedata.value),
                                                fit: BoxFit.cover)
                                            : null),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 114,
                                          height: 23,
                                          decoration: BoxDecoration(
                                            color: Colors.black
                                                .withOpacity(0.699999988079071),
                                          ),
                                          child: const Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Add Picture',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontFamily: 'SF Pro Display',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0.12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 62),
                      AppButtons().primary_button(
                          label: "Save and Next",
                          isdissable: true,
                          callback: _controller.createProfile)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
