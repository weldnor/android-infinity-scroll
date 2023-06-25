import '../domain/post.dart';

class LikeAction {
  final int postIndex;

  const LikeAction(this.postIndex);

  @override
  String toString() {
    return 'LikeAction{postIndex: $postIndex}';
  }
}

class UnlikeAction {
  final int postIndex;

  const UnlikeAction(this.postIndex);

  @override
  String toString() {
    return 'UnlikeAction{postIndex: $postIndex}';
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

class RefreshAction {}
