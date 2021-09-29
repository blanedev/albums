import 'dart:io';
import 'package:album/model/failure/failure.dart';
import 'package:dio/dio.dart';

class AlbumsRepository {
  late final Dio _httpClient;

  AlbumsRepository(this._httpClient);

  Future<dynamic> fetchAllAlbums() async {
    try {
      _httpClient.options.queryParameters.putIfAbsent("id", () => "909253");
      _httpClient.options.queryParameters.putIfAbsent("entity", () => "album");
      final response = await _httpClient.get('/lookup');
      final data = response.data;
      return data;
    } on HttpException {
      throw Failure("Couldn't find any album 😐");
    } on SocketException {
      throw Failure("No internet connection, please turn on the network! 😁");
    } on FormatException {
      throw Failure("Bad response format 😑");
    }
  }
}
