
import 'package:get_storage/get_storage.dart';
import 'package:movie_project/Data/Models/MovieModel.dart';

import '../Models/ListModel.dart';
import 'movie_data_source.dart';

class MovieLocalDataSource implements MovieDataSource {
  final GetStorage localStorage;
  MovieLocalDataSource({required this.localStorage});

  @override
  Future<void> cacheMovies(String type_list, cacheMovies) {
    return localStorage.write(type_list,cacheMovies.toJson());
  }

  @override
  Future<ListModel> getMovies(String type_list) async{
    final jsonMovies = localStorage.read(type_list);
    if(jsonMovies != null){
      return Future.value(ListModel.fromJson(jsonMovies));
    }
    throw "Cache Error";
  }

  @override
  Future<MovieModel> getSingleMovie() {
    // TODO: implement getSingleMovie
    throw UnimplementedError();
  }
}
