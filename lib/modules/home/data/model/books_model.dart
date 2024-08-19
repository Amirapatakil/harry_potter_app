import 'package:harry_potter_app/modules/home/domain/entity/books_entity.dart';

class BooksModel extends BooksEntity {
  BooksModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    title = json['title'];
    originalTitle = json['originalTitle'];
    releaseDate = json['releaseDate'];
    description = json['description'];
    pages = json['pages'];
    cover = json['cover'];
    index = json['index'];
  }
}
