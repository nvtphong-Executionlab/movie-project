
import 'package:get_storage/get_storage.dart';
import 'package:movie_project/Data/Models/CastModel.dart';
import 'package:movie_project/Data/Models/ListCastModel.dart';
import 'package:movie_project/Data/Models/ListMovieModel.dart';
import 'data_source.dart';

class LocalDataSource implements DataSource {
  final GetStorage localStorage;
  LocalDataSource({required this.localStorage});

  Future<void> cacheModels(String type_list, cacheMovies) {
    return localStorage.write(type_list,cacheMovies.toJson());
  }

  @override
  Future<ListMovieModel> getMovies(String type_list) async{
    final jsonMovies = localStorage.read(type_list);
    if(jsonMovies != null){
      return Future.value(ListMovieModel.fromJson(jsonMovies));
    }
    throw "Cache Error";
  }

  @override
  Future<CreditModel> getCasts(String cast_id) {
    final jsonCasts = localStorage.read(cast_id);
    if(jsonCasts != null){
      return Future.value(CreditModel.fromJson(jsonCasts));
    }
    throw "Cache Error";
  }

  @override
  Future<CastModel> getCareer(CastModel castModel) {
    final jsonCasts = localStorage.read(castModel.creditId!);
    if(jsonCasts != null){
      return Future.value(CastModel.fromJson(jsonCasts));
    }
    throw "Cache Error";
  }
}
