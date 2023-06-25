import '../domain/post.dart';

class AppState {
  final List<Post> posts;
  final int page;

  const AppState({this.posts = const [], this.page = 0});

  AppState copyWith({List<Post>? posts, int? page}) {
    return AppState(
      posts: posts ?? this.posts,
      page: page ?? this.page,
    );
  }
}
