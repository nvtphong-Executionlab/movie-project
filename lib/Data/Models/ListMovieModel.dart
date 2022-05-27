
import 'package:movie_project/Data/Models/MovieModel.dart';
import 'package:movie_project/Domain/Entities/ListEntity.dart';

class ListMovieModel extends ListEntity {
  ListMovieModel.fromJson(dynamic json){
    items = <MovieModel>[];
    final List listJson = json['items'] ?? json['results'];
    for(dynamic object in listJson){
      items?.add(MovieModel.fromJson(object));
    }
  }
  Map<String, dynamic> toJson() => {
    'results' : items?.map((e) => (e as MovieModel).toJson()).toList()
  };
}