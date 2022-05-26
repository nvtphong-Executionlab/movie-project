import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';

class DetailScreen extends StatelessWidget {
  final MovieEntity movieEntity;
  const DetailScreen({Key? key, required this.movieEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          top: false,
          bottom: false,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled){
              return [
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  elevation: 0.0,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        "https://image.tmdb.org/t/p/w500${movieEntity.backdrop}",
                        fit: BoxFit.cover,
                      ),
                  ),
                  title: Text(movieEntity.title!),
                ),
              ];
            },
            body: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network("https://image.tmdb.org/t/p/w500${movieEntity.poster}", height: 100, width: 100,),
                      SizedBox(width: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movieEntity.title!,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              SizedBox(width: 5,),
                              Text(movieEntity.voteAvg!)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Icon(
                                Icons.remove_red_eye_rounded,
                              ),
                              SizedBox(width: 5,),
                              Text(movieEntity.popularity!)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                SizedBox(height: 20,),
                  Text(movieEntity.overview!)
                ],
              ),
            ),
          ),
        )
    );
  }
}
