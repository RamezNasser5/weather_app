import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit_state.dart';
import 'package:weatherapp/models/wether_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;

  getCurrentWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService(dio: Dio())
          .getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
