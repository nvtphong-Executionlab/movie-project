
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Presentation/logic_holders/providers/service_provider.dart';

final movieProvider = FutureProvider.family((ref, apiLink){
  final service = ref.watch(trendingServiceProvider);
  return service.call(apiLink);
});