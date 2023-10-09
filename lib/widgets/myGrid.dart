import 'package:flutter/material.dart';
import 'package:sky_scrapper/model/city_data.dart';
import 'package:sky_scrapper/widgets/my_container.dart';

class MyGrid extends StatelessWidget {
  final CityData? cityData;
  const MyGrid({super.key, this.cityData});

  @override
  Widget build(BuildContext context) {
    List gridList = [
            {
              1: 'assets/img/air-flow.png',
              2: '${cityData?.wind?.speed} km / h',
              3: 'Wind'
            },
            {
              1: 'assets/img/humidity.png',
              2: '${cityData?.main?.humidity} %',
              3: 'Humidity'
            },
            {
              1: 'assets/img/pressure.png',
              2: '${cityData?.main?.pressure} hpa',
              3: 'Pressure'
            },
            {
              1: 'assets/img/temprature.png',
              2: '${cityData?.main?.temp} C',
              3: 'Temprature'
            },
            {
              1: 'assets/img/work-in-progress.png',
              2: '${cityData?.visibility} km',
              3: 'Visibility'
            },
            {
              1: 'assets/img/waves.png',
              2: '${cityData?.main?.seaLevel} km',
              3: 'Sea Level'
            },
          ];
  
     return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20),
            itemBuilder: (context, index) {
              return MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(
                      height: MediaQuery.sizeOf(context).height * 0.09,
                      image: AssetImage('${gridList[index][1]}'),
                    ),
                    Text('${gridList[index][2]}'),
                    Text('${gridList[index][3]}')
                  ],
                ),
              );
            },
          );
  }
}
