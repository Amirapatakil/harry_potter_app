import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_app/core/enums/state_status.dart';
import 'package:harry_potter_app/modules/home/domain/entity/house_entity.dart';
import 'package:harry_potter_app/modules/home/domain/usecase/fetch_houses.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/houses/houses_event.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/houses/houses_state.dart';

class HousesBloc extends Bloc<HousesEvent, HousesState<List<HouseEntity>>> {
  final FetchHousesUsecase _houseUsecase;
  HousesBloc({required FetchHousesUsecase houseUsecase})
      : _houseUsecase = houseUsecase,
        super(HousesState(
          model: [],
          status: StateStatus.init,
        )) {
    on<HousesEvent>((event, emit) async {
      HousesState(
        model: [],
        status: StateStatus.loading,
      );
      try {
        final result = await _houseUsecase.execute();
        emit(
          HousesState(model: result, status: StateStatus.succes),
        );
      } catch (e) {
        emit(
          HousesState(model: [], status: StateStatus.error),
        );
      }
    });
  }
}
