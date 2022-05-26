import '../Entities/ListEntity.dart';


abstract class RepositoryInterface {
  Future<ListEntity> getMovies(String apiLink);
}