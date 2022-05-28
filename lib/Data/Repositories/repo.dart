

import 'package:movie_project/Core/connection_info.dart';
import 'package:movie_project/Data/Models/CastModel.dart';
import 'package:movie_project/Data/Models/ListModel.dart';
import 'package:movie_project/Domain/Entities/Entity.dart';
import 'package:movie_project/Domain/Respositoties/repo_interface.dart';

import '../../Domain/Entities/CastEntity.dart';
import '../../Domain/Entities/CreditEntity.dart';
import '../../Domain/Entities/ListEntity.dart';
import '../data_source/local_data_source.dart';
import '../data_source/remote_data_source.dart';

class MovieRepository implements RepositoryInterface {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  final ConnectionInfo connectionInfo;

  MovieRepository(this.localDataSource, this.remoteDataSource, this.connectionInfo);

  // @override
  // Future<ListEntity> getMovies(String apiLink) async{
  //   if(await connectionInfo.isConnected){
  //     final remoteMovies = await remoteDataSource.getMovies(apiLink);
  //     localDataSource.cacheModels(apiLink, remoteMovies);
  //     return remoteMovies;
  //   }
  //   return localDataSource.getMovies(apiLink);
  // }

  @override
  Future<CreditEntity> getCasts(String apiLink) async {
    if(await connectionInfo.isConnected){
      final remoteCasts = await remoteDataSource.getCasts(apiLink);
      localDataSource.cacheModels(apiLink, remoteCasts);
      return remoteCasts;
    }
    return localDataSource.getCasts(apiLink);
  }
  @override
  Future<CastEntity> getCareer(CastEntity castModel) async {
    if(await connectionInfo.isConnected){
      final remoteCasts = await remoteDataSource.getCareer(castModel as CastModel);
      localDataSource.cacheModels(castModel.creditId!, remoteCasts);
      return remoteCasts;
    }
    return localDataSource.getCareer(castModel as CastModel);
  }

  // @override
  // Future<ListEntity> getReviews(String apiLink) async {
  //   if(await connectionInfo.isConnected){
  //     final remoteReviews = await remoteDataSource.getReviews(apiLink);
  //     localDataSource.cacheModels(apiLink, remoteReviews);
  //     return remoteReviews;
  //   }
  //   return localDataSource.getReviews(apiLink);
  // }
  // @override
  // Future<ListEntity> getVideos(String apiLink) async {
  //   if(await connectionInfo.isConnected){
  //     final remoteReviews = await remoteDataSource.getVideos(apiLink);
  //     localDataSource.cacheModels(apiLink, remoteReviews);
  //     return remoteReviews;
  //   }
  //   return localDataSource.getVideos(apiLink);
  // }

  @override
  Future<ListEntity> getDataList(ListModel listModel, String apiLink) async {
    if(await connectionInfo.isConnected){
      final remoteReviews = await remoteDataSource.getDataList(listModel, apiLink);
      localDataSource.cacheModels(apiLink, listModel);
      return remoteReviews;
    }
    return localDataSource.getDataList(listModel, apiLink);
  }
}