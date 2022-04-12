import 'package:dio/dio.dart';

class ApiRequest {
  final String endpoint;
  final Map<String,dynamic>data;

  ApiRequest({
    required this.endpoint,
    required this.data,
  });

  Dio _dio() {
    // Put your authorization token here
    return Dio(
        BaseOptions( headers: {
          'Authorization': '563492ad6f9170000100000152fb712088fe48e1b3992257d3c5ef17',
        }));
  }

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _dio().get(endpoint, queryParameters: data).then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }
}
