import '../domain/post.dart';

class LikeAction {
  final int postId;

  const LikeAction(this.postId);
}

class UnlikeAction {
  final int postId;

  const UnlikeAction(this.postId);
}

class LoadNextPostsAction {}

class LoadPrevPostsAction {}

class PostLoadedAction {
  final List<Post> posts;
  final int page;

  PostLoadedAction(this.posts, this.page);
}
