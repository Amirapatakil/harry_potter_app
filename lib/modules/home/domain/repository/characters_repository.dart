import 'package:harry_potter_app/modules/home/domain/entity/books_entity.dart';
import 'package:harry_potter_app/modules/home/domain/entity/characters_entity.dart';
import 'package:harry_potter_app/modules/home/domain/entity/house_entity.dart';

abstract class CharacterDomainRepository {
  Future<List<CharactersEntity>> fetchCharacters();
}

abstract class BooksDomainRepository {
  Future<List<BooksEntity>> fetchCharacters();
}

abstract class HousesDomainRepository {
  Future<List<HouseEntity>> fetchCharacters();
}
