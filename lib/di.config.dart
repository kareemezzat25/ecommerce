// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/api/api_manager.dart' as _i237;
import 'features/auth/data/datasources/remote/auth_remote_ds.dart' as _i53;
import 'features/auth/data/datasources/remote/auth_remote_dsImpl.dart' as _i589;
import 'features/auth/data/repository/auth_repoImpl.dart' as _i866;
import 'features/auth/domain/repository/auth_repo.dart' as _i38;
import 'features/auth/domain/usecases/signin_usecase.dart' as _i925;
import 'features/auth/domain/usecases/signup_usecase.dart' as _i100;
import 'features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart' as _i849;
import 'features/main_layout/home/data/datasources/remote/homeremote_ds.dart'
    as _i545;
import 'features/main_layout/home/data/datasources/remote/homeremotedsimpl.dart'
    as _i670;
import 'features/main_layout/home/data/repository/homerepo_impl.dart' as _i296;
import 'features/main_layout/home/domain/repository/homerepo.dart' as _i118;
import 'features/main_layout/home/domain/usecases/categories_usecase.dart'
    as _i133;
import 'features/main_layout/home/presentation/bloc/bloc/home_bloc.dart'
    as _i981;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i237.ApiManager>(() => _i237.ApiManager());
    gh.factory<_i53.AuthRemoteDs>(
        () => _i589.AuthRemoteDsImpl(apimanager: gh<_i237.ApiManager>()));
    gh.factory<_i545.HomeRemoteDs>(
        () => _i670.HomeRemoteDsImpl(gh<_i237.ApiManager>()));
    gh.factory<_i118.HomeRepo>(
        () => _i296.HomeRepoImpl(gh<_i545.HomeRemoteDs>()));
    gh.factory<_i38.AuthRepo>(
        () => _i866.AuthRepoImpl(authRemoteDs: gh<_i53.AuthRemoteDs>()));
    gh.factory<_i925.SigninUsecase>(
        () => _i925.SigninUsecase(gh<_i38.AuthRepo>()));
    gh.factory<_i100.SignupUsecase>(
        () => _i100.SignupUsecase(gh<_i38.AuthRepo>()));
    gh.factory<_i133.CategoriesUsecase>(
        () => _i133.CategoriesUsecase(gh<_i118.HomeRepo>()));
    gh.factory<_i849.AuthBlocBloc>(() => _i849.AuthBlocBloc(
          gh<_i100.SignupUsecase>(),
          gh<_i925.SigninUsecase>(),
        ));
    gh.factory<_i981.HomeBloc>(
        () => _i981.HomeBloc(gh<_i133.CategoriesUsecase>()));
    return this;
  }
}
