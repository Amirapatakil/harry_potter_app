import 'package:harry_potter_app/core/domain/base_books_usecase.dart';
import 'package:harry_potter_app/modules/home/domain/entity/house_entity.dart';
import 'package:harry_potter_app/modules/home/domain/repository/characters_repository.dart';

class FetchHousesUsecase implements BaseUsecase<List<HouseEntity>> {
  FetchHousesUsecase({required HousesDomainRepository repo})
      : _repo = repo,
        super();
  final HousesDomainRepository _repo;
  @override
  Future<List<HouseEntity>> execute() async {
    return await _repo.fetchCharacters();
  }
}
