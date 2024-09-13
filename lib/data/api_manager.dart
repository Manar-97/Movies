import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movies/data/models/movie_category/movie_category.dart';
import 'package:movies/data/models/movie_datails/movie_details.dart';

@singleton
class ApiManager {
  static const String baseUrl = "api.themoviedb.org";
  static const Map<String, String> headers = {
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYzg0N2UwZGI2NDllMjNjYjcyNzEwZDI1NmEyZDk5NCIsIm5iZiI6MTcyNTg0NjIxNy44Mzc0OTUsInN1YiI6IjY2ZDJmNzM1NjcyMDVhMDYzNWIwODI2ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PAyC7LVF0EQUDgnilFb9w-3ijZucSZBJZ8JdN28IeMo",
    "accept": "application/json"
  };

  Future<MovieDetails> getPopular() async {
    var url = Uri.https(baseUrl, "/3/movie/popular", {
      "language": "en-US",
      "page": "1",
    });
    var serverResponse = await http.get(url, headers: headers);
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      var popularResponse = MovieDetails.fromJson(json);
      return popularResponse;
    } else {
      throw "Something went wrong please try again later";
    }
  }

  Future<MovieDetails> getNewRelease() async {
    var url = Uri.https(baseUrl, "/3/movie/upcoming", {
      "language": "en-US",
    });

    var serverResponse = await http.get(url, headers: headers);
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      var releasesResponse = MovieDetails.fromJson(json);
      return releasesResponse;
    } else {
      throw "Something went wrong please try again later";
    }
  }

  Future<MovieDetails> getRecommended() async {
    var url = Uri.https(baseUrl, "/3/movie/top_rated", {"language": "en_US"});

    var serverResponse = await http.get(url, headers: headers);
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      MovieDetails movies = MovieDetails.fromJson(json);
      return movies;
    } else {
      throw "Something went wrong please try again later";
    }
  }

  Future<MovieDetails> getMovieDetails(num movieId) async {
    Uri url = Uri.https(baseUrl, "/3/movie/$movieId", {"language": "en_US"});

    var serverResponse = await http.get(url, headers: headers);
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      MovieDetails movieDetails = MovieDetails.fromJson(json);
      return movieDetails;
    } else {
      throw "Something went wrong please try again later";
    }
  }

  Future<MovieDetails> getSimilarMovie(num movieId) async {
    Uri url =
        Uri.https(baseUrl, "/3/movie/$movieId/similar", {"language": "en_US"});
    var serverResponse = await http.get(url, headers: headers);
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      MovieDetails similar = MovieDetails.fromJson(json);
      return similar;
    } else {
      throw "Something went wrong please try again later";
    }
  }

  Future<MovieDetails> getSearchResults(String query) async {
    Uri url = Uri.https(
        baseUrl, "/3/search/movie", {"language": "en_US", "query": query});

    var serverResponse = await http.get(url, headers: headers);
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      MovieDetails results = MovieDetails.fromJson(json);
      return results;
    } else {
      throw "Something went wrong please try again later";
    }
  }

  static Future<MovieCategory> getCategory() async {
    Uri url = Uri.https(baseUrl, "3/genre/movie/list", {"language": "en_US"});
    var serverResponse =
        await http.get(url,headers: headers);
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      MovieCategory results = MovieCategory.fromJson(json);
      return results;
    } else {
      throw "Something went wrong please try again later";
    }
  }

  Future<MovieDetails> getGenereMovie(num id) async {
    Uri url = Uri.https(baseUrl, "/3/discover/movie", {
      "language": "en_US",
      "with_genres": id.toString(),
    });
    var serverResponse = await http.get(url, headers: headers);
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      MovieDetails results = MovieDetails.fromJson(json);
      return results;
    } else {
      throw "Something went wrong please try again later";
    }
  }
}
