import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/controller/auth_controller.dart';
import 'package:homy_desine/app/presentation/widgets/auth_widget/textfield_widget.dart';
import 'package:homy_desine/core/getx/route/route.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/strings_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // old members
    Get.put(AuthController());
    GlobalKey<FormState> fromState = GlobalKey();
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          //! Image ...side
          Container(
            margin: const EdgeInsets.only(top: AppSize.s40),
            width: AppSize.s150,
            height: AppSize.s150,
            decoration: const BoxDecoration(
              color: ColorManager.white,
              image: DecorationImage(
                image: AssetImage(StringManager.logo),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.s20),
                bottomLeft: Radius.circular(AppSize.s20),
                bottomRight: Radius.circular(AppSize.s20),
              ),
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
                    top: AppSize.s50, left: AppSize.s20, right: AppSize.s20),
                child: GetBuilder<AuthController>(
                  builder: (controller) => Form(
                    key: fromState,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              StringManager.login,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s50,
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
                            height: AppSize.s40,
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
                            height: AppSize.s40,
                          ),
                          InkWell(
                            onTap: () async {
                              if (fromState.currentState!.validate()) {
                                controller.logIn(
                                  email: controller.email.text,
                                  password: controller.pass.text,
                                );
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: AppSize.s50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: ColorManager.black,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                              ),
                              child: Text(
                                StringManager.login,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s150,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(RouteName.signUpScreen);
                            },
                            child: const Text(
                              StringManager.noAcount,
                              style: TextStyle(
                                fontSize: AppSize.s15,
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
