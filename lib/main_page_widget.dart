import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'dat_model.dart';
import 'data_from_api.dart';

class ScreenWidget extends StatefulWidget {
  const ScreenWidget({Key? key}) : super(key: key);

  @override
  State<ScreenWidget> createState() => _ScreenWidgetState();
}

class _ScreenWidgetState extends State<ScreenWidget> {
  Map<String, String> engToRu = {
    "clear": "ясно",
    "partly-cloudy": "малооблачно",
    "cloudy": "облачно с прояснениями",
    "overcast": "пасмурно",
    "drizzle": "морось",
    "light-rain": "небольшой дождь",
    "rain": "дождь",
    "moderate-rain": "умеренно сильный дождь",
    "heavy-rain": "сильный дождь",
    "continuous-heavy-rain": "длительный сильный дождь",
    "shower": "ливень",
    "wet-snow": "дождь со снегом",
    "light-snow": "небольшой снег",
    "snow": "снег",
    "snow-showers": "снегопад",
    "hail": "град",
    "thunderstorm": "гроза",
    "thunderstorm-with-rain": "дождь с грозой",
    "thunderstorm-with-hail": "гроза с градом",
  };

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DataModel>(
        future: WeatherService.fetchCurrentWeather(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.38,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color(0xff47bfdf),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Санкт-Петербург",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Play',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffffffff),
                                ),
                                child: SvgPicture.network(
                                  "https://yastatic.net/weather/i/icons/funky/dark/${snapshot.data!.icon}.svg",
                                  height: 50,
                                ),
                              ),
                              Text(
                                "${snapshot.data!.temp}°",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 70,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Play',
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "${engToRu[snapshot.data!.condition]}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Play',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.62,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                      ),
                      child: ListView.builder(
                          itemCount: 24,
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5,
                              color: const Color(0xffffffff),
                              child: ListTile(
                                title: Text(snapshot.data!.forecasts[1]['hours']
                                        [index]['hour'] +
                                    ":00"),
                                trailing: Text(
                                  "${snapshot.data!.forecasts[1]['hours'][index]['temp']}°",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                leading: SvgPicture.network(
                                  "https://yastatic.net/weather/i/icons/funky/dark/${snapshot.data!.forecasts[1]['hours'][index]['icon']}.svg",
                                  height: 50,
                                ),
                                subtitle: Text("${engToRu[snapshot.data!.forecasts[1]['hours'][index]['condition']]}"),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 230,
                  bottom: 450,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(100)),
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ],
            );
          }
        });
  }
}
