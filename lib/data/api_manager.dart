import 'dart:convert';
import 'package:http/http.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';

class ApiManager{
   Future<MovieDetails> getPopular()async{
    Response serverResponse  =
        await get(Uri.parse('https://api.themoviedb.org/3/movie/popular'));
    if (serverResponse .statusCode >= 200 && serverResponse .statusCode < 300) {
      Map json = jsonDecode(serverResponse .body) as Map;
      var results = MovieDetails.fromJson(json);
      return results;
    } else {
      throw "Something went wrong please try again later";
    }
  }

   Future<MovieDetails> getUpComing()async{
    Response serverResponse  =
    await get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming'));
    if (serverResponse .statusCode >= 200 && serverResponse .statusCode < 300) {
      Map json = jsonDecode(serverResponse .body) as Map;
      var results = MovieDetails.fromJson(json);
      return results;
    } else {
      throw "Something went wrong please try again later";
    }
  }

   Future<MovieDetails> getTopRated()async{
    Response serverResponse  =
    await get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated'));
    if (serverResponse .statusCode >= 200 && serverResponse .statusCode < 300) {
      Map json = jsonDecode(serverResponse .body) as Map;
      var results = MovieDetails.fromJson(json);
      return results;
    } else {
      throw "Something went wrong please try again later";
    }
  }

   Future<MovieDetails> getRecommended()async{
    Response serverResponse  =
    await get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated'));
    if (serverResponse .statusCode >= 200 && serverResponse .statusCode < 300) {
      Map json = jsonDecode(serverResponse .body) as Map;
      var results = MovieDetails.fromJson(json);
      return results;
    } else {
      throw "Something went wrong please try again later";
    }
  }

   Future<MovieDetails> getMovieDetails(num movieId)async{
    Response serverResponse  =
    await get(Uri.parse('https://api.themoviedb.org/3/movie/$movieId'));
    if (serverResponse .statusCode >= 200 && serverResponse .statusCode < 300) {
      Map json = jsonDecode(serverResponse .body) as Map;
      var results = MovieDetails.fromJson(json);
      return results;
    } else {
      throw "Something went wrong please try again later";
    }
  }
}
