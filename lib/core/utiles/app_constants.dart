class ApiConstance {
  static final String baseUrl = "https://api.themoviedb.org/3";
  static final String apiKey = "7017ac3a4190bd3a08c452e8f3406923";

  static final String nowPlayingMoviesPath = "$baseUrl/movie/now_playing";
  static final String popularMoviesPath = "$baseUrl/movie/top_rated";
  static final String topRatedMoviesPath = "$baseUrl/movie/now_playing";
  static final String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl({required String path}) =>
      "$baseImageUrl$path";
}
