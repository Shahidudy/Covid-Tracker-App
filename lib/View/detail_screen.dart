import 'package:covidtracker/View/world_states_screen.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String name, image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  DetailScreen({
    required this.name,
    super.key,
    required this.active,
    required this.critical,
    required this.image,
    required this.test,
    required this.todayRecovered,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(widget.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(alignment: Alignment.topCenter, children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .067),
              child: Card(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * .06),
                    ReusableRow(
                        title: "Total Cases",
                        value: widget.totalCases.toString()),
                    // ReusableRow(
                    //     title: "Today Recovered",
                    //     value: widget.todayRecovered.toString()),
                    ReusableRow(
                        title: "Total Deaths",
                        value: widget.totalDeaths.toString()),
                    ReusableRow(
                        title: "Active", value: widget.active.toString()),
                    ReusableRow(
                        title: "Critical", value: widget.critical.toString()),
                    ReusableRow(
                        title: "Today Recovered",
                        value: widget.todayRecovered.toString())
                  ],
                ),
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(widget.image),
            )
          ])
        ],
      ),
    );
  }
}
