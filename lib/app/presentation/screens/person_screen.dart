import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/controller/auth_controller.dart';
import 'package:homy_desine/app/presentation/controller/main_controller.dart';
import 'package:homy_desine/core/constans/is_loading.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/strings_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final  authController = Get.find<AuthController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.praymColor,
        body: Stack(
          children: [
            //! Left Side ...
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: AppSize.s80,
                height: double.infinity,
                color: ColorManager.sideColor,
              ),
            ),

            //! person ..side
            Positioned(
              top: AppSize.s60,
              left: AppSize.s20,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.s15,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: AppSize.s100,
                          height: AppSize.s150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(StringManager.logo),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: AppSize.s10,
                        ),
                        GetX<MainController>(
                          builder: (controller) {
                            return controller.isLoa.value
                                ? loading()
                                : Column(
                                    children: [
                                      Text(
                                        controller.data.name,
                                        style: const TextStyle(
                                          fontSize: AppSize.s15,
                                          color: ColorManager.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: AppSize.s10,
                                      ),
                                      Text(
                                        controller.data.email,
                                        style: TextStyle(
                                          fontSize: AppSize.s15,
                                          color: ColorManager.grey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //! center
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: AppSize.s200, left: AppSize.s20),
                child: Text(
                  StringManager.options,
                  //  to white color
                  style: TextStyle(
                    fontSize: AppSize.s15,
                    color: ColorManager.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            //! bottom ...side
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: AppSize.s20),
                // color: ColorManager.white,
                height: AppSize.s400,
                width: double.infinity,
                child: Column(
                  children: [
                    optionsWidget(
                      context,
                      option: StringManager.myAccount,
                      icons: Icons.account_circle,
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    optionsWidget(
                      context,
                      option: StringManager.setting,
                      icons: Icons.settings,
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    InkWell(
                      onTap: () {
                        authController.signOut();
                      },
                      child: optionsWidget(
                        context,
                        option: StringManager.logout,
                        icons: Icons.logout_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container optionsWidget(
    BuildContext context, {
    required String option,
    required IconData icons,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s10),
      margin: const EdgeInsets.symmetric(horizontal: AppSize.s10),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      height: AppSize.s80,
      child: Row(
        children: [
          Icon(
            icons,
            color: ColorManager.black,
            size: AppSize.s30,
          ),
          const Spacer(),
          Text(
            option,
            // to white color
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
