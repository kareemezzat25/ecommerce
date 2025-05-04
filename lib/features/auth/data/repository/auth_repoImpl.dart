import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/core/failures/remotefailures.dart';
import 'package:ecommerce_app/features/auth/data/datasources/remote/auth_remote_ds.dart';
import 'package:ecommerce_app/features/auth/data/models/authmodel.dart';
import 'package:ecommerce_app/features/auth/data/models/signuprequestmodel.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDs authRemoteDs;
  AuthRepoImpl({required this.authRemoteDs});
  @override
  Future<Either<AuthModel, Failures>> signup(
      {required SignupRequestModel request}) async {
    try {
      AuthModel authModel = await authRemoteDs.signup(request: request);
      return Left(authModel);
    } catch (e) {
      return Right(RemoteFailures("Auth Error"));
    }
  }

  @override
  Future<Either<AuthModel, Failures>> signIn(
      {required String email, required String password}) async {
    try {
      var result = await authRemoteDs.signIn(email: email, password: password);
      return Left(result);
    } catch (e) {
      return Right(RemoteFailures("Auth Error ,${e.toString()}"));
    }
  }
}
