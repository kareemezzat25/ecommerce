import 'package:ecommerce_app/features/auth/data/models/authmodel.dart';
import 'package:ecommerce_app/features/auth/data/models/signuprequestmodel.dart';

abstract class AuthRepo {
  Future<AuthModel> signup({required SignupRequestModel request});
}
