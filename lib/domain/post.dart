class Post {
  int id;
  String url;
  bool isLiked;

  Post({required this.id, required this.url, required this.isLiked});

  Post copyWith({int? id, String? url, bool? isLiked}) {
    return Post(
      id: id ?? this.id,
      url: url ?? this.url,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}