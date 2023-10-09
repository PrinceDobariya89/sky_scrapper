import 'package:http/http.dart' as http;
import 'package:sky_scrapper/model/city_data.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  String apiKey = '4e5422265c9d8db84b7f035addfdcd6e';
  Future<CityData> getWhether(String city) async {
    http.Response res =
        await http.get(Uri.parse('$baseUrl?q=$city&appid=$apiKey'));
    CityData decode = CityData.fromRawJson(res.body);
    return decode;
  }
}
