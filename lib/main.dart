import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:wheather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: getColorByCondition(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition)),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getColorByCondition(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  final normalizedCondition = condition.toLowerCase().trim();
  switch (normalizedCondition) {
    case 'sunny':
      return Colors.amber;
    case 'partly cloudy':
      return Colors.orange;
    case 'cloudy':
    case 'overcast':
    case 'patchy snow possible':
    case 'blowing snow':
    case 'blizzard':
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'ice pellets':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.red; // Use Colors.grey as a MaterialColor
    case 'mist':
      return Colors.blueGrey;
    case 'patchy rain possible':
    case 'light rain':
    case 'moderate rain at times':
    case 'heavy rain at times':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.green;
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
    case 'thundery outbreaks possible':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.purple;
    case 'fog':
    case 'freezing fog':
      return Colors.grey;
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'moderate drizzle':
    case 'heavy drizzle':
    case 'patchy light rain':
    case 'moderate rain':
    case 'heavy rain':
      return Colors.brown;
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.cyan;
    default:
      return Colors.blue;
  }
}
