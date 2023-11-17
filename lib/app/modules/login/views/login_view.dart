import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/constants.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_fields.dart';
import '../../../components/custom_textview.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode emailFocus = FocusNode();
    FocusNode passwordFocus = FocusNode();
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(''),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(Constants.bgFooter),
            ),
          ),
          Form(
            key: _formKey,
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Constants.loginHeading,
                        style: CustomTextView.getStyle(context,
                            colorLight: Colors.black,
                            fontSize: 18.sp,
                            fontFamily: Constants.interSemiBold),
                      ),
                      Obx(
                        () => CustomTextField(
                          focusNode: emailFocus,
                          cursorColor: ColorsUtils.textColor,
                          autofocus: true,
                          isPassword: controller.isPasswordVisible.value,
                          labelText: "Email address",
                          hintText: "Enter your email address",
                          // onChangedData: (value) {
                          //   // controller.emailText.value = value!;
                          // },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email address';
                            } else if (!GetUtils.isEmail(value)) {
                              return 'Incorrect email address';
                            }
                            return null;
                          },
                          // onSaved: (String? value) {},
                          controller: controller.emailController,
                        ),
                      ),
                      Obx(
                        () => CustomTextField(
                          focusNode: passwordFocus,
                          cursorColor: ColorsUtils.textColor,
                          autofocus: true,
                          obscureText: controller.isPasswordVisible.value,
                          isPassword: controller.isPasswordVisible.value,
                          labelText: "Password",
                          hintText: "Enter your password",
                          suffixIcon: IconButton(
                            onPressed: () =>
                                controller.isPasswordVisible.toggle(),
                            icon: controller.isPasswordVisible.value
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: ColorsUtils.primary,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: ColorsUtils.primary,
                                  ),
                          ),
                          // onChangedData: (value) {
                          //   //  controller.emailText.value = value!;
                          // },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          // onSaved: (String? value) {},
                          controller: controller.passwordController,
                        ),
                      ),

                      // if (controller.error.value.isNotEmpty)
                      Obx(
                        () => Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            " ${controller.error.value}",
                            style: CustomTextView.getStyle(context,
                                colorLight: Colors.red,
                                fontSize: 10.sp,
                                fontFamily: Constants.interRegular),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: ColorsUtils.secondary,
                              ))
                            : CustomButton(
                                title: Constants.btnTxtLogin,
                                onPressed: () {
                                  controller.error.value = '';
                                  if (_formKey.currentState!.validate()) {
                                    controller.fetchUsers();
                                  } else {
                                    //  has validation errors, enable error borders
                                    _formKey.currentState!.validate();
                                  }
                                },
                                buttonColor: ColorsUtils.secondary,
                                textColor: Colors.white,
                              ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ]),
              ),
            ]),
          )
        ]));
  }
}
