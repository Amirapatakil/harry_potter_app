class BooksEntity {
  int? number;
  String? title;
  String? originalTitle;
  String? releaseDate;
  String? description;
  int? pages;
  String? cover;
  int? index;

  BooksEntity(
      {this.number,
      this.title,
      this.originalTitle,
      this.releaseDate,
      this.description,
      this.pages,
      this.cover,
      this.index});

  BooksEntity.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    title = json['title'];
    originalTitle = json['originalTitle'];
    releaseDate = json['releaseDate'];
    description = json['description'];
    pages = json['pages'];
    cover = json['cover'];
    index = json['index'];
  }

  BooksEntity.empty()
      : number = 0,
        title = '',
        originalTitle = '',
        releaseDate = '',
        description = '',
        pages = 0,
        cover = '',
        index = 0;
}
