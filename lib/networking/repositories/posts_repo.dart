import 'package:payfazz_learn/networking/retrofit/posts_api_clint.dart';

import '../models/post.dart';

class PostsRepo {
  late PostsApiClint apiClint;
  PostsRepo() {
    apiClint = PostsApiClint.withDefaultDio();
  }
  Future<List<Post>> getPosts() async {
    final response = await apiClint.getPosts();
    return response;
  }
}
