import 'package:movie_project/Data/Models/CastModel.dart';
import 'package:movie_project/Data/Models/ListModel.dart';
import 'package:movie_project/Data/Models/ListReviewModel.dart';
import 'package:movie_project/Data/Models/ListVideoModel.dart';

import '../Models/ListCastModel.dart';
import '../Models/ListMovieModel.dart';

abstract class DataSource {
  //Future<ListMovieModel> getMovies(String apiLink);
  Future<CreditModel> getCasts(String apiLink);
  Future<CastModel> getCareer(CastModel castModel);
  //Future<ListReviewModel> getReviews(String apiLink);
  //Future<ListVideoModel> getVideos(String apiLink);
  Future<ListModel> getDataList(ListModel listModel, String apiLink);
}


