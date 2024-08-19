import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:harry_potter_app/modules/home/data/model/characters_model.dart';
import 'package:harry_potter_app/modules/home/domain/entity/characters_entity.dart';
import 'package:harry_potter_app/modules/home/domain/repository/characters_repository.dart';

class CharactersRepository implements CharacterDomainRepository {
  CharactersRepository({required Dio dio})
      : _dio = dio,
        super();

  final Dio _dio;
  @override
  Future<List<CharactersEntity>> fetchCharacters() async {
    final response = await _dio.get('characters');
    log('Received response: ${response.statusCode}');
    final List<dynamic> characters = response.data;
    return characters.map((e) => CharactersModel.fromJson(e)).toList();
  }
}
