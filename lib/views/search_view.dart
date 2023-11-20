import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextField(
          onSubmitted: (value) async {
            Navigator.pop(context);
            var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
            getWeatherCubit.getWeather(cityname: value);
          },
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 25, horizontal: 16),
              labelText: 'search',
              suffixIcon: Icon(Icons.search),
              suffixIconColor: Colors.black,
              border: OutlineInputBorder(),
              hintText: 'Enter city name'),
        ),
      )),
    );
  }
}
