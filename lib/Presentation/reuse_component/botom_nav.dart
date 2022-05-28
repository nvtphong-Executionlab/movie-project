import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';
import 'package:movie_project/Presentation/detail_screen/detail_screen.dart';
import 'package:movie_project/Presentation/home_screen/home_screen.dart';
import 'package:movie_project/Presentation/logic_holders/providers/utils_provider.dart';
import 'package:movie_project/Presentation/reuse_component/custom_search_delegate.dart';

class CustomBottomNavigation extends ConsumerWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedIndex = ref.watch(bottomNavProvider);
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Theme.of(context).primaryColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined), label: 'Search',
    backgroundColor: Theme.of(context).primaryColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp), label: 'Account', backgroundColor: Theme.of(context).primaryColor),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings',  backgroundColor: Theme.of(context).primaryColor)
      ],
      backgroundColor: Theme.of(context).primaryColor,
      currentIndex: selectedIndex,
      onTap: (index){
        navigateNewScreen(index, context, ref);
        ref.read(bottomNavProvider.notifier).state = index;

      } ,
    );
  }
  void navigateNewScreen(int index, BuildContext context, WidgetRef ref){
    if(index == 1){
      ref.watch(allMovieProvider).whenData((value) async {
        MovieEntity movie = await showSearch(context: context, delegate: CustomSearchDelegate(
            items: value));
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => DetailScreen(movieEntity: movie)), (Route<dynamic> route) => false);
      });
    }
    else if (index == 0){
      Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.route, (route) => false);
    }
  }
}
