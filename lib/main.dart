import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homy_desine/firebase_options.dart';

import 'core/getx/route/route.dart';
import 'core/manager/themes_manager.dart';
import 'core/service/servisce_locator.dart';

late bool isExsets;
void main() async {
  ServiceLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isExsets = false;
  } else {
    isExsets = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeManager(),
      initialRoute: isExsets ? RouteName.mainSceern : RouteName.signInScreen,
      getPages: RoutPages.page,
    );
  }
}
