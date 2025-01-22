class MovieDetailModel {
  final dynamic id;
  final List<String> genres;
  final int runtime;
  final String overview;
  final double voteAverage;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        runtime = json["runtime"],
        voteAverage = json['vote_average'],
        genres = (json['genres'] as List)
            .map((genre) => genre['name'].toString())
            .toList(),
        overview = json["overview"];
}
