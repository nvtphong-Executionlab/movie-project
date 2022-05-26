import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Core/constant.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';
import 'package:movie_project/Presentation/home_screen/movie_card_component.dart';
import 'package:movie_project/Presentation/logic_holders/providers/movie_provider.dart';

import '../splash_screen/splash_screen.dart';

final typeProvider = StateProvider((ref) => 0);

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const route = '/home';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var curr = ref.read(typeProvider.state).state;
    return ref.watch(movieProvider(apiLink[type_list[curr]])).when(
        data: (data) => Scaffold(
          appBar: AppBar(
            title: Center(child: Text('${type_list[curr]} Movies')),
          ),
          body: Dismissible(
            key: ValueKey(type_list[curr]),
            onDismissed: (DismissDirection direction){
              if(direction == DismissDirection.endToStart){
                if(curr == type_list.length - 1) {
                  ref.watch(typeProvider.state).state = 0;
                }
                ref.watch(typeProvider.state).state++;
              }
              if(direction == DismissDirection.startToEnd){
                if(curr == 0){
                  ref.watch(typeProvider.state).state = type_list.length - 1;
                }
                ref.watch(typeProvider.state).state--;
              }
            },
            child: Container(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: data.items?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieCard(movieEntity: (data.items![index] as MovieEntity));
                  }),
            ),
          ),
        ),
        error: (error, trace){
          print(error);
          return Center(child: Text(error.toString()));
        },
        loading: () => Scaffold(body: SplashScreen()));

  }
}
