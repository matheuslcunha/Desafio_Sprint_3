import 'package:desafio_sprint_3/main.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(40),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Logo',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ), // logo - appbar?
                    Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width * 0.85,
                      //color: Colors.yellow,
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search_rounded),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                width: 2,
                              ),
                            ),
                            hintText: 'Procure aqui pela sua cidade',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 120, 120, 120),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ), // search bar
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.grey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height:
                                MediaQuery.of(context).size.height * 0.5 / 2,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Image.asset('assets/images/sunny.png'),
                          ),
                          Container(
                            height:
                                MediaQuery.of(context).size.height * 0.5 / 2,
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Text(
                              'Você ainda não nos conectou com a sua localização!',
                              style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ), // "você ainda não conectou a sua localização" - sunny
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
