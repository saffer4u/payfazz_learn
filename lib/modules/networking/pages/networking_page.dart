import 'dart:developer';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../retrofit/models/post.dart';
import '../blocs/networking_bloc.dart';
import '../blocs/networking_states.dart';

class Networking extends StatefulWidget {
  const Networking({Key? key}) : super(key: key);

  @override
  State<Networking> createState() => _NetworkingState();
}

class _NetworkingState extends State<Networking> {
  // final NetworkingBloc _bloc = NetworkingBloc();
  final NetworkingBloc _bloc =
      Modular.get<NetworkingBloc>(module: "NetworkingModule")!;
  late List<Post> posts;
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    _bloc.getPosts();
    // getPosts();
  }

  // Future<void> getPosts() async {
  //   print("get posts called");
  //   posts = await PostsRepo().getPosts();

  //   print(posts[0].title);
  // }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    _bloc.close();
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    log("BACK BUTTON INTERCEPTED"); // Do some stuff.
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // BasicClass basicClass = const BasicClass(id: "1234", text: "hello");
    // basicClass = basicClass.copyWith(id: "3432");

    // Person person = Person(
    //     name: "aftab",
    //     dob: DateTime.parse("2022-07-22 10:22:33.734237"),
    //     address: const [
    //       Address(
    //         userDistrict: "Barabanki",
    //         landmark: "Palhari",
    //         pin: 225001,
    //       )
    //     ]);

    // Person person2 = Person.fromJson(const {
    //   "name": "aftab",
    //   "dob": "2022-07-22 10:22:33.734237",
    //   "address": [
    //     {"pin": 225001, "userDistrict": "Barabanki", "landmark": "Palhari"}
    //   ]
    // });

    // print(person == person2);

    // return Scaffold(
    //   appBar: AppBar(
    //     centerTitle: true,
    //     title: const Text("Second Page"),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const Text("Back button Intercepted"),
    //         CachedNetworkImage(
    //           imageUrl: "https://picsum.photos/200/300",
    //           progressIndicatorBuilder: (ctx, url, prog) =>
    //               CircularProgressIndicator(value: prog.progress),
    //         ),
    //         // Image.network("https://picsum.photos/200/300"),
    //       ],
    //     ),
    //   ),
    // );

    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<NetworkingBloc, NetworkingState>(
          listener: (context, state) {
        if (state is NetworkingErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Error while fetching data ${state.message}"),
            ),
          );
        } else if (state is NetworkingSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${state.posts.length} Posts fetched"),
            ),
          );
        }
      }, builder: (context, state) {
        final posts = state is NetworkingSuccessState ? state.posts : <Post>[];

        return Scaffold(
          appBar: AppBar(
            title: const Text("Networking"),
          ),
          body: state is NetworkingLoadingState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    // return ListTile(
                    //   title: Text(posts[index].title),
                    //   subtitle: Text(posts[index].body ?? ""),
                    // );

                    return ExpandablePanel(
                      header: Text(posts[index].title),
                      collapsed: Text(
                        posts[index].body ?? "",
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      expanded: Text(
                        posts[index].body!,
                        softWrap: true,
                      ),
                    );
                  },
                ),
        );
      }),
    );
  }
}
