import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:ecommerce_app/features/product_details/data/models/productdetailsmodel.dart';
import 'package:ecommerce_app/features/product_details/domain/usecases/productdetails_usecase.dart';
import 'package:injectable/injectable.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

@injectable
class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsUseCase productDetailsUseCase;

  ProductDetailsBloc(this.productDetailsUseCase)
      : super(ProductDetailsInitial()) {
    on<ProductDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetProductDetailsEvent>((event, emit) async {
      emit(state.copywith(productDetailsRequestState: RequestState.loading));

      var result = await productDetailsUseCase.call(productId: event.productId);
      result.fold((productDetailsmodel) {
        emit(state.copywith(
            productDetailsRequestState: RequestState.success,
            productDetails: productDetailsmodel));
      }, (error) {
        emit(state.copywith(
            productDetailsRequestState: RequestState.error,
            productFailures: error));
      });
    });
  }
}
