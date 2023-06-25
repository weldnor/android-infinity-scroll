import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:infinity_scroll/domain/post.dart';
import 'package:infinity_scroll/redux/state.dart';
import 'package:infinity_scroll/widget/post_widget.dart';

import '../redux/actions.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, vm) {
        var store = StoreProvider.of<AppState>(context);

        var posts = vm.posts;
        if (posts.isEmpty) {
          store.dispatch(LoadNextPostsAction());
          return const Text('load..');
        }

        return ListView.builder(
            padding: const EdgeInsets.only(bottom: 10),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              if (index == vm.posts.length - 1) {
                store.dispatch(LoadNextPostsAction());
                return const Center(child: CircularProgressIndicator());
              }

              Post post = posts[index];
              return PostWidget(url: post.url, liked: false);
            });
      },
    )));
  }
}
