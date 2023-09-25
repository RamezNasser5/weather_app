import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit_state.dart';
import 'package:weatherapp/pages/home_page.dart';

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
                primarySwatch: getMaterialColorForDayCondition(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getMaterialColorForDayCondition(String? dayCondition) {
  final Map<String, MaterialColor> colorMap = {
    "Sunny": Colors.orange,
    "Partly cloudy": Colors.blue,
    "Cloudy": Colors.grey,
    "Overcast": Colors.grey,
    "Mist": Colors.grey,
    "Patchy rain possible": Colors.lightBlue,
    "Patchy snow possible": Colors.grey,
    "Patchy sleet possible": Colors.blueGrey,
    "Patchy freezing drizzle possible": Colors.blueGrey,
    "Thundery outbreaks possible": Colors.deepPurple,
    "Blowing snow": Colors.grey,
    "Blizzard": Colors.grey,
    "Fog": Colors.grey,
    "Freezing fog": Colors.grey,
    "Patchy light drizzle": Colors.blueGrey,
    "Light drizzle": Colors.blueGrey,
    "Freezing drizzle": Colors.blueGrey,
    "Heavy freezing drizzle": Colors.blueGrey,
    "Patchy light rain": Colors.lightBlue,
    "Light rain": Colors.lightBlue,
    "Moderate rain at times": Colors.lightBlue,
    "Moderate rain": Colors.lightBlue,
    "Heavy rain at times": Colors.lightBlue,
    "Heavy rain": Colors.lightBlue,
    "Light freezing rain": Colors.lightBlue,
    "Moderate or heavy freezing rain": Colors.lightBlue,
    "Light sleet": Colors.blueGrey,
    "Moderate or heavy sleet": Colors.blueGrey,
    "Patchy light snow": Colors.grey,
    "Light snow": Colors.grey,
    "Patchy moderate snow": Colors.grey,
    "Moderate snow": Colors.grey,
    "Patchy heavy snow": Colors.grey,
    "Heavy snow": Colors.grey,
    "Ice pellets": Colors.grey,
    "Light rain shower": Colors.lightBlue,
    "Moderate or heavy rain shower": Colors.lightBlue,
    "Torrential rain shower": Colors.lightBlue,
    "Light sleet showers": Colors.blueGrey,
    "Moderate or heavy sleet showers": Colors.blueGrey,
    "Light snow showers": Colors.grey,
    "Moderate or heavy snow showers": Colors.grey,
    "Light showers of ice pellets": Colors.grey,
    "Moderate or heavy showers of ice pellets": Colors.grey,
    "Patchy light rain with thunder": Colors.deepPurple,
    "Moderate or heavy rain with thunder": Colors.deepPurple,
    "Patchy light snow with thunder": Colors.deepPurple,
    "Moderate or heavy snow with thunder": Colors.deepPurple,
  };
  if (dayCondition == null) {
    return Colors.blue;
  } else if (colorMap.containsKey(dayCondition)) {
    return colorMap[dayCondition]!;
  } else {
    return Colors.blue; // Default color for unknown conditions
  }
}



// create state
// create cubit
// create function
// provide cubit
// integrate cubit
// trigger cubit