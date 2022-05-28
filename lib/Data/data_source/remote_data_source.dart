
import 'package:movie_project/Data/Models/ListCastModel.dart';
import 'package:movie_project/Data/Models/ListReviewModel.dart';
import 'package:movie_project/Data/Models/ListVideoModel.dart';
import 'package:movie_project/Data/Models/MovieModel.dart';
import 'package:movie_project/Data/Models/ReviewerModel.dart';

import '../../Core/api_provider.dart';
import '../../Core/constant.dart';
import '../Models/CastModel.dart';
import '../Models/ListModel.dart';
import '../Models/ListMovieModel.dart';
import 'data_source.dart';

class RemoteDataSource implements DataSource {
  final ApiProvider apiProvider;

  RemoteDataSource({required this.apiProvider});

  // @override
  // Future<ListMovieModel> getMovies(String apiLink) async {
  //   final Map<String, dynamic> jsonResponse =
  //   await apiProvider.get('$apiLink?api_key=${apiKey}');
  //   try {
  //     final data = ListMovieModel.fromJson(jsonResponse);
  //     return data;
  //   }
  //   catch (err) {
  //     print(err.toString());
  //   }
  //   return ListMovieModel.fromJson(jsonResponse);
  // }

  @override
  Future<CreditModel> getCasts(String apiLink) async {
    final Map<String, dynamic> jsonResponse =
    await apiProvider.get('$apiLink?api_key=${apiKey}');

    CreditModel data = CreditModel.fromJson(jsonResponse);
    return data;
  }
  @override
  Future<CastModel> getCareer(CastModel cast) async {
    final Map<String, dynamic> jsonResponse = await apiProvider.get(
        '/credit/${cast.creditId}?api_key=${apiKey}');
    cast.addCareer(jsonResponse);
    return cast;
  }

  // @override
  // Future<ListReviewModel> getReviews(String apiLink) async {
  //   final Map<String, dynamic> jsonResponse =
  //       await apiProvider.get('$apiLink?api_key=${apiKey}');
  //
  //   ListReviewModel data = ListReviewModel.fromJson(jsonResponse);
  //   return data;
  // }

  // @override
  // Future<ListVideoModel> getVideos(String apiLink) async {
  //   final Map<String, dynamic> jsonResponse =
  //       await apiProvider.get('$apiLink?api_key=${apiKey}');
  //   ListVideoModel data = ListVideoModel.fromJson(jsonResponse);
  //   return data;
  // }

  @override
  Future<ListModel> getDataList(ListModel listModel, String apiLink) async {
    final Map<String, dynamic> jsonResponse =
        await apiProvider.get('$apiLink?api_key=${apiKey}');
    ListModel data = listModel.fromJson(jsonResponse);
    return data;
  }
}