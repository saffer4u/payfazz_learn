import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payfazz_learn/modules/random/blocs/cache_manager_bloc.dart';

import '../blocs/cache_manager_states.dart';

class CacheManagerPage extends StatelessWidget {
  const CacheManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<CacheManagerBloc>(module: "RandomModule")!;
    bloc.getCacheFile();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cache Manager"),
      ),
      body: BlocProvider.value(
        value: bloc,
        child: BlocConsumer<CacheManagerBloc, CacheManagerState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is CacheManagerLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CacheManagerSuccess) {
              return Center(child: Image.file(state.file));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
