import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_app/core/assets/app_colors.dart';
import 'package:harry_potter_app/core/assets/app_dimens.dart';
import 'package:harry_potter_app/core/enums/state_status.dart';
import 'package:harry_potter_app/core/extension/widget_extension.dart';
import 'package:harry_potter_app/main.dart';
import 'package:harry_potter_app/modules/home/domain/entity/books_entity.dart';
import 'package:harry_potter_app/modules/home/domain/entity/characters_entity.dart';
import 'package:harry_potter_app/modules/home/domain/entity/house_entity.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/book/book_bloc.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/book/book_event.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/book/books_state.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/characters_bloc/characters_bloc.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/characters_bloc/characters_event.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/characters_bloc/characters_state.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/houses/houses_bloc.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/houses/houses_event.dart';
import 'package:harry_potter_app/modules/home/presentation/bloc/houses/houses_state.dart';
import 'package:harry_potter_app/modules/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:harry_potter_app/modules/home/presentation/widgets/content_list.dart';
import 'package:harry_potter_app/modules/home/presentation/widgets/text_home_screen.dart';
import 'package:harry_potter_app/modules/introduction/presentation/description.dart';
import 'package:harry_potter_app/modules/introduction/presentation/house.dart';
import 'package:harry_potter_app/modules/introduction/presentation/inroduction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    di<CharactersBloc>().add(FetchCharactersEvent());
    di<BookBloc>().add(FetchBookssEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'https://avatars.dzeninfra.ru/get-zen_doc/1687249/pub_5eb061e8a3f457144fc01155_5eb07a1c0ab5b766d08583a5/scale_1200',
      'https://gamemerch.ru/wp-content/uploads/2021/11/unnamed.gif',
      'https://gamemerch.ru/wp-content/uploads/2021/11/Gerb-Kogtevrana-1.jpg',
      'https://avatars.dzeninfra.ru/get-zen_doc/1653873/pub_5e98bbe20f60c6063a03ecf3_5e98c3037e9eda6dc0c46c11/scale_1200',
    ];
    return Scaffold(
        backgroundColor: AppColour.scaffoldColor,
        body: SafeArea(
          child: MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: di<CharactersBloc>()..add(FetchCharactersEvent()),
              ),
              BlocProvider.value(
                value: di<BookBloc>()..add(FetchBookssEvent()),
              ),
              BlocProvider.value(
                value: di<HousesBloc>()..add(FetchHousesEvent()),
              ),
            ],
            child: SizedBox(
              height: context.height,
              child: Column(
                children: [
                  SizedBox(
                    height: 320,
                    child: BlocBuilder<CharactersBloc,
                            CharactersState<List<CharactersEntity>>>(
                        builder: (context, state) {
                      if (state.status == StateStatus.succes) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 100,
                              child: TextHomeScreen(
                                text:
                                    'It will help familiarize you with this world.',
                                isStyle: false,
                                isAlign: false,
                              ),
                            ),
                            AppDimens.smallPadding.vertical,
                            SizedBox(
                              height: context.height / 4,
                              child: ListView.builder(
                                primary: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.model.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          Inroduction(
                                            character: state.model[index],
                                          ).route);
                                      log(state.model[index].fullName ?? '');
                                    },
                                    child: ContentList(
                                      image: (state.model[index].image) ?? '',
                                      isPersom: true,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Text('No data');
                      }
                    }),
                  ),
                  SizedBox(
                    child: BlocBuilder<BookBloc, BooksState<List<BooksEntity>>>(
                        builder: (context, state) {
                      if (state.status == StateStatus.succes) {
                        return Column(
                          children: [
                            const TextHomeScreen(
                              text: 'Books',
                              isStyle: true,
                              isAlign: true,
                            ),
                            SizedBox(
                              height: context.height / 5,
                              child: ListView.builder(
                                primary: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.model.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          Description(
                                            descrioption: state.model[index],
                                          ).route);
                                    },
                                    child: ContentList(
                                      image: (state.model[index].cover) ?? '',
                                      isPersom: false,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Text('No data');
                      }
                    }),
                  ),
                  SizedBox(
                    child:
                        BlocBuilder<HousesBloc, HousesState<List<HouseEntity>>>(
                            builder: (context, state) {
                      if (state.status == StateStatus.succes) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 50,
                              child: TextHomeScreen(
                                text: 'Houses',
                                isStyle: true,
                                isAlign: true,
                              ),
                            ),
                            AppDimens.smallPadding.vertical,
                            SizedBox(
                              height: context.height / 5.5,
                              child: ListView.builder(
                                primary: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.model.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          HouseDescription(
                                            houseDescrioption:
                                                state.model[index],
                                          ).route);
                                      log(state.model[index].emoji ?? '');
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          width: 100,
                                          height: 150,
                                          fit: BoxFit.cover,
                                          imageUrl: imageUrls[index],
                                          placeholder: (context, url) =>
                                              Image.network(
                                                  fit: BoxFit.cover,
                                                  'https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0='),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Text('No data');
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            foregroundColor: Colors.white,
            shape: HexagonBorder(),
            backgroundColor: Colors.grey.shade500,
            child: const Icon(
              Icons.add,
              size: 35,
              color: Colors.white,
            ),
            onPressed: () {}));
  }
}
