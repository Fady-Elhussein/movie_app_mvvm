class AppConstants {
  static final String baseUrl = "https://api.themoviedb.org/3";
  static final String apiKey = "7017ac3a4190bd3a08c452e8f3406923";

  static final String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static final String popularMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";
  static final String topRatedMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
}
