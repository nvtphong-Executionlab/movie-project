import 'package:equatable/equatable.dart';

abstract class Service {
  Future callMovies(dynamic params);
  Future callCasts(dynamic params);
  Future callCareer(dynamic params);
}