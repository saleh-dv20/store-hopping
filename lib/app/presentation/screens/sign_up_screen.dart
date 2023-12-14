import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/controller/auth_controller.dart';
import 'package:homy_desine/app/presentation/widgets/auth_widget/textfield_widget.dart';
import 'package:homy_desine/core/getx/route/route.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/strings_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> fromState = GlobalKey();
    // new members
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! Image ...side
          Container(
            width: AppSize.s280,
            margin: const EdgeInsets.only(
                top: AppSize.s30, left: AppSize.s10, bottom: 20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    IconManager.backArrowForward,
                    color: ColorManager.white,
                  ),
                ),
                const SizedBox(
                  width: 120,
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: AppSize.s22,
                    color: ColorManager.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: AppSize.s30,
          ),
          //! Sign ...side
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s90),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: AppSize.s50, left: 20, right: 20),
                child: GetBuilder<AuthController>(
                  builder: (controller) => Form(
                    key: fromState,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: AppSize.s30,
                          ),
                          //! Name side...
                          textFieldWidget(
                            TextInputType.name,
                            labelText: StringManager.first,
                            controller: controller.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return StringManager.emptyName;
                              }
                              if (value.length > 8) {
                                return StringManager.longName;
                              }
                              if (value.length < 3) {
                                return StringManager.shortName;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: AppSize.s30,
                          ),
                          //! Last Name side...
                          textFieldWidget(
                            TextInputType.name,
                            labelText: StringManager.last,
                            controller: controller.last,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return StringManager.emptyName;
                              }
                              if (value.length > 8) {
                                return StringManager.longName;
                              }
                              if (value.length < 3) {
                                return StringManager.shortName;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: AppSize.s30,
                          ),
                          //! Email side...
                          textFieldWidget(
                            TextInputType.emailAddress,
                            labelText: StringManager.email,
                            controller: controller.email,
                            validator: (value) {
                              if (!RegExp(StringManager.emailVali)
                                  .hasMatch(value!)) {
                                return StringManager.valiedEmail;
                              }

                              return null;
                            },
                          ),
                          const SizedBox(
                            height: AppSize.s30,
                          ),
                          //! Phone number side...
                          textFieldWidget(
                            TextInputType.phone,
                            labelText: StringManager.phone,
                            controller: controller.phpne,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return StringManager.emptyName;
                              }
                              if (value.length > 10 && value.length <= 9) {
                                return StringManager.longNamber;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: AppSize.s30,
                          ),
                          //! Password ...side
                          textFieldWidget(
                            TextInputType.visiblePassword,
                            labelText: StringManager.password,
                            controller: controller.pass,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return StringManager.emptyPassword;
                              }
                              if (value.length > 12 && value.length <= 6) {
                                return StringManager.passwordRole;
                              }
                              return null;
                            },
                            obscureText: controller.isVisible,
                            icon: IconButton(
                              onPressed: () {
                                controller.visible();
                              },
                              icon: controller.isVisible
                                  ? const Icon(
                                      IconManager.unVisible,
                                      color: ColorManager.black,
                                    )
                                  : const Icon(
                                      IconManager.visible,
                                      color: ColorManager.black,
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s50,
                          ),
                          InkWell(
                            onTap: () {
                              //! go to wlecom screen
                              if (fromState.currentState!.validate()) {                                
                                controller.signUp(
                                  name: controller.name.text,
                                  last: controller.last.text,
                                  emaill: controller.email.text,
                                  phopne: controller.phpne.text,
                                  pass: controller.pass.text,
                                );
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: AppSize.s50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: ColorManager.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                child: Text(
                                  StringManager.login,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s50,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(RouteName.signInScreen);
                            },
                            child: Text(
                              StringManager.haveAcount,
                              style: const TextStyle(
                                fontSize: 13,
                                color: ColorManager.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
