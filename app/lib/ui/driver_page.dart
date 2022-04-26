import 'package:app/api/buses.dart';
import 'package:app/domain/bus_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverPage extends StatefulWidget {
  const DriverPage({Key? key}) : super(key: key);

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  BusModel? selectedBus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Driver Panel'), centerTitle: true),
      backgroundColor: const Color.fromRGBO(232, 234, 246, 1),
      body: FutureBuilder(
        key: const Key('buses'),
        future: getAllBuses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.hasData) {
            final buses = snapshot.data as List<BusModel>;
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    'Select a bus',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    items: buses
                        .map((x) => DropdownMenuItem(
                              value: x,
                              child: Text(x.name),
                            ))
                        .toList(),
                    onChanged: (newValue) {
                      selectedBus = newValue as BusModel;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'From',
                      hintText: 'Enter Start Location',
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      if (selectedBus != null) {
                        startBus(selectedBus!.id).then(
                          (value) =>
                              Get.toNamed('/route', arguments: selectedBus!.id),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Start', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        primary: Colors.red),
                    onPressed: () {
                      if (selectedBus != null) {
                        stopBus(selectedBus!.id).then(
                          (value) =>
                              Get.toNamed('/route', arguments: selectedBus!.id),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Stop', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
