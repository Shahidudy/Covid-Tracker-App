// import 'package:http/http.dart' as http;

class AppUrl {
  //base Url
  static const String baseUrl = 'https://disease.sh/v3/covid-19/';

  //fetch world covid states
  // ignore: prefer_interpolation_to_compose_strings
  static const String worlStatesApi = baseUrl + 'all';
  // ignore: prefer_interpolation_to_compose_strings
  static const String countriesList = baseUrl + 'countries';
}
