import 'actions.dart';
import 'state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is PostLoadedAction) {
    return state.copyWith(posts: action.posts, page: action.page);
  }
  return state;
}
