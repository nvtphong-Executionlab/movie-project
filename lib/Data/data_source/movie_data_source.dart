import 'package:movie_project/Core/api_provider.dart';
import 'package:movie_project/Core/constant.dart';
import 'package:get_storage/get_storage.dart';

import '../Models/MovieModel.dart';

abstract class MovieDataSource {
  Future<MovieModel> getMovies();
}

class MovieRemoteDataSource implements MovieDataSource {
  final ApiProvider apiProvider;
  MovieRemoteDataSource({required this.apiProvider});
  @override
  Future<MovieModel> getMovies() async {
    final Map<String, dynamic> jsonResponse =
        await apiProvider.get('/list/1?api_key=${apiKey}');
    final data = MovieModel.fromJson(jsonResponse);
    return data;
  }
}
class MovieLocalDataSource implements MovieDataSource {
  final GetStorage localStorage;
  MovieLocalDataSource({required this.localStorage});

  Future<void> cacheMovies(cacheMovies) {
    return localStorage.write("movies", cacheMovies.toJson());
  }

  @override
  Future<MovieModel> getMovies() {
    final jsonMovies = localStorage.read('movies');
    if(jsonMovies != null){
      return Future.value(MovieModel.fromJson(jsonMovies));
    }
    throw "Cache Error";
  }


}