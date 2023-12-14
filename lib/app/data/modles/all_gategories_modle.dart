// import 'package:homy_desine/app/domain/entities/all_gategories_entite.dart';

// class AllGategoriesModle extends AllGategoriesEntitie {
//   const AllGategoriesModle({required super.name});
//   //
//   factory AllGategoriesModle.fromJosn(List<String> data) {
//     return AllGategoriesModle(name: List<String>.from(data.map((e) => e)));
//   }
// }

// To parse this JSON data, do
//
//     final gateMo = gateMoFromJson(jsonString);

import 'dart:convert';

List<String> gateMoFromJson(String str) {
  return List<String>.from(json.decode(str).map((x) => x));
}

String gateMoToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
