import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    print("dio Init");
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.openai.com/v1/engines/text-davinci-003',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    return await dio!.post(url, data: data);
  }
}
