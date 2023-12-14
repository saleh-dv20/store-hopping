import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homy_desine/core/getx/route/route.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  //
  TextEditingController name = TextEditingController();
  TextEditingController last = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phpne = TextEditingController();
  TextEditingController pass = TextEditingController();
  //
  bool isVisible = true;
  void visible() {
    isVisible = !isVisible;
    update();
  }

  //
  //! Sign Up ...method
  void signUp({
    required String name,
    required String last,
    required String emaill,
    required String phopne,
    required String pass,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emaill,
        password: pass,
      );
      await _users.add({
        'frist': name,
        'name': '$name $last',
        'email': emaill,
        'phone': phopne,
        'user id': _auth.currentUser!.uid,
      });
      update();
      Get.offNamed(RouteName.mainSceern);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ');
      String massage = '';
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        massage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
        massage = 'The account already exists for that email.';
      } else {
        massage = e.message.toString();
      }
      Get.snackbar(
        title,
        massage,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
     
      Get.snackbar(
        e.toString(),
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
  }

  //! log In ...method
  void logIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      update();
      Get.offNamed(RouteName.mainSceern);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ');
      String massage = '';
      if (e.code == 'user-not-found') {
        massage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided for that user.');
        massage = 'Wrong password provided for that user.';
      }
      Get.snackbar(
        title,
        massage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //! Forget Password...method
  void forgetPassword({
    required String email,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email,
      );
      update();
    } on FirebaseAuthException catch (e) {
      String title = e.code;
      String massage = '';
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        massage = 'The password provided is too weak.';
      } else {
        massage = e.message.toString();
      }
      Get.snackbar(
        title,
        massage,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      
      Get.snackbar(
        e.toString(),
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //! Sign Out ...method
  void signOut() {
    Get.defaultDialog(
      title: 'Sing Out',
      middleText: 'Are you sure?',
      middleTextStyle: const TextStyle(
        color: ColorManager.black,
        fontSize: AppSize.s15,
      ),
      onConfirm: () async {
        await _auth.signOut();
        Get.offAllNamed(RouteName.signInScreen);
      },
      onCancel: () {
        Get.back();
      },
    );
  }
}
