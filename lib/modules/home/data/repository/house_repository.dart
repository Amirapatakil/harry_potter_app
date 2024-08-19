import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:harry_potter_app/modules/home/data/model/house_model.dart';
import 'package:harry_potter_app/modules/home/domain/entity/house_entity.dart';
import 'package:harry_potter_app/modules/home/domain/repository/characters_repository.dart';

class HouseRepository extends HousesDomainRepository {
  HouseRepository({required Dio dio})
      : _dio = dio,
        super();
  final Dio _dio;
  @override
  Future<List<HouseEntity>> fetchCharacters() async {
    final response = await _dio.get('houses');
    log('Received response: ${response.statusCode}');
    final List<dynamic> characters = response.data;
    return characters.map((e) => HousesModel.fromJson(e)).toList();
  }
}
