import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../networking/pages/networking_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  Modular.to.pushNamed("/webview");
                },
                child: const Text("Web view"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await AppSettings.openDeviceSettings();
                },
                child: const Text("Open Settings"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => const Networking(),
                  // ));
                  Modular.to.pushNamed("/Networking");
                },
                child: const Text("Goto Networking Module"),
              ),
              ElevatedButton(
                onPressed: () {
                  Modular.to.pushNamed("/random");
                },
                child: const Text("Goto Random Module"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
