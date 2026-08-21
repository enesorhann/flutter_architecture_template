//EAGER SINGLETON
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_architecture_app/core/base/model/base_model.dart';
import 'package:flutter_architecture_app/core/constants/app/app_constants.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance => _instance ??= NetworkManager._init();

  NetworkManager._init() {
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: AppConstants.baseURL,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    _dio = Dio(baseOptions);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.path = options.path.replaceAll(" ", "-");
        },
        onResponse: (response, handler) {
          return response.data;
        },
        onError: (DioException e, handler) {
          // Add your error interceptor logic here
          return handler.next(e);
        },
      ),
    );
  }
  Dio _dio = Dio();

  Future<dynamic> getDio<T extends BaseModel>(String path, T model) async {
    try {
      final response = await _dio.get(path);

      switch (response.statusCode) {
        case HttpStatus.ok:
          // Handle the response and map it to the model
          final responseBody = response.data;
          if (responseBody is List && responseBody.isNotEmpty) {
            return responseBody.map((e) => model.fromJson(e)).toList();
          } else if (responseBody is Map<String, dynamic>) {
            return model.fromJson(responseBody);
          } else {
            return responseBody;
          }

        default:
          // Handle other status codes
          break;
      }
    } catch (e) {
      // Handle errors
    }
  }
}
