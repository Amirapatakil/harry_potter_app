import 'package:harry_potter_app/modules/home/domain/entity/house_entity.dart';

class HousesModel extends HouseEntity {
  HousesModel.fromJson(Map<String, dynamic> json) {
    house = json['house'];
    emoji = json['emoji'];
    founder = json['founder'];
    colors = json['colors'].cast<String>();
    animal = json['animal'];
    index = json['index'];
  }
}
