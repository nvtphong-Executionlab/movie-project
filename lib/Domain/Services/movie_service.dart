import 'package:movie_project/Core/service.dart';
import 'package:movie_project/Domain/Entities/MovieEntity.dart';
import 'package:movie_project/Domain/Respositoties/repo_interface.dart';
import '../Entities/ListEntity.dart';

class MovieService extends Service
{
  final RepositoryInterface repositoryInterface;
  MovieService(this.repositoryInterface);

  // @override
  // Future<ListEntity> callMovies(dynamic params) async {
  //   return await repositoryInterface.getMovies(params);
  // }
  @override
  Future callCasts(params) async {
    return await repositoryInterface.getCasts(params);
  }

  @override
  Future callCareer(params) async {
    // TODO: implement callCareer
    return await repositoryInterface.getCareer(params);
  }
  // @override
  // Future callReviews(params) async {
  //   return await repositoryInterface.getReviews(params);
  // }

  // @override
  // Future callVideo(params) async {
  //   return await repositoryInterface.getVideos(params);
  // }

  @override
  Future callDataList(typeList, params) async {
    return await repositoryInterface.getDataList(typeList, params);
  }



}