import 'package:get_storage/get_storage.dart';
import 'package:movie_project/Core/api_provider.dart';
import 'package:movie_project/Core/constant.dart';
import 'package:movie_project/Data/Models/ListModel.dart';

import '../Models/MovieModel.dart';

abstract class MovieDataSource {
  Future<ListModel> getMovies(String apiLink);
  Future<MovieModel> getSingleMovie();
}


