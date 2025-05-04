import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/auth/data/models/authmodel.dart';
import 'package:ecommerce_app/features/auth/data/models/signuprequestmodel.dart';

abstract class AuthRepo {
  Future<Either<AuthModel, Failures>> signup(
      {required SignupRequestModel request});

  Future<Either<AuthModel, Failures>> signIn(
      {required String email, required String password});
}
