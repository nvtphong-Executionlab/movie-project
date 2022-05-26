import 'package:movie_project/Core/service.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';
import 'package:movie_project/Domain/Respositoties/movie_repo_interface.dart';
import '../Entities/ListEntity.dart';

class MovieService extends Service
{
  final RepositoryInterface repositoryInterface;
  MovieService(this.repositoryInterface);

  @override
  Future<ListEntity> call(dynamic params) async {
    return await repositoryInterface.getMovies(params);
  }
}