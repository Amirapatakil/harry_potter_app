import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_app/core/enums/state_status.dart';
import 'package:harry_potter_app/modules/home/domain/entity/characters_entity.dart';
import 'package:harry_potter_app/modules/home/domain/usecase/fetch_characters.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/characters_bloc/characters_event.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/characters_bloc/characters_state.dart';

class CharactersBloc
    extends Bloc<CharactersEvent, CharactersState<List<CharactersEntity>>> {
  final FetchCharactersUsecase _charactersUsecase;
  CharactersBloc({required FetchCharactersUsecase charactersUsecase})
      : _charactersUsecase = charactersUsecase,
        super(CharactersState(
          model: [],
          status: StateStatus.init,
        )) {
    on<FetchCharactersEvent>((event, emit) async {
      CharactersState(
        model: [],
        status: StateStatus.loading,
      );
      try {
        final result = await _charactersUsecase.execute();
        emit(
          CharactersState(model: result, status: StateStatus.succes),
        );
      } catch (e) {
        emit(
          CharactersState(model: [], status: StateStatus.error),
        );
      }
    });
  }
}
