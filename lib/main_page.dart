import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_proj/dat_model.dart';
import 'package:weather_proj/data_from_api.dart';
import 'package:weather_proj/main_page_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int temp = 0;
  late Future<DataModel> future;
  String logo = 'assets/images/sunny.gif';

  // final Forecasts forecasts;

  @override
  void initState() {
    future = WeatherService.fetchCurrentWeather();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff47bfdf),
      body: ScreenWidget(),
    );
  }
}

