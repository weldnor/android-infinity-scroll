import '../domain/post.dart';

class LikeAction {
  final int postId;

  const LikeAction(this.postId);

  @override
  String toString() {
    return 'LikeAction{postId: $postId}';
  }
}

class UnlikeAction {
  final int postId;

  const UnlikeAction(this.postId);

  @override
  String toString() {
    return 'UnlikeAction{postId: $postId}';
  }
}

class LoadNextPostsAction {
  @override
  String toString() {
    return 'LoadNextPostsAction{}';
  }
}

class LoadPrevPostsAction {}

class PostLoadedAction {
  final List<Post> posts;
  final int page;

  PostLoadedAction(this.posts, this.page);

  @override
  String toString() {
    return 'PostLoadedAction{page: $page, posts: $posts }';
  }
}
