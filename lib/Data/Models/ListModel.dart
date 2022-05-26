
import 'package:movie_project/Data/Models/MovieModel.dart';
import 'package:movie_project/Domain/Entities/GenresEntity.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';

class ListModel extends GenresEntity {
  ListModel.fromJson(dynamic json){
    id = json['id'] ?? '0';
    description = json['description'] ?? '';
    items = <MovieModel>[];
    final List listJson = json['items'] ?? json['results'];
    for(dynamic object in listJson){
      items?.add(MovieModel.fromJson(object));
    }
  }
  Map<String, dynamic> toJson() => {
    'id' : id,
    'description' : description,
    'items' : items?.map((e) => (e as MovieModel).toJson()).toList()
  };
}