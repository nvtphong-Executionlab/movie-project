import 'package:equatable/equatable.dart';

abstract class Service {
  Future callCasts(dynamic params);
  Future callCareer(dynamic params);
  Future callDataList(dynamic typeList, dynamic params);
  Future callData(dynamic type, dynamic params, {String sessionId = ''});
  Future postData(dynamic type, dynamic params, dynamic body);
}