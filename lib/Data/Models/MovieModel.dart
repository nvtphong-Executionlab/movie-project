
import 'package:movie_project/Domain/Entities/MovieEntity.dart';

class MovieModel extends MovieEntity {
  MovieModel.fromJson(dynamic json){
    id = json['id'].toString();
    backdrop = json['backdrop_path'];
    title = json['title'];
    overview = json['overview'];
    poster = json['poster_path'];
    voteAvg = json['vote_average'].toString();
    popularity = json['popularity'].toString();
  }
  Map<String, dynamic> toJson() => {
    'id' : id,
    'backdrop_path' : backdrop,
    'title' : title,
    'overview' : overview,
    'poster_path' : poster,
    'vote_average' : voteAvg,
    'popularity' : popularity
  };
}