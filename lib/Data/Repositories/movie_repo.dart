

import 'package:movie_project/Core/connection_info.dart';
import 'package:movie_project/Domain/Respositoties/movie_repo_interface.dart';

import '../../Domain/Entities/ListEntity.dart';
import '../data_source/movie_local_data_source.dart';
import '../data_source/movie_remote_data_source.dart';

class MovieRepository implements RepositoryInterface {
  final MovieLocalDataSource movieLocalDataSource;
  final MovieRemoteDataSource movieRemoteDataSource;
  final ConnectionInfo connectionInfo;

  MovieRepository(this.movieLocalDataSource, this.movieRemoteDataSource, this.connectionInfo);

  @override
  Future<ListEntity> getMovies(String apiLink) async{
    if(await connectionInfo.isConnected){
      final remoteMovies = await movieRemoteDataSource.getMovies(apiLink);
      movieLocalDataSource.cacheMovies(apiLink, remoteMovies);
      return remoteMovies;
    }
    return movieLocalDataSource.getMovies(apiLink);
  }
}