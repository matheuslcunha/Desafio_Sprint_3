import 'package:flutter/material.dart';
import 'package:desafio_sprint_3/views/home_screen.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({super.key});

  @override
  State<searchScreen> createState() => _searchScreen();
}

class _searchScreen extends State<searchScreen> {
  TextEditingController nameController = TextEditingController();

  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var statusbar = MediaQuery.of(context).padding.top;
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
                      color: Colors.blue,
                      height: statusbar,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
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
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.width * 0.70,
                            child: Center(
                              child: TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  //prefixIcon: Icon(Icons.search_rounded),
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
                                onChanged: (value) {
                                  //nameController = value;
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: IconButton(
                              onPressed: () {
                                print(nameController.text);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => homeScreen(
                                      cityName: nameController.text,
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.search),
                              iconSize: 40,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
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
                    ),
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
