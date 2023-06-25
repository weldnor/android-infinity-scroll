import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final String url;
  final bool liked;

  const PostWidget({super.key, required this.url, required this.liked});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image(
        image: NetworkImage(url),
      ),
      Row(
        children: [OutlinedButton(child: Text(liked ? 'liked' : 'like'), onPressed: () => {})],
      )
    ]);
  }
}
