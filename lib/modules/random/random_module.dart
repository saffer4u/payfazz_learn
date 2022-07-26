import 'package:flutter_modular/flutter_modular.dart';
import 'package:payfazz_learn/modules/random/blocs/cache_manager_bloc.dart';
import 'package:payfazz_learn/modules/random/pages/cache_manager_page.dart';
import 'package:payfazz_learn/modules/random/pages/random_page.dart';

class RandomModule extends ChildModule {
  @override
  List<Bind>? get binds => [
        Bind<CacheManagerBloc>((i) => CacheManagerBloc()),
      ];

  @override
  List<ModularRouter>? get routers => [
        ModularRouter(
          "/",
          child: (context, args) => const RandomPage(),
        ),
        ModularRouter(
          "/cache_manager",
          child: (context, args) => const CacheManagerPage(),
        ),
      ];
}
