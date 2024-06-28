import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/data.dart';
import '../../../repos/store_repo.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(StoreState.initial()) {
    on<FetchDataEvent>(fetchDataEvent);
  }

  FutureOr<void> fetchDataEvent(event, Emitter<StoreState> emit) async {
    emit(state.copyWith(status: StoreStatus.loading));
    try {
      List<DataModel> storeData =
          await StoreRepo.fetchStoreData(event.category);
      emit(state.copyWith(status: StoreStatus.success, data: storeData));
    } catch (e) {
      emit(state.copyWith(status: StoreStatus.error));
    }
  }
}
