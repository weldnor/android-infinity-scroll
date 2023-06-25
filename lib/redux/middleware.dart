import 'package:infinity_scroll/domain/post.dart';
import 'package:infinity_scroll/redux/actions.dart';
import 'package:infinity_scroll/redux/state.dart';
import 'package:redux/redux.dart';

import '../repository/post_repository.dart';

class LoggerMiddleware extends MiddlewareClass<AppState> {
  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    print(action.toString());
    next(action);
  }
}

class ApiMiddleware extends MiddlewareClass<AppState> {
  final _postsPerPage = 100;
  final _postRepository = PostRepository();

  @override
  Future call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is LoadNextPostsAction) {
      return await _fetchPosts(store, store.state.page + 1);
    }

    next(action);
  }

  Future<void> _fetchPosts(Store<AppState> store, int page) async {
    if (page < 0) {
      return;
    }

    List<Post> newPosts = await _postRepository.getPosts(page, _postsPerPage);
    store.dispatch(PostLoadedAction(newPosts, page));
  }
}
