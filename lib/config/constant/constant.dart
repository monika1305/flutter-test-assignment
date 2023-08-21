
 const String movieApiBaseUrl = 'https://api.themoviedb.org/3/movie';
 const String authorization = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlODBiMzVjNzljOWFlZWNjODhkMDJkYjhjNzQzN2Y5ZSIsInN1YiI6IjVhOTZjYjhiOTI1MTQxN2IwOTAwYmY3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Sd4tLKX0VYKsmMBnkGdled_0c-KuPrqibgMwvyz1ndY';
 const String language = 'en-US&page=1 HTTP/1.1';
 const String accept = 'application/json';
 const String api_key = 'e80b35c79c9aeecc88d02db8c7437f9e';
 const String home_cover_image = 'https://miro.medium.com/v2/resize:fit:1200/1*J8UPZaaGJZBcH94PZXSVRQ.jpeg';

 class ConstantValueApiGet{
  static String imagePath(String path) =>'https://image.tmdb.org/t/p/w500$path';
  static String DetailsMovie(int id) => '$movieApiBaseUrl/$id?api_key=$api_key';
  static String VideoMovie(int id) => '$movieApiBaseUrl/$id/videos?api_key=$api_key';


 }