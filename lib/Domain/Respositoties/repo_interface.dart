import 'package:movie_project/Data/Models/ListModel.dart';
import 'package:movie_project/Domain/Entities/CastEntity.dart';

import '../Entities/Entity.dart';
import '../Entities/ListEntity.dart';


abstract class RepositoryInterface {
  //Future<ListEntity> getMovies(String apiLink);
  Future<ListEntity> getCasts(String apiLink);
  Future<Entity> getCareer(CastEntity castEntity);
 // Future<ListEntity> getReviews(String apiLink);
 // Future<ListEntity> getVideos(String apiLink);
  Future<ListEntity> getDataList(ListModel listModel, String apiLink);
}