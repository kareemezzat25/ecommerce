import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/resources/endpoints.dart';
import 'package:ecommerce_app/features/auth/data/datasources/remote/auth_remote_ds.dart';
import 'package:ecommerce_app/features/auth/data/models/authmodel.dart';
import 'package:ecommerce_app/features/auth/data/models/signuprequestmodel.dart';

class AuthRemoteDsImpl implements AuthRemoteDs {
  ApiManager apimanager;

  AuthRemoteDsImpl({required this.apimanager});
  @override
  Future<AuthModel> signup({SignupRequestModel? request}) async {
    var result =
        await apimanager.postData(AppEndponits.signUp, request!.toJson());
    AuthModel authModel = AuthModel.fromJson(result.data);

    return authModel;
  }
}
