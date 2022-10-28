import 'package:flutter/material.dart';
import 'package:desafio_sprint_3/models/weather_model.dart';
import 'package:desafio_sprint_3/controllers/connection_controller.dart';
import 'package:desafio_sprint_3/controllers/condition_controller.dart';

class WeatherCard extends StatefulWidget {
  final String cityName;
  const WeatherCard({super.key, required this.cityName});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  FetchController fetch = FetchController();
  ConditionController cond = ConditionController();

  Weather weather = Weather();

  Future<dynamic>? data;

  @override
  void initState() {
    super.initState();
    data = fetch.fetchWeather(widget.cityName);

    weather.fromData(data);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 275,
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 4.5),
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (_, constraints) {
              return Column(
                children: [
                  Container(
                    height: constraints.maxHeight * 0.16,
                    width: constraints.maxWidth,
                    child: Center(
                      child: Text(
                        '${weather.city}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ), // CITY NAME
                  ),
                  Container(
                      height: constraints.maxHeight * 0.005,
                      width: constraints.maxWidth * 0.35,
                      color: Colors.black),
                  Container(
                    height: constraints.maxHeight * 0.16,
                    width: constraints.maxWidth,
                    child: Center(
                      child: Text(
                        '${weather.date}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ), // DESCRIPTION
                  ),
                  Container(
                      height: constraints.maxHeight * 0.005,
                      width: constraints.maxWidth * 0.55,
                      color: Colors.black),
                  Container(
                    height: constraints.maxHeight * 0.16,
                    width: constraints.maxWidth,
                    child: Center(
                      child: Text(
                        '${weather.temp}°C    ${weather.description}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ), // TEMP
                  ),
                  Container(
                      height: constraints.maxHeight * 0.005,
                      width: constraints.maxWidth * 0.75,
                      color: Colors.black),
                  Container(
                    height: constraints.maxHeight * 0.50,
                    width: constraints.maxWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.64,
                          width: MediaQuery.of(context).size.width * 0.31,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Amanhecer',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${weather.sunrise}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ), // amanhecer
                        Container(
                            height: MediaQuery.of(context).size.width * 0.64,
                            width: MediaQuery.of(context).size.width * 0.31,
                            child: Image.asset(
                              cond.Condition(weather.condition_slug),
                              //height: 10,
                              //width: 10,
                            )), // imagem
                        Container(
                          height: MediaQuery.of(context).size.width * 0.64,
                          width: MediaQuery.of(context).size.width * 0.31,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Anoitecer',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${weather.sunset}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ), // anoitecer
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
