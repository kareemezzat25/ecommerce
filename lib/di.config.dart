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
import 'features/cart/data/datasources/remote/cartremoteds.dart' as _i567;
import 'features/cart/data/datasources/remote/cartremotedsimpl.dart' as _i1043;
import 'features/cart/data/repository/cartrepoimpl.dart' as _i282;
import 'features/cart/domain/repository/cartrepo.dart' as _i727;
import 'features/cart/domain/usecases/addtocart_usecase.dart' as _i782;
import 'features/cart/domain/usecases/getcartproducts_usecase.dart' as _i586;
import 'features/cart/domain/usecases/removecartproducts_usecase.dart' as _i60;
import 'features/cart/domain/usecases/removeproductfromcart_usecase.dart'
    as _i548;
import 'features/cart/presentation/bloc/bloc/cart_bloc.dart' as _i766;
import 'features/main_layout/categories/data/datasources/remote/categoriesremoteds.dart'
    as _i352;
import 'features/main_layout/categories/data/datasources/remote/categoriesremotedsImpl.dart'
    as _i172;
import 'features/main_layout/categories/data/repository/subcategoriesrepoImpl.dart'
    as _i225;
import 'features/main_layout/categories/domain/repository/subcategoriesrepo.dart'
    as _i661;
import 'features/main_layout/categories/domain/usecases/specificcategory_usecase.dart'
    as _i597;
import 'features/main_layout/categories/domain/usecases/subCategories_usecase.dart'
    as _i592;
import 'features/main_layout/categories/presentation/bloc/bloc/categories_bloc_bloc.dart'
    as _i32;
import 'features/main_layout/favourite/data/datasources/remote/favouritesremoteds.dart'
    as _i950;
import 'features/main_layout/favourite/data/datasources/remote/favouritesremotedsImpl.dart'
    as _i193;
import 'features/main_layout/favourite/data/repository/favouritesrepoImpl.dart'
    as _i34;
import 'features/main_layout/favourite/domain/repository/favouritesrepo.dart'
    as _i816;
import 'features/main_layout/favourite/domain/usecases/getfavourites_usecase.dart'
    as _i752;
import 'features/main_layout/favourite/presentation/bloc/bloc/favourites_bloc.dart'
    as _i708;
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
import 'features/product_details/data/datasources/remote/productdetailsremoteds.dart'
    as _i452;
import 'features/product_details/data/datasources/remote/productdetailsremotedsImpl.dart'
    as _i297;
import 'features/product_details/data/repository/productdetailsrepoImpl.dart'
    as _i416;
import 'features/product_details/domain/repository/productdetailsrepo.dart'
    as _i798;
import 'features/product_details/domain/usecases/productdetails_usecase.dart'
    as _i813;
import 'features/product_details/presentation/bloc/bloc/product_details_bloc.dart'
    as _i102;
import 'features/products_screen/data/datasources/remote/getproductremoteds.dart'
    as _i368;
import 'features/products_screen/data/datasources/remote/getproductremotedsImpl.dart'
    as _i366;
import 'features/products_screen/data/repository/getproductrepoImpl.dart'
    as _i588;
import 'features/products_screen/domain/repository/getproductsrepo.dart'
    as _i770;
import 'features/products_screen/domain/usecases/getproducts_usecase.dart'
    as _i784;
import 'features/products_screen/presentation/bloc/bloc/products_bloc.dart'
    as _i215;

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
    gh.factory<_i567.CartRemoteDs>(() => _i1043.CartRemoteDsImpl());
    gh.factory<_i53.AuthRemoteDs>(
        () => _i589.AuthRemoteDsImpl(apimanager: gh<_i237.ApiManager>()));
    gh.factory<_i950.FavouritesRemoteDs>(
        () => _i193.FavouritesRemoteDsImpl(gh<_i237.ApiManager>()));
    gh.factory<_i352.CategoriesRemoteDs>(
        () => _i172.CategoriesRemoteDsImpl(gh<_i237.ApiManager>()));
    gh.factory<_i545.HomeRemoteDs>(
        () => _i670.HomeRemoteDsImpl(gh<_i237.ApiManager>()));
    gh.factory<_i368.GetProductsRemoteDs>(
        () => _i366.GetProductsRemoteDsImpl(gh<_i237.ApiManager>()));
    gh.factory<_i118.HomeRepo>(
        () => _i296.HomeRepoImpl(gh<_i545.HomeRemoteDs>()));
    gh.factory<_i727.CartRepo>(
        () => _i282.CartRepoImpl(gh<_i567.CartRemoteDs>()));
    gh.factory<_i816.FavouritesRepo>(
        () => _i34.FavouritesRepoImpl(gh<_i950.FavouritesRemoteDs>()));
    gh.factory<_i452.ProductDetailsRemoteDs>(
        () => _i297.ProductDetailsRemoteDsImpl(gh<_i237.ApiManager>()));
    gh.factory<_i770.GetProductRepo>(
        () => _i588.GetProductRepoImpl(gh<_i368.GetProductsRemoteDs>()));
    gh.factory<_i661.SubCategoriesRepo>(
        () => _i225.SubCategoriesRepoImpl(gh<_i352.CategoriesRemoteDs>()));
    gh.factory<_i752.GetFavouritesUseCase>(
        () => _i752.GetFavouritesUseCase(gh<_i816.FavouritesRepo>()));
    gh.factory<_i708.FavouritesBloc>(
        () => _i708.FavouritesBloc(gh<_i752.GetFavouritesUseCase>()));
    gh.factory<_i38.AuthRepo>(
        () => _i866.AuthRepoImpl(authRemoteDs: gh<_i53.AuthRemoteDs>()));
    gh.factory<_i782.AddToCartUseCase>(
        () => _i782.AddToCartUseCase(gh<_i727.CartRepo>()));
    gh.factory<_i586.GetCartProductsUseCase>(
        () => _i586.GetCartProductsUseCase(gh<_i727.CartRepo>()));
    gh.factory<_i548.RemoveProductFromCartUseCase>(
        () => _i548.RemoveProductFromCartUseCase(gh<_i727.CartRepo>()));
    gh.factory<_i60.RemoveCartProductsUseCase>(
        () => _i60.RemoveCartProductsUseCase(gh<_i727.CartRepo>()));
    gh.factory<_i925.SigninUsecase>(
        () => _i925.SigninUsecase(gh<_i38.AuthRepo>()));
    gh.factory<_i100.SignupUsecase>(
        () => _i100.SignupUsecase(gh<_i38.AuthRepo>()));
    gh.factory<_i798.ProductDetailsRepo>(
        () => _i416.ProductDetailsRepoImpl(gh<_i452.ProductDetailsRemoteDs>()));
    gh.factory<_i784.GetProductsUseCase>(
        () => _i784.GetProductsUseCase(gh<_i770.GetProductRepo>()));
    gh.factory<_i133.CategoriesUsecase>(
        () => _i133.CategoriesUsecase(gh<_i118.HomeRepo>()));
    gh.factory<_i215.ProductsBloc>(
        () => _i215.ProductsBloc(gh<_i784.GetProductsUseCase>()));
    gh.factory<_i813.ProductDetailsUseCase>(
        () => _i813.ProductDetailsUseCase(gh<_i798.ProductDetailsRepo>()));
    gh.factory<_i849.AuthBlocBloc>(() => _i849.AuthBlocBloc(
          gh<_i100.SignupUsecase>(),
          gh<_i925.SigninUsecase>(),
        ));
    gh.factory<_i592.SubCategoriesUseCase>(
        () => _i592.SubCategoriesUseCase(gh<_i661.SubCategoriesRepo>()));
    gh.factory<_i597.SpecificCategoryUseCase>(
        () => _i597.SpecificCategoryUseCase(gh<_i661.SubCategoriesRepo>()));
    gh.factory<_i102.ProductDetailsBloc>(
        () => _i102.ProductDetailsBloc(gh<_i813.ProductDetailsUseCase>()));
    gh.factory<_i766.CartBloc>(() => _i766.CartBloc(
          gh<_i782.AddToCartUseCase>(),
          gh<_i586.GetCartProductsUseCase>(),
          gh<_i548.RemoveProductFromCartUseCase>(),
          gh<_i60.RemoveCartProductsUseCase>(),
        ));
    gh.factory<_i32.CategoriesBlocBloc>(() => _i32.CategoriesBlocBloc(
          gh<_i133.CategoriesUsecase>(),
          gh<_i592.SubCategoriesUseCase>(),
          gh<_i597.SpecificCategoryUseCase>(),
        ));
    gh.factory<_i981.HomeBloc>(
        () => _i981.HomeBloc(gh<_i133.CategoriesUsecase>()));
    return this;
  }
}
