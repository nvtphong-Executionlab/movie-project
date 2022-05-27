import 'package:movie_project/Data/Models/CastModel.dart';

import '../Models/ListCastModel.dart';
import '../Models/ListMovieModel.dart';

abstract class DataSource {
  Future<ListMovieModel> getMovies(String apiLink);
  Future<CreditModel> getCasts(String apiLink);
  Future<CastModel> getCareer(CastModel castModel);
}


