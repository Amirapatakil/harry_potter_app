import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_app/core/assets/app_colors.dart';
import 'package:harry_potter_app/core/assets/app_dimens.dart';
import 'package:harry_potter_app/core/assets/app_textstyles.dart';
import 'package:harry_potter_app/core/enums/state_status.dart';
import 'package:harry_potter_app/main.dart';
import 'package:harry_potter_app/modules/home/domain/entity/books_entity.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/book/book_bloc.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/book/books_state.dart';

class Description extends StatelessWidget {
  final BooksEntity descrioption;
  const Description({
    super.key,
    required this.descrioption,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColour.scaffoldColor,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.5),
      ),
      body: SafeArea(
        child: BlocProvider.value(
          value: di<BookBloc>(),
          child: BlocBuilder<BookBloc, BooksState<List<BooksEntity>>>(
            builder: (context, state) {
              if (state.status == StateStatus.succes) {
                return Center(
                  child: Column(
                    children: [
                      AppDimens.mediumPadding.vertical,
                      SizedBox(
                          height: context.height / 3,
                          child: Image.network(descrioption.cover ?? '')),
                      AppDimens.smallPadding.vertical,
                      Text(
                        textAlign: TextAlign.center,
                        'Title is ${descrioption.title ?? ''}',
                        style: AppTextStyle.s25w400
                            .copyWith(color: AppColour.textColor),
                      ),
                      AppDimens.smallPadding.vertical,
                      Text(
                        'Release Date is ${descrioption.releaseDate ?? ''}',
                        style: AppTextStyle.s25w400
                            .copyWith(color: AppColour.textColor),
                      ),
                      AppDimens.smallPadding.vertical,
                      Text(
                        textAlign: TextAlign.center,
                        'Description is ${descrioption.description ?? ''}',
                        style: AppTextStyle.s25w400
                            .copyWith(color: AppColour.textColor),
                      ),
                      AppDimens.smallPadding.vertical,
                    ],
                  ),
                );
              } else {
                return const Text('No data');
              }
            },
          ),
        ),
      ),
    );
  }
}
