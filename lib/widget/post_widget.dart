import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../redux/actions.dart';
import '../redux/state.dart';

class PostWidget extends StatelessWidget {
  final int postIndex;

  const PostWidget({super.key, required this.postIndex});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, vm) {
        var post = vm.posts[postIndex];

        return Column(children: [
          CachedNetworkImage(
            imageUrl: post.url,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Row(
            children: [
              OutlinedButton(
                  child: Text(post.isLiked ? 'liked' : 'like'),
                  onPressed: () => {onLikeButtonPressed(context, postIndex, post.isLiked)})
            ],
          )
        ]);
      },
    );
  }

  Future onLikeButtonPressed(context, int postIndex, bool isLiked) async {
    var store = StoreProvider.of<AppState>(context);
    if (isLiked) {
      store.dispatch(UnlikeAction(postIndex));
      return;
    }
    //else
    store.dispatch(LikeAction(postIndex));
  }
}
