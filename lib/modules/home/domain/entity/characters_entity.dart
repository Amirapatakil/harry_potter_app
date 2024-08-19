class CharactersEntity {
  String? fullName;
  String? nickname;
  String? hogwartsHouse;
  String? interpretedBy;
  List<String>? children;
  String? image;
  String? birthdate;
  int? index;

  CharactersEntity(
      {this.fullName,
      this.nickname,
      this.hogwartsHouse,
      this.interpretedBy,
      this.children,
      this.image,
      this.birthdate,
      this.index});

  CharactersEntity.empty()
      : fullName = '',
        nickname = '',
        hogwartsHouse = '',
        interpretedBy = '',
        children = [],
        image = '',
        birthdate = '',
        index = 0;
}
