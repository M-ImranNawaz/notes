import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'app_exceptions.dart';

class BaseClient {
  Future<dynamic> get(String baseUrl, String api, {String token = ""}) async {
    var uri = Uri.parse(baseUrl + api);
    var headers = getHeaders(token);
    try {
      var response = await http
          .get(uri, headers: headers)
          .timeout(const Duration(seconds: 7));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
          message: 'No Internet Connection', url: uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          message: 'Api Not Responded in Time', url: uri.toString());
    }
  }

  Future<dynamic> post(String baseUrl, String api, mapData,
      {String token = ""}) async {
    var uri = Uri.parse(baseUrl + api);
    var headers = getHeaders(token);
    try {
      var response = await http
          .post(uri, body: mapData, headers: headers)
          .timeout(const Duration(seconds: 7));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
          message: 'No Internet Connection', url: uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          message: 'Api Not Responded in Time', url: uri.toString());
    }
  }

  Future<dynamic> delete(String baseUrl, String api, token) async {
    var uri = Uri.parse(baseUrl + api);
    var headers = getHeaders(token);
    try {
      var response = await http
          .delete(uri, headers: headers)
          .timeout(const Duration(seconds: 7));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
          message: 'No Internet Connection', url: uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          message: 'Api Not Responded in Time', url: uri.toString());
    }
  }

  Future<dynamic> update(String baseUrl,  String api,mapData, token) async {
    var uri = Uri.parse(baseUrl + api);
    var headers = getHeaders(token);
    try {
      var response = await http
          .put(uri, body: mapData, headers: headers)
          .timeout(const Duration(seconds: 7));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
          message: 'No Internet Connection', url: uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          message: 'Api Not Responded in Time', url: uri.toString());
    }
  }

  getHeaders(token) {
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    if (token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 202:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(
            message: utf8.decode(response.bodyBytes),
            url: response.request!.url.toString());
      case 406:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 401:
      case 403:
      case 404:
        var data = utf8.decode(response.bodyBytes);
        throw UnAutthorizedException(
            message: data.substring(13, data.length - 3),
            url: response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            message: 'Error Occured with code: ${response.statusCode}',
            url: response.request!.url.toString());
    }
  }
}
