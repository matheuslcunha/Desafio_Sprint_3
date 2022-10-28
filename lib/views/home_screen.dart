import 'package:desafio_sprint_3/models/weather_model.dart';
import 'package:desafio_sprint_3/models/forecast_model.dart';
import 'package:desafio_sprint_3/controllers/connection_controller.dart';
import 'package:flutter/material.dart';
import 'package:desafio_sprint_3/widgets/weather_card.dart';
import 'package:desafio_sprint_3/widgets/forecast_card.dart';

class homeScreen extends StatefulWidget {
  final String cityName;

  const homeScreen({super.key, required this.cityName});

  @override
  State<homeScreen> createState() => _homeScreen();
}

class _homeScreen extends State<homeScreen> {
  FetchController fetch = FetchController();

  Weather weather = Weather();
  Forecast forecast = Forecast();

  Future<dynamic>? dataWeather;
  Future<dynamic>? dataForecast;

  @override
  void initState() {
    super.initState();
    dataWeather = fetch.fetchWeather(widget.cityName);
    dataForecast = fetch.fetchForecast();

    //weather.fromData(dataWeather);
  }

  @override
  Widget build(BuildContext context) {
    var statusbar = MediaQuery.of(context).padding.top;

    /* Weather wt = Weather();

    wt.fromData(data); */
    //wt.fromData(fetchWeather());

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.blue,
              height: statusbar,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: Offset(0, 4.5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        )),
                  ),
                  Text(
                    'PREVISÃO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.replay_outlined,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
            FutureBuilder<dynamic>(
              future: dataWeather,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: const CircularProgressIndicator());
                  case ConnectionState.done:
                  default:
                    if (snapshot.hasData) {
                      return Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                width: MediaQuery.of(context).size.width,
                                child: ListView(
                                  scrollDirection: Axis.vertical,
                                  primary: true,
                                  shrinkWrap: true,
                                  children: [
                                    Wrap(
                                      //spacing: 4,
                                      runSpacing: 10,
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Text(
                                          'HOJE',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        WeatherCard(cityName: widget.cityName),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          child: Center(
                                            child: Text(
                                              'PRÓXIMOS DIAS',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        /* ListView.builder(
                                          itemCount: 9,
                                          itemBuilder: ((context, index) {
                                            return ForecastCard(
                                              index: index,
                                            );
                                          }),
                                        ) */
                                        ForecastCard(index: 0),
                                        ForecastCard(index: 1),
                                        ForecastCard(index: 2),
                                        //ForecastCard(),
                                        //ForecastCard(),
                                        //ForecastCard(),
                                        //ForecastCard(),
                                        //ForecastCard(),
                                        //ForecastCard(),
                                        //ForecastCard(),
                                        //ForecastCard(),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.80,
                        width: MediaQuery.of(context).size.height * 0.5,
                        child: Center(
                          child: Text(
                            "Ocorreu um problema ao buscar os dados, verifique a sua conexão...",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      );
                    } else {
                      return Center(child: const CircularProgressIndicator());
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
