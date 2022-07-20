import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dota_hero_list/common/constant/api_constant.dart';
import 'package:flutter_dota_hero_list/common/helper/custom_exception.dart';

class ApiService {
  late Dio dio;

  ApiService() {
    dio = Dio(
      BaseOptions(
        validateStatus: (status) => true,
        followRedirects: false,
        baseUrl: ApiConstant.baseUrl,
        connectTimeout: 45000,
        receiveTimeout: 45000,
      ),
    );
  }

  Future<Response> get(
      {required String endPoint, Map<String, dynamic>? query}) async {
    try {
      final Response response = await dio.get(
        endPoint,
        queryParameters: query,
      );

      return response;
    } on DioError catch (err) {
      log('error: $err');
      throw FetchDataException(
          "Network connection error, please make sure that you are conntected to Wifi/Data");
    }
  }

  Map<String, dynamic> classifyResponse(Response response) {
    final Map<String, dynamic> responseData =
        response.data as Map<String, dynamic>;
    switch (response.statusCode) {
      case 200:
        return responseData;
      case 400:
      case 401:
        throw UnauthorisedException(responseData["error"].toString());
      case 500:
        throw BadRequestException(responseData["error"].toString());
      default:
        throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}
