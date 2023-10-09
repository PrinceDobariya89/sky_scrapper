import 'package:flutter/material.dart';
import 'package:sky_scrapper/model/city_data.dart';
import 'package:sky_scrapper/widgets/my_container.dart';

class WetherContainer extends StatelessWidget {
  final CityData? cityData;
  const WetherContainer({super.key, required this.cityData});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                height: 60,
                image: NetworkImage(
                    'https://openweathermap.org/img/wn/${cityData?.weather?[0].icon}@2x.png'),
              ),
              Text(
                cityData?.weather?[0].description ?? '',
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
          Column(
            children: [
              Text('${cityData?.main?.temp} C'),
              const Text('Temprature')
            ],
          ),
          Column(
            children: [
              Text('${cityData?.main?.humidity} %'),
              const Text('Humidity')
            ],
          ),
        ],
      ),
    );
  }
}
