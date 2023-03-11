// ignore_for_file: annotate_overrides

import 'dart:async';
import 'package:covidtracker/View/world_states_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const WorldStatesScreen(),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              child: const SizedBox(
                height: 200,
                width: 200,
                child: Center(
                  child: Image(image: AssetImage('assets/images/c-3.png')),
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: child,
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Covid-19\nTracker App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//need to install something to pubspec.yaml file
// 1) http
// 2) flutter_spinkit
// 3) shimmer
