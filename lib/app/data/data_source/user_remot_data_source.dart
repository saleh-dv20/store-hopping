import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homy_desine/app/data/modles/user_modle.dart';

abstract class BaseProfileRemotDataSource {
  Future<ProfileModle> getUser();
}

class ProfileRemotDataSource extends BaseProfileRemotDataSource {
  final _db = FirebaseFirestore.instance;
  final _usId = FirebaseAuth.instance;
  
  @override
  Future<ProfileModle> getUser() async{ 
    final response = await _db
        .collection('users')
        .where('user id', isEqualTo: _usId.currentUser!.uid)
        .get();
    final data = response.docs.map((e) => ProfileModle.fromSnapshote(e)).single;
    return data;
  }
}
