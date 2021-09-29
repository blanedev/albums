import 'dart:io';
import 'package:album/model/album/album.dart';
import 'package:album/model/failure/failure.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class AlbumsRepository {
  late final Dio _httpClient;

  AlbumsRepository(this._httpClient);

  Future<Artist> fetchAllAlbums() async {
    try {
      _httpClient.options.queryParameters.putIfAbsent("id", () => "909253");
      _httpClient.options.queryParameters.putIfAbsent("entity", () => "album");
      final response = await _httpClient.get('/lookup');
      final json = jsonDecode(response.data);
      final results = json['results'] as List;
      Artist artist = Artist.fromJson(results[0]);
      List<Album> lstAlbum = [];
      for (int i = 1; i < results.length; i++) {
        Album album = Album.fromJson(results[i]);
        lstAlbum.add(album);
      }
      artist.lstAlbum = lstAlbum;
      return artist;
    } on HttpException {
      throw Failure("Couldn't find any album 😐");
    } on SocketException {
      throw Failure("No internet connection, please turn on the network! 😁");
    } on FormatException {
      throw Failure("Bad response format 😑");
    }
  }
}
