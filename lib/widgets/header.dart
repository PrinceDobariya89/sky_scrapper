import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:sky_scrapper/controller/wether_controller.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String city = '';
  DateTime dateTime = DateTime.now();
  final WetherController controller = Get.put(WetherController());
  @override
  void initState() {
    getAddress(controller.getLatitude().value, controller.getLongitude().value);
    super.initState();
  }

  getAddress(lat, long) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
    String locality = placemark[0].locality.toString();
    String state = placemark[0].administrativeArea.toString();
    setState(() {
      city = '$locality, $state';
    });
  }

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 7,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(city,
              style: const TextStyle(fontSize: 20),
              overflow: TextOverflow.ellipsis),
        ),
      ),
      Expanded(
        flex: 6,
        child: Transform.scale(
          scale: 0.85,
          child: TextField(
            controller: controller.searchController.value,
            decoration: InputDecoration(
              hintText: 'Search City',
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.all(5),
              fillColor: Colors.white,
              focusColor: Colors.white,
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ),
      )
    ]);
  }
}
