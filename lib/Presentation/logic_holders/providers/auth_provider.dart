
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Core/constant.dart';
import 'package:movie_project/Data/Models/SessionModel.dart';
import 'package:movie_project/Presentation/logic_holders/providers/service_provider.dart';

import '../../../Data/Models/RequestTokenModel.dart';

final requestTokenProvider = FutureProvider((ref) {
  final service = ref.watch(serviceProvider);
  return service.callData(RequestTokenModel.getInstance(), '/authentication/token/new');
});

final tokenWithLogin = FutureProvider.family((ref, body){
  final service =  ref.watch(serviceProvider);
  return service.postData(RequestTokenModel.getInstance(), '/authentication/token/validate_with_login', body);
});

final sessionProvider = FutureProvider.family((ref, body) {
  final service = ref.watch(serviceProvider);
  return service.postData(SessionModel.getInstance(), '/authentication/session/new', body);
});

