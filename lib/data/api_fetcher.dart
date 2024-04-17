import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/clutter/spotify_cre.dart';

class ApiFetcher {
  static var client = http.Client();
  static Future<Map<String, dynamic>> get authorizedToken async {
    const url = 'https://accounts.spotify.com/api/token';
    final response = await client.post(Uri.parse(url), body: {
      'grant_type': 'client_credentials',
      'client_id': 'c875137621c54c8392a5aff1e4471489',
      'client_secret': '711c13f3e8764a9da32c26c6fdd275df'
    }, headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    });
    return json.decode(response.body);
  }

  static Future<Response> fetchData(String bodyUrl) async {
    Uri parsedUri = Uri.parse("$spotifyUrl/$bodyUrl");
    final token = await authorizedToken;
    final response = await client.get(
      parsedUri,
      headers: {'Authorization': 'Bearer ${token["access_token"]}'},
    );
    return response;
  }
}
