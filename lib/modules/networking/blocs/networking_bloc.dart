import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payfazz_learn/modules/networking/netoworking_module.dart';

import '../repositories/posts_repo.dart';
import 'networking_states.dart';

class NetworkingBloc extends Cubit<NetworkingState> {
  NetworkingBloc() : super(NetworkingInitialState());

  Future<void> getPosts() async {
    emit(NetworkingLoadingState());
    try {
      final provider = await Modular.get<PostsRepo>()!.getPosts();
      emit(NetworkingSuccessState(posts: provider));
    } on DioError catch (e) {
      emit(NetworkingErrorState(message: e.toString()));
    }
  }
}
