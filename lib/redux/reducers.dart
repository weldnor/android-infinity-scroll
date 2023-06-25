import '../domain/post.dart';
import 'actions.dart';
import 'state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is PostLoadedAction) {
    List<Post> newPosts = [];
    newPosts.addAll(state.posts);
    newPosts.addAll(action.posts);
    return state.copyWith(posts: newPosts, page: action.page);
  }
  return state;
}
