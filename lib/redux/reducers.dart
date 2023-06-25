import '../domain/post.dart';
import 'actions.dart';
import 'state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is PostLoadedAction) {
    List<Post> newPosts = [...state.posts];
    newPosts.addAll(action.posts);
    return state.copyWith(posts: newPosts, page: action.page);
  }
  if (action is LikeAction) {
    List<Post> newPosts = [...state.posts];
    Post changedPost = newPosts[action.postIndex].copyWith(isLiked: true);
    newPosts[action.postIndex] = changedPost;
    return state.copyWith(posts: newPosts);
  }
  if (action is UnlikeAction) {
    List<Post> newPosts = [...state.posts];
    Post changedPost = newPosts[action.postIndex].copyWith(isLiked: false);
    newPosts[action.postIndex] = changedPost;
    return state.copyWith(posts: newPosts);
  }
  if (action is RefreshAction) {
    return state;
  }
  return state;
}
