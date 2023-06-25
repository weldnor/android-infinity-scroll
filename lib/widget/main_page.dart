import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:infinity_scroll/redux/state.dart';
import 'package:infinity_scroll/widget/post_widget.dart';

import '../redux/actions.dart';
import 'post_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
              builder: (context, state) {
        var store = StoreProvider.of<AppState>(context);

        var posts = state.posts;
        if (posts.isEmpty) {
          store.dispatch(LoadNextPostsAction());
        }

        return ListView.builder(
            padding: const EdgeInsets.only(bottom: 10),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              if (index == state.posts.length - 1) {
                store.dispatch(LoadNextPostsAction());
                return const Center(child: CircularProgressIndicator());
              }

              return GestureDetector(
                  onTap: () => {_onImagePressed(context, index)}, child: PostWidget(postIndex: index));
            });
      },
    )));
  }

  Future<void> _onImagePressed(context, int postIndex) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PostPage(postIndex: postIndex),
      ),
    );
    var store = StoreProvider.of<AppState>(context);
    store.dispatch(RefreshAction());
  }
}
