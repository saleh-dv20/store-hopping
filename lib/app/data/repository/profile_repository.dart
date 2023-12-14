import 'package:homy_desine/app/data/data_source/user_remot_data_source.dart';
import 'package:homy_desine/app/domain/entities/profile_entites.dart';
import 'package:homy_desine/app/domain/repository/base_user_rpository.dart';

class ProfileRepository extends BaseProfileRepository {
  final BaseProfileRemotDataSource baseProfileRemotDataSource;
  ProfileRepository({required this.baseProfileRemotDataSource});

  @override
  Future<ProfileEntitie> getUser() async {
    return await baseProfileRemotDataSource.getUser();
  }
}
