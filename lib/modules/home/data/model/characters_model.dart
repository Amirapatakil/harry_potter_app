import 'package:harry_potter_app/modules/home/domain/entity/characters_entity.dart';

class CharactersModel extends CharactersEntity {
  CharactersModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    nickname = json['nickname'];
    hogwartsHouse = json['hogwartsHouse'];
    interpretedBy = json['interpretedBy'];
    children = json['children'].cast<String>();
    image = json['image'];
    birthdate = json['birthdate'];
    index = json['index'];
  }
}
