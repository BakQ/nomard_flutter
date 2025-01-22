class MovieModel {
  final String posterPath;
  final dynamic id;
  final String originalLanguage;
  final String originalTitle;
  final String title;

  MovieModel.fromJson(Map<String, dynamic> json)
      : posterPath = json['poster_path'] != null
            ? 'https://image.tmdb.org/t/p/w500' + json['poster_path']
            : '', // null일 경우 빈 문자열 처리
        id = json['id']?.toString() ?? '',
        originalLanguage = json['original_language'] ?? '',
        originalTitle = json['original_title'] ?? '',
        title = json['title'] ?? '';
}
