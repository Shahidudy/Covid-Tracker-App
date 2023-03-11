import 'package:covidtracker/Services/states_services.dart';
import 'package:covidtracker/View/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController seachController = TextEditingController();
  StatesServices statesServices = StatesServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: seachController,
              decoration: InputDecoration(
                  hintText: "Search with Country Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  suffixIcon: seachController.text.isEmpty
                      ? const Icon(Icons.search)
                      : GestureDetector(
                          onTap: () {
                            seachController.text = '';
                            setState(() {});
                          },
                          child: const Icon(Icons.clear),
                        )),
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: statesServices.countriesListApi(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (!snapshot.hasData) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: Column(
                        children: [
                          ListTile(
                            title: Container(
                              height: 10,
                              width: 80,
                              color: Colors.white,
                            ),
                            subtitle: Container(
                              height: 10,
                              width: 80,
                              color: Colors.white,
                            ),
                            leading: Container(
                              height: 50,
                              width: 50,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    String name = snapshot.data![index]['country'];

                    if (seachController.text.isEmpty) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => DetailScreen(
                                    name: snapshot.data![index]['country'],
                                    active: snapshot.data![index]['active'],
                                    critical: snapshot.data![index]['critical'],
                                    image: snapshot.data![index]['countryInfo']
                                        ['flag'],
                                    test: snapshot.data![index]['tests'],
                                    todayRecovered: snapshot.data![index]
                                        ['todayRecovered'],
                                    totalCases: snapshot.data![index]['cases'],
                                    totalDeaths: snapshot.data![index]
                                        ['deaths'],
                                    totalRecovered: snapshot.data![index]
                                        ['recovered'],
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                              title: Text(
                                  snapshot.data![index]['country'].toString()),
                              subtitle: Text(
                                  snapshot.data![index]['cases'].toString()),
                              leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(
                                  snapshot.data![index]['countryInfo']['flag'],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    } else if (name
                        .toLowerCase()
                        .contains(seachController.text.toLowerCase())) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                                snapshot.data![index]['country'].toString()),
                            subtitle:
                                Text(snapshot.data![index]['cases'].toString()),
                            leading: Image(
                              height: 50,
                              width: 50,
                              image: NetworkImage(
                                snapshot.data![index]['countryInfo']['flag'],
                              ),
                            ),
                          )
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                );
              }
            },
          ))
        ],
      )),
    );
  }
}
