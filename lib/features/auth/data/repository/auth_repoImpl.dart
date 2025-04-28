import 'package:ecommerce_app/features/auth/data/datasources/remote/auth_remote_ds.dart';
import 'package:ecommerce_app/features/auth/data/models/authmodel.dart';
import 'package:ecommerce_app/features/auth/data/models/signuprequestmodel.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRemoteDs authRemoteDs;
  AuthRepoImpl({required this.authRemoteDs});
  @override
  Future<AuthModel> signup({required SignupRequestModel request}) async {
    try {
      AuthModel authModel = await authRemoteDs.signup(request: request);
      return authModel;
    } catch (e) {
      rethrow;
    }
  }
}
