

import '../../../retrofit/models/post.dart';
import '../../../retrofit/posts_api_clint.dart';

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
