import 'package:ecommerce_app/features/auth/data/models/authmodel.dart';
import 'package:ecommerce_app/features/auth/data/models/signuprequestmodel.dart';

abstract class AuthRemoteDs {
  Future<AuthModel> signup({SignupRequestModel? request});
}
