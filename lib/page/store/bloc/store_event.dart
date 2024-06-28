part of 'store_bloc.dart';

abstract class StoreEvent extends Equatable {
  const StoreEvent();

  @override
  List<Object?> get props => [];
}

class FetchDataEvent extends StoreEvent {
  final String? category;

  const FetchDataEvent(this.category);

  @override
  List<Object?> get props => [category];
}

class RetryEvent extends StoreEvent {}
