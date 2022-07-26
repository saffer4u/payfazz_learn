import 'package:bloc/bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:payfazz_learn/modules/random/blocs/cache_manager_states.dart';

class CacheManagerBloc extends Cubit<CacheManagerState> {
  CacheManagerBloc() : super(CacheManagerInitialState());

  Future<void> getCacheFile() async {
    emit(CacheManagerLoadingState());
    var file = await DefaultCacheManager()
        .getSingleFile("https://picsum.photos/200/300");

    emit(CacheManagerSuccess(file: file));
  }
}
