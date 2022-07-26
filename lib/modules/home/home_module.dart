import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payfazz_learn/main.dart';

import 'package:payfazz_learn/modules/home/pages/home_page.dart';
import 'package:payfazz_learn/modules/home/pages/web_view.dart';
import 'package:payfazz_learn/modules/networking/netoworking_module.dart';
import 'package:payfazz_learn/modules/networking/pages/networking_page.dart';
import 'package:payfazz_learn/modules/random/random_module.dart';

class HomeModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => const HomePage()),
        ModularRouter("/webview",child: (context, args) => const WebViewExample()),
        ModularRouter("/Networking", module: NetworkingModule()),
        ModularRouter("/random",module: RandomModule()),
      ];

  @override
  Widget get bootstrap => const MyApp();
}
