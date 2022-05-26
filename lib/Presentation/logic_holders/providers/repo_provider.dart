
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_project/Data/Repositories/movie_repo.dart';
import 'package:movie_project/Presentation/logic_holders/providers/connection_provider.dart';
import 'package:movie_project/Presentation/logic_holders/providers/local_provider.dart';
import 'package:movie_project/Presentation/logic_holders/providers/remote_provider.dart';

final repoProvider = Provider((ref){
  final movieLocal = ref.watch(MovieLocalProvider);
  final movieRemote = ref.watch(MovieRemoteProvider);
  final connectionInfo = ref.watch(connectionProvider);
  return MovieRepository(movieLocal, movieRemote, connectionInfo);
});

