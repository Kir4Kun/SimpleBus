import 'package:app/api/busstops.dart';
import 'package:app/api/routes.dart';
import 'package:app/domain/bus_model.dart';
import 'package:app/domain/busstop_model.dart';
import 'package:app/ui/driver_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/searched_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? from;
  String? to;
  bool isLoading = false;

  List<BusModel> buses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(232, 234, 246, 1),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 50,
                    ),
                    color: Colors.blue,
                    child: Column(
                      children: [
                        Text(
                          'Simple Bus',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        CachedNetworkImage(
                            imageUrl:
                                'http://clipart-library.com/images/pTo5xbAkc.png'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/settings',
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.bug_report),
                    title: const Text('Report a bug'),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/bug',
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.star),
                    title: const Text('Rate the app'),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/rate',
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Language'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.group),
                    title: const Text('Invite a friend'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Suggest a feature'),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/feature',
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.whatsapp),
                    title: const Text('Share in Whatsapp'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(232, 234, 246, 1),
      body: isLoading
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: FutureBuilder(
                future: getAllBusstops(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }
                  if (snapshot.hasData) {
                    final busStops = snapshot.data as List<BusStopModel>;
                    return Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: SizedBox(
                                width: 200,
                                height: 150,
                                child: CachedNetworkImage(
                                    imageUrl:
                                        'http://clipart-library.com/images/pTo5xbAkc.png')),
                          ),
                          DropdownButtonFormField(
                            items: busStops
                                .map((BusStopModel model) => DropdownMenuItem(
                                      value: model.name,
                                      child: Text(model.name),
                                    ))
                                .toList(),
                            onChanged: (newValue) {
                              from = newValue as String;
                            },
                            value: from,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'From',
                              hintText: 'Enter Start Location',
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DropdownButtonFormField(
                            items: busStops
                                .map((model) => DropdownMenuItem(
                                    value: model.name, child: Text(model.name)))
                                .toList(),
                            onChanged: (newValue) {
                              to = newValue as String;
                            },
                            value: to,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'To',
                              hintText: 'Enter Destination Location',
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            onPressed: () {
                              if (from != null && to != null) {
                                setState(() {
                                  isLoading = true;
                                });
                                searchRoutes(from!, to!).then((value) {
                                  setState(() {
                                    buses = value;
                                    isLoading = false;
                                  });
                                });
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Search', style: TextStyle(fontSize: 20)),
                                SizedBox(width: 10),
                                Icon(Icons.arrow_forward_sharp, size: 20)
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          ...buses.map(
                            (e) => Column(
                              children: [
                                SearchedRoutes(
                                  id: e.id,
                                  busName: e.name,
                                  busNo: e.rno,
                                  key: Key(e.id.toString()),
                                ),
                                const SizedBox(height: 10)
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => const DriverPage());
        },
        label: Text(
          'Driver Mode',
          style: Theme.of(context).textTheme.button!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Simple Bus'),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
