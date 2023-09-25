// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
// import 'package:weatherapp/models/wether_model.dart';
// import 'package:weatherapp/services/weather_service.dart';

// WeatherModel? weatherModel;

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          onSubmitted: (value) async {
            var blocProvider = BlocProvider.of<GetWeatherCubit>(context);
            blocProvider.getCurrentWeather(cityName: value);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            labelText: 'Search',
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            hintText: 'Entre City Name',
            suffixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      )),
    );
  }
}
