import 'package:movie_project/Core/service.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';
import 'package:movie_project/Domain/Respositoties/movie_repo_interface.dart';

class MovieService extends Service<MovieEntity, NoParams>
{
  final MovieRepositoryInterface repositoryInterface;
  MovieService(this.repositoryInterface);

  @override
  Future<MovieEntity> call(NoParams params) async {
    return await repositoryInterface.getMovies();
  }
}