import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_app/core/enums/state_status.dart';
import 'package:harry_potter_app/modules/home/domain/entity/books_entity.dart';
import 'package:harry_potter_app/modules/home/domain/usecase/fetch_books.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/book/book_event.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/book/books_state.dart';

class BookBloc extends Bloc<BookssEvent, BooksState<List<BooksEntity>>> {
  final FetchBookUsecase _booksUsecase;
  BookBloc({required FetchBookUsecase booksUsecase})
      : _booksUsecase = booksUsecase,
        super(BooksState(
          model: [],
          status: StateStatus.init,
        )) {
    on<FetchBookssEvent>((event, emit) async {
      BooksState(
        model: [],
        status: StateStatus.loading,
      );
      try {
        final result = await _booksUsecase.execute();
        emit(
          BooksState(model: result, status: StateStatus.succes),
        );
      } catch (e) {
        emit(
          BooksState(model: [], status: StateStatus.error),
        );
      }
    });
  }
}
