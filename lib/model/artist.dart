class Artist {
  const Artist(
      {required this.id,
      required this.name,
      required this.imgUrl,
      required this.followers,
      required this.genres,
      required this.popularity,
      required this.uri});
  final String id, name, imgUrl, uri;
  final int followers, popularity;
  final List<String> genres;
}
