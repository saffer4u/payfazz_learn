import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

import 'models/post.dart';


part 'posts_api_clint.g.dart';

@RestApi()
abstract class PostsApiClint {

  factory PostsApiClint.withDefaultDio({String? baseUrl}) {
    return PostsApiClint(
      Dio(),
      baseUrl: "https://jsonplaceholder.typicode.com",
    );
  }

  factory PostsApiClint(Dio dio, {String? baseUrl}) {
    return _PostsApiClint(
      dio,
      baseUrl: "https://jsonplaceholder.typicode.com",
    );
  }

  @GET("/posts")
  Future<List<Post>> getPosts();
}
