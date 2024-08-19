import 'package:harry_potter_app/core/domain/base_usecase.dart';
import 'package:harry_potter_app/modules/home/domain/entity/characters_entity.dart';
import 'package:harry_potter_app/modules/home/domain/repository/characters_repository.dart';

class FetchCharactersUsecase implements BaseUsecase<List<CharactersEntity>> {
  FetchCharactersUsecase({required CharacterDomainRepository repo})
      : _repo = repo,
        super();
  final CharacterDomainRepository _repo;
  @override
  Future<List<CharactersEntity>> execute() async {
    return await _repo.fetchCharacters();
  }
}
