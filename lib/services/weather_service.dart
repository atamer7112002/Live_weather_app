import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:wheather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '9974ac54bc7043c1a47174518230611';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String CityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$CityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'Oops there is an error , try later';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops there is an error , try later');
    }
  }
}
