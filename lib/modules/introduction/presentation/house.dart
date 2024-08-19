import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_app/core/assets/app_colors.dart';
import 'package:harry_potter_app/core/assets/app_dimens.dart';
import 'package:harry_potter_app/core/assets/app_textstyles.dart';
import 'package:harry_potter_app/core/enums/state_status.dart';
import 'package:harry_potter_app/main.dart';
import 'package:harry_potter_app/modules/home/domain/entity/house_entity.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/houses/houses_bloc.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/houses/houses_state.dart';

class HouseDescription extends StatelessWidget {
  final HouseEntity houseDescrioption;
  const HouseDescription({
    super.key,
    required this.houseDescrioption,
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
          value: di<HousesBloc>(),
          child: BlocBuilder<HousesBloc, HousesState<List<HouseEntity>>>(
            builder: (context, state) {
              if (state.status == StateStatus.succes) {
                return Center(
                  child: Column(
                    children: [
                      AppDimens.mediumPadding.vertical,
                      RichText(
                        textScaler: const TextScaler.linear(10),
                        text: TextSpan(text: houseDescrioption.emoji),
                      ),
                      AppDimens.smallPadding.vertical,
                      Text(
                        'House is ${houseDescrioption.house ?? ''}',
                        style: AppTextStyle.s25w400
                            .copyWith(color: AppColour.textColor),
                      ),
                      AppDimens.smallPadding.vertical,
                      Text(
                        textAlign: TextAlign.center,
                        'Title is ${houseDescrioption.founder ?? ''}',
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
