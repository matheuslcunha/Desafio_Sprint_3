import 'package:flutter/material.dart';
import 'package:desafio_sprint_3/models/weather_model.dart';
import 'package:desafio_sprint_3/models/forecast_model.dart';
//import 'package:desafio_sprint_3/connection.dart';
import 'package:desafio_sprint_3/controllers/condition_controller.dart';

class ForecastCard extends StatefulWidget {
  final int index;

  const ForecastCard({Key? key, required this.index}) : super(key: key);

  @override
  State<ForecastCard> createState() => _ForecastCardState();
}

class _ForecastCardState extends State<ForecastCard> {
  ConditionController cond = ConditionController();

  Future<dynamic>? data;
  Forecast forecast = Forecast();
  Weather weather = Weather();

  @override
  void initState() {
    super.initState();
    //data = fetchWeather();
    weather.fromData(data);

    //forecast.fromData(weather.forecast[widget.index]);
    print(forecast);
    //print('weather -> ${weather.forecast}');

    //forecast.fromData(data[widget.index]);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          height: 150,
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
                    height: constraints.maxHeight * 0.30,
                    width: constraints.maxWidth,
                    child: Center(
                      child: Text(
                        //'Sáb  -  29/10/2022',
                        '${forecast.weekday}',
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
                      width: constraints.maxWidth * 0.75,
                      color: Colors.black),
                  Container(
                    height: constraints.maxHeight * 0.65,
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
                                '${forecast.min}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ), // amanhecer
                        Container(
                          height: MediaQuery.of(context).size.width * 0.64,
                          width: MediaQuery.of(context).size.width * 0.31,
                          child: Image.asset(
                            cond.Condition(forecast.condition),
                          ),
                        ), // imagem
                        Container(
                          height: MediaQuery.of(context).size.width * 0.64,
                          width: MediaQuery.of(context).size.width * 0.31,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${forecast.max}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
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
