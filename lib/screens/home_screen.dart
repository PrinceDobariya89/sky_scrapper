import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_scrapper/controller/wether_controller.dart';
import 'package:sky_scrapper/helper/api_helper.dart';
import 'package:sky_scrapper/model/city_data.dart';
import 'package:sky_scrapper/widgets/header.dart';
import 'package:sky_scrapper/widgets/myGrid.dart';
import 'package:sky_scrapper/widgets/wether_con.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CityData? cityData;
  @override
  void initState() {
    getData();
    super.initState();
  }


  void getData() async {
    cityData = await ApiHelper.apiHelper.getWhether('rajkot');
    setState(() {});
  }


  final WetherController controller =
      Get.put(WetherController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Obx(
          () => controller.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    const HomeHeader(),
                    WetherContainer(cityData: cityData),
                   MyGrid(cityData: cityData,)
                  ],
                ),
        ),
      ),
    );
  }
}
