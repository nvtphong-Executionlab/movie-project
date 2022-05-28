import 'package:equatable/equatable.dart';

abstract class Service {
 // Future callMovies(dynamic params);
  Future callCasts(dynamic params);
  Future callCareer(dynamic params);
 // Future callReviews(dynamic params);
 // Future callVideo(dynamic params);
  Future callDataList(dynamic typeList, dynamic params);
}