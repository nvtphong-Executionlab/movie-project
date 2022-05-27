
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Presentation/logic_holders/providers/service_provider.dart';

final movieProvider = FutureProvider.family((ref, apiLink){
  final service = ref.watch(serviceProvider);
  return service.callMovies(apiLink);
});

final castProvider = FutureProvider.family((ref, apiLink) {
  final service = ref.watch(serviceProvider);
  return service.callCasts(apiLink);
});

final careerProvider = FutureProvider.family((ref, castEntity) {
  final service = ref.watch(serviceProvider);
  return service.callCareer(castEntity);
});