

import 'package:movie_project/Core/connection_info.dart';
import 'package:movie_project/Data/data_source/movie_data_source.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';
import 'package:movie_project/Domain/Respositoties/movie_repo_interface.dart';

class MovieRepository implements MovieRepositoryInterface {
  final MovieLocalDataSource movieLocalDataSource;
  final MovieRemoteDataSource movieRemoteDataSource;
  final ConnectionInfo connectionInfo;

  MovieRepository(this.movieLocalDataSource, this.movieRemoteDataSource, this.connectionInfo);

  @override
  Future<MovieEntity> getMovies() async{
    if(await connectionInfo.isConnected){
      final remoteMovies = await movieRemoteDataSource.getMovies();
      movieLocalDataSource.cacheMovies(remoteMovies);
      return remoteMovies;
    }
    return movieLocalDataSource.getMovies();
  }
}