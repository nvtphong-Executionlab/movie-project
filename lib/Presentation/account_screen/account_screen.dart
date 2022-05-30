
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Presentation/logic_holders/providers/providers.dart';
import 'package:movie_project/Presentation/reuse_component/botom_nav.dart';

import '../splash_screen/splash_screen.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigation(),
      body: ref.watch(accountProvider('/account')).when(
          data: (data) => Center(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      child: ClipOval(
                        child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${data.avatar.tmdb.avatar_path}',
                            fit: BoxFit.fitWidth, errorBuilder:
                            (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.network(
                              'https://cdn.tgdd.vn/hoi-dap/580732/loi-404-not-found-la-gi-9-cach-khac-phuc-loi-404-not-3-800x534.jpg',
                              fit: BoxFit.fitWidth);
                        }),
                      ),
                    ),
                    Text(
                      data.username,
                      style: const TextStyle(
                          fontSize: 35, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(onPressed: ()=>{}, icon: const Icon(Icons.favorite), label: const Text('View watchlist')),
                        TextButton.icon(onPressed: ()=>{}, icon: const Icon(Icons.favorite), label: const Text('View watchlist')),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          error: (error, trace) {
            print(error);
            return Center(child: Text(error.toString()));
          },
          loading: () => SplashScreen())
    );
  }
}
