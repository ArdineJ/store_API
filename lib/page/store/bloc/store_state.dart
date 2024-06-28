part of 'store_bloc.dart';

enum StoreStatus {
  initial,
  loading,
  success,
  error,
}

class StoreState extends Equatable {
  final StoreStatus status;
  final List<DataModel>? data;

  StoreState({required this.status, required this.data});

  static StoreState initial() => StoreState(
        status: StoreStatus.initial,
        data: null,
      );

  StoreState copyWith({
    StoreStatus? status,
    List<DataModel>? data,
  }) =>
      StoreState(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  @override
  List<Object?> get props => [status, data];
}
