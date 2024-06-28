part of 'cart_bloc.dart';

enum CartStatus {
  initial,
  loading,
  success,
  error,
}

class CartState extends Equatable {
  final CartStatus status;
  final List<DataModel>? data;

  CartState({required this.status, required this.data});

  static CartState initial() => CartState(
        status: CartStatus.initial,
        data: null,
      );

  CartState copyWith({
    CartStatus? status,
    List<DataModel>? data,
  }) =>
      CartState(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  @override
  List<Object?> get props => [status, data];
}
