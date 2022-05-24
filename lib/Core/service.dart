import 'package:equatable/equatable.dart';

abstract class Service<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}