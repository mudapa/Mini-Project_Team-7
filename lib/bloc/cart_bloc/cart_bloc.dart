import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/cart_model.dart';
import '../../services/repository/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc(this.cartRepository) : super(CartInitial()) {
    on<LoadCartEvent>((event, emit) async {
      emit(CartLoadingState());
      try {
        final cart = await cartRepository.fetchCart();
        emit(CartLoadedState(cart: cart));
      } catch (e) {
        emit(CartErrorState());
      }
    });
  }
}
