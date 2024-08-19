class HouseEntity {
  String? house;
  String? emoji;
  String? founder;
  List<String>? colors;
  String? animal;
  int? index;

  HouseEntity(
      {this.house,
      this.emoji,
      this.founder,
      this.colors,
      this.animal,
      this.index});

  HouseEntity.empty()
      : house = '',
        emoji = '',
        colors = [],
        founder = '',
        index = 0;
}
