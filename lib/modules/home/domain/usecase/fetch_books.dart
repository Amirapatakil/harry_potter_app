import 'package:harry_potter_app/core/domain/base_usecase.dart';
import 'package:harry_potter_app/modules/home/domain/entity/books_entity.dart';
import 'package:harry_potter_app/modules/home/domain/repository/characters_repository.dart';

class FetchBookUsecase implements BaseUsecase<List<BooksEntity>> {
  FetchBookUsecase({required BooksDomainRepository repo})
      : _repo = repo,
        super();
  final BooksDomainRepository _repo;
  @override
  Future<List<BooksEntity>> execute() async {
    return await _repo.fetchCharacters();
  }
}
