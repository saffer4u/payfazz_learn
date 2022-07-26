import 'package:flutter_modular/flutter_modular.dart';
import 'package:payfazz_learn/modules/networking/blocs/networking_bloc.dart';
import 'package:payfazz_learn/modules/networking/repositories/posts_repo.dart';

import 'pages/networking_page.dart';

class NetworkingModule extends ChildModule {
  @override
  List<Bind>? get binds => [
        Bind<PostsRepo>((i) => PostsRepo(), singleton: true, lazy: true),
        Bind<NetworkingBloc>((i) => NetworkingBloc()),
        
      ];

  @override
  List<ModularRouter>? get routers => [
        ModularRouter("/networking",
            child: (context, args) => const Networking()),
      ];
}
