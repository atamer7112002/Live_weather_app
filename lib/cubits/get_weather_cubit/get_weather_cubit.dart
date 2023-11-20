import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:wheather_app/models/weather_model.dart';
import 'package:wheather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  WeatherModel? weatherModel;
  GetWeatherCubit() : super(WeatherInitialState());
  getWeather({required String cityname}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(CityName: cityname);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
