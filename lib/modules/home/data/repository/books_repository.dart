import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:harry_potter_app/modules/home/data/model/books_model.dart';
import 'package:harry_potter_app/modules/home/domain/entity/books_entity.dart';
import 'package:harry_potter_app/modules/home/domain/repository/characters_repository.dart';

class BooksRepository implements BooksDomainRepository {
  BooksRepository({required Dio dio})
      : _dio = dio,
        super();

  final Dio _dio;
  @override
  Future<List<BooksEntity>> fetchCharacters() async {
    final response = await _dio.get('books');
    log('Received response: ${response.statusCode}');
    final List<dynamic> characters = response.data;
    return characters.map((e) => BooksModel.fromJson(e)).toList();
  }
}
