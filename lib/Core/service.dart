import 'package:equatable/equatable.dart';

abstract class Service {
  Future call(dynamic params);
}