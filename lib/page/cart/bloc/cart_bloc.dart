// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_api/model/cart.dart';
import 'package:store_api/model/data.dart';
import 'package:store_api/repos/store_repo.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.initial()) {
    on<FetchCartEvent>(fetchCartEvent);
  }

  FutureOr<void> fetchCartEvent(event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    try {
      List<DataModel> cartData = await StoreRepo.fetchCartProducts();
      print(cartData);
      emit(state.copyWith(status: CartStatus.success, data: cartData));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: CartStatus.error));
    }
  }
}
