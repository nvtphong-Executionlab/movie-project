
import 'package:movie_project/Data/Models/MovieModel.dart';

import '../../Core/api_provider.dart';
import '../../Core/constant.dart';
import '../Models/ListModel.dart';
import 'movie_data_source.dart';

class MovieRemoteDataSource implements MovieDataSource {
  final ApiProvider apiProvider;
  MovieRemoteDataSource({required this.apiProvider});
  @override
  Future<ListModel> getMovies(String apiLink) async {
    final Map<String, dynamic> jsonResponse =
    await apiProvider.get('$apiLink?api_key=${apiKey}');
    final data = ListModel.fromJson(jsonResponse);
    return data;
  }

  @override
  Future<MovieModel> getSingleMovie() {
    // TODO: implement getSingleMovie
    throw UnimplementedError();
  }
}