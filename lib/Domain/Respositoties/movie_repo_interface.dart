import '../Entities/MovieEntity.dart';

abstract class MovieRepositoryInterface {
  Future<MovieEntity> getMovies();
}