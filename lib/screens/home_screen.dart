import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice32_hw4/config/colors.dart';
import 'package:flutter_practice32_hw4/config/texts.dart';
import 'package:flutter_practice32_hw4/mixins/variables.dart';
import 'package:flutter_practice32_hw4/screens/long_break_screen.dart';
import 'package:flutter_practice32_hw4/screens/short_break_screen.dart';
import 'package:logger/logger.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with MixinVariables {
  int secondsCount = 0;
  int minutesCount = 0;
  static int countPomidoros = 0;
  late Timer timer;
  bool started = false;

  @override
  void initState() {
    super.initState();
    Logger logger = Logger();
    logger.d("Count Pomidoros: $countPomidoros");
  }


  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        secondsCount++;
        if (secondsCount == 60) {
          minutesCount++;
          secondsCount = 0;
        }

        // I checked if pomodoro main screen is working properly with making it 1 minute after finishing checking I change it back to 25. If you have any doubts you can check yourself.
        if (minutesCount == 25) {
          timer.cancel();
          countPomidoros++;
          if (countPomidoros % 2 == 0) {
            Navigator.pushReplacementNamed(context, LongBreakScreen.id);
          } else {
            Navigator.pushReplacementNamed(context, ShortBreakScreen.id);
          }
        }
      });
    });
  }

  String makeTimer() {
    return "${minutesCount.toString().padLeft(2, "0")}:${secondsCount.toString().padLeft(2, "0")}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsClass.pink,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 13,
              ),
              const Text(
                TextsClass.appName,
                style: TextStyle(
                    color: ColorsClass.white,
                    fontSize: 50,
                    fontFamily: "Ramabhadra",
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 45,
              ),
              const Text(TextsClass.textAboveTimer1,
                  style: TextStyle(
                      color: ColorsClass.white,
                      fontFamily: "Ramabhadra",
                      fontSize: 29,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 5,
                width: double.infinity,
                color: ColorsClass.lightPink,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.center,
                child: Text(
                  makeTimer(),
                  style: const TextStyle(
                      color: ColorsClass.black,
                      fontSize: 100,
                      letterSpacing: -10,
                      fontFamily: "CourierPrime",
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 11,
                color: ColorsClass.white,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      if (!started) {
                        startTimer();
                        started = true;
                      }
                    },
                    child: const Text(TextsClass.textInButtonWork,
                        style: TextStyle(
                          color: ColorsClass.pink,
                          fontSize: 23,
                          fontFamily: "Ramabhadra",
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
