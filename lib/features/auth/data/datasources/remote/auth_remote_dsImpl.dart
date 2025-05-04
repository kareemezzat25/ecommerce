import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/resources/endpoints.dart';
import 'package:ecommerce_app/features/auth/data/datasources/remote/auth_remote_ds.dart';
import 'package:ecommerce_app/features/auth/data/models/authmodel.dart';
import 'package:ecommerce_app/features/auth/data/models/signuprequestmodel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDs)
class AuthRemoteDsImpl implements AuthRemoteDs {
  ApiManager apimanager;

  AuthRemoteDsImpl({required this.apimanager});
  @override
  Future<AuthModel> signup({SignupRequestModel? request}) async {
    var result =
        await apimanager.postData(AppEndpoints.signUp, request!.toJson());
    AuthModel authModel = AuthModel.fromJson(result.data);

    return authModel;
  }

  @override
  Future<AuthModel> signIn({String? email, String? password}) async {
    var result = await apimanager
        .postData(AppEndpoints.signIn, {"email": email, "password": password});

    AuthModel authModel = AuthModel.fromJson(result.data);
    return authModel;
  }
}
