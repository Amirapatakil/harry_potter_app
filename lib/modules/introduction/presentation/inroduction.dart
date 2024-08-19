import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_app/core/assets/app_colors.dart';
import 'package:harry_potter_app/core/assets/app_dimens.dart';
import 'package:harry_potter_app/core/assets/app_textstyles.dart';
import 'package:harry_potter_app/core/enums/state_status.dart';
import 'package:harry_potter_app/main.dart';
import 'package:harry_potter_app/modules/home/domain/entity/characters_entity.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/characters_bloc/characters_bloc.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/characters_bloc/characters_state.dart';

class Inroduction extends StatelessWidget {
  final CharactersEntity character;
  const Inroduction({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    String children = character.children!.isEmpty
        ? 'No children'
        : 'Children are ${character.children!.join(',')}';
    'No children';
    return Scaffold(
      backgroundColor: AppColour.scaffoldColor,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.5),
      ),
      body: SafeArea(
        child: BlocProvider.value(
          value: di<CharactersBloc>(),
          child: BlocBuilder<CharactersBloc,
              CharactersState<List<CharactersEntity>>>(
            builder: (context, state) {
              if (state.status == StateStatus.succes) {
                return Center(
                  child: Column(
                    children: [
                      AppDimens.mediumPadding.vertical,
                      SizedBox(
                          height: context.height / 3,
                          child: Image.network(character.image ?? '')),
                      AppDimens.smallPadding.vertical,
                      Text('Introduction',
                          style: AppTextStyle.bottonTextStyle
                              .copyWith(color: AppColour.textColor)),
                      AppDimens.smallPadding.vertical,
                      Text(
                        textAlign: TextAlign.center,
                        'Fullname is ${character.fullName ?? ''}',
                        style: AppTextStyle.s25w400
                            .copyWith(color: AppColour.textColor),
                      ),
                      AppDimens.smallPadding.vertical,
                      Text(
                        'Nickname is ${character.nickname ?? ''}',
                        style: AppTextStyle.s25w400
                            .copyWith(color: AppColour.textColor),
                      ),
                      AppDimens.smallPadding.vertical,
                      Text(
                        'Birthdate is ${character.birthdate ?? ''}',
                        style: AppTextStyle.s25w400
                            .copyWith(color: AppColour.textColor),
                      ),
                      AppDimens.smallPadding.vertical,
                      Text(
                        'HogwartsHouse is ${character.hogwartsHouse ?? ''}',
                        style: AppTextStyle.s25w400
                            .copyWith(color: AppColour.textColor),
                      ),
                      AppDimens.smallPadding.vertical,
                      Text(
                        textAlign: TextAlign.center,
                        children,
                        style: AppTextStyle.s25w400
                            .copyWith(color: AppColour.textColor),
                      ),
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
