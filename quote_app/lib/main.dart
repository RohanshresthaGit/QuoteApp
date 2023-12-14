import 'dart:async';

import 'package:flutter/material.dart';
import 'SplashScreen.dart';
import 'networkimage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => MyHomeState();
}

class MyHomeState extends State<MyHomePage> {
  var i = 0;
  var change = true;
  @override
  void initState() {
    perform();

    super.initState();
  }

  void perform() {
    Timer(const Duration(days: 1), () {
      setState(() {
        i <= 5 ? i++ : i = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    perform();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daily Quotes",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 300, child: Image.network(imageNetwork[i])),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21.0))),
                        onPressed: () {
                          setState(() {
                            i <= 5 ? i++ : i = 0;
                          });
                        },
                        child: const SizedBox(
                          height: 50,
                          width: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.refresh_sharp),
                              SizedBox(width: 3),
                              Text(
                                'Refresh',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21.0))),
                        onPressed: () {
                          change = !change;
                          setState(() {});
                        },
                        child: SizedBox(
                          height: 50,
                          width: 160,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(change
                                  ? Icons.favorite_outline_sharp
                                  : Icons.favorite_outlined),
                              const SizedBox(width: 3),
                              Text(
                                change ? 'Add to Favourites' : 'Favourite',
                                style: const TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.share_outlined,
              size: 40,
              color: Colors.black,
            ),
          )),
    );
  }
}
