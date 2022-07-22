import 'dart:developer';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:payfazz_learn/copy_with/basic_class.dart';
import 'package:payfazz_learn/json_serializable/address.dart';
import 'package:payfazz_learn/json_serializable/person.dart';
import 'package:payfazz_learn/networking/repositories/posts_repo.dart';

import 'networking/models/post.dart';

class SeconPage extends StatefulWidget {
  const SeconPage({Key? key}) : super(key: key);

  @override
  State<SeconPage> createState() => _SeconPageState();
}

class _SeconPageState extends State<SeconPage> {
  late List<Post> posts;
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    getPosts();
  }

  Future<void> getPosts() async {
    print("get posts called");
    posts = await PostsRepo().getPosts();
    
    print(posts[0].title);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    log("BACK BUTTON INTERCEPTED"); // Do some stuff.
    return true;
  }

  @override
  Widget build(BuildContext context) {
    BasicClass basicClass = const BasicClass(id: "1234", text: "hello");
    basicClass = basicClass.copyWith(id: "3432");

    Person person = Person(
        name: "aftab",
        dob: DateTime.parse("2022-07-22 10:22:33.734237"),
        address: const [
          Address(
            userDistrict: "Barabanki",
            landmark: "Palhari",
            pin: 225001,
          )
        ]);

    Person person2 = Person.fromJson(const {
      "name": "aftab",
      "dob": "2022-07-22 10:22:33.734237",
      "address": [
        {"pin": 225001, "userDistrict": "Barabanki", "landmark": "Palhari"}
      ]
    });

    // print(person == person2);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Back button Intercepted ${basicClass.id}"),
            CachedNetworkImage(
              imageUrl: "https://picsum.photos/200/300",
              progressIndicatorBuilder: (ctx, url, prog) =>
                  CircularProgressIndicator(value: prog.progress),
            ),
            // Image.network("https://picsum.photos/200/300"),
          ],
        ),
      ),
    );
  }
}
