import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:infinity_scroll/redux/actions.dart';
import 'package:infinity_scroll/redux/state.dart';
import 'package:redux/redux.dart';

class PostPage extends StatelessWidget {
  final int postIndex;

  const PostPage({super.key, required this.postIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        var store = StoreProvider.of<AppState>(context);
        var post = state.posts[postIndex];
        var postIsLiked = post.isLiked;

        return Column(children: [
          CachedNetworkImage(
            imageUrl: post.url,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Row(children: [
            OutlinedButton(
                child: Text(post.isLiked ? 'liked' : 'like'),
                onPressed: () {
                  return _likeButtonPressed(store, postIsLiked);
                })
          ])
        ]);
      },
    )));
  }

  void _likeButtonPressed(Store<AppState> store, bool isLiked) {
    if (isLiked) {
      store.dispatch(UnlikeAction(postIndex));
      return;
    }
    //else
    store.dispatch(LikeAction(postIndex));
  }
}
