import 'package:flutter/material.dart';
import 'package:infinity_scroll/domain/post.dart';
import 'package:infinity_scroll/repository/post_repository.dart';
import 'package:infinity_scroll/widget/post_widget.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final _postRepository = PostRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: FutureBuilder<List<Post>>(
      future: _getPosts(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return ListView(children: _getPostWidgets(snapshot.data));
        } else {
          return Container();
        }
      },
    )));
  }

  List<PostWidget> _getPostWidgets(List<Post> posts) {
    List<PostWidget> res = [];
    for (Post post in posts) {
      res.add(PostWidget(url: post.url, liked: false));
    }
    return res;
  }

  Future<List<Post>> _getPosts() async {
    return await _postRepository.getPosts(0, 10);
  }
}
