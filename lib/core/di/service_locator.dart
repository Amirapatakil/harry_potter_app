import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:harry_potter_app/core/service/dio.dart';
import 'package:harry_potter_app/modules/home/data/repository/books_repository.dart';
import 'package:harry_potter_app/modules/home/data/repository/character_repository.dart';
import 'package:harry_potter_app/modules/home/data/repository/house_repository.dart';
import 'package:harry_potter_app/modules/home/domain/repository/characters_repository.dart';
import 'package:harry_potter_app/modules/home/domain/usecase/fetch_books.dart';
import 'package:harry_potter_app/modules/home/domain/usecase/fetch_characters.dart';
import 'package:harry_potter_app/modules/home/domain/usecase/fetch_houses.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/book/book_bloc.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/characters_bloc/characters_bloc.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/houses/houses_bloc.dart';

void setup(GetIt di) {
  di.registerFactory(() => Dio());
  di.registerSingleton<CharacterDomainRepository>(
      CharactersRepository(dio: DioSetting().dio));
  di.registerSingleton<BooksDomainRepository>(
      BooksRepository(dio: DioSetting().dio));
  di.registerSingleton<HousesDomainRepository>(
      HouseRepository(dio: DioSetting().dio));
  di.registerSingleton(
      FetchCharactersUsecase(repo: di<CharacterDomainRepository>()));
  di.registerSingleton(FetchBookUsecase(repo: di<BooksDomainRepository>()));
  di.registerSingleton(FetchHousesUsecase(repo: di<HousesDomainRepository>()));
  di.registerSingleton(CharactersBloc(charactersUsecase: di()));
  di.registerSingleton(BookBloc(booksUsecase: di()));
  di.registerSingleton(HousesBloc(houseUsecase: di()));
}
