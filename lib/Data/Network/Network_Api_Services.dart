import 'dart:convert';
import 'dart:io';
import 'package:demo_projectapp/Data/App_Exception.dart';
import 'package:demo_projectapp/Data/Network/Base_Api_Services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url,
      {required Map<String, String> header, String? params}) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url), headers: header)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data,
      {Map<String, String>? header}) async {
    dynamic responseJson;
    try {
      debugPrint('url: $url\ndata: $data\n header:header');
      Response response =
          await post(Uri.parse(url), body: jsonEncode(data), headers: header)
              .timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getDeleteApiResponse(String url, dynamic data,
      {Map<String, String>? header}) async {
    dynamic responseJson;
    try {
      debugPrint('url: $url\ndata: $data\n header:header');
      Response response = await delete(Uri.parse(url), headers: header)
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BedRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error accured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }

  @override
  Future getPatchApiResponse(String url, dynamic data,
      {Map<String, String>? header}) async {
    dynamic responseJson;
    try {
      debugPrint('url: $url\ndata: $data\n header:header');
      Response response =
          await patch(Uri.parse(url), body: jsonEncode(data), headers: header)
              .timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
}
