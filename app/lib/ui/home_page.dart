import 'package:app/ui/widgets/base_card.dart';
import 'package:flutter/material.dart';

import 'widgets/searched_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(232, 234, 246, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: SizedBox(
                          width: 200,
                          height: 150,
                          child: Image.network(
                              'http://clipart-library.com/images/pTo5xbAkc.png')),
                    ),
                  ),
                  const Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'From',
                          hintText: 'Enter From Location'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'To',
                          hintText: 'Enter Destination Location'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomePage()));
                      },
                      child: const Text(
                        'Search',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SearchedRoutes(),
                  SizedBox(
                    height: 10,
                  ),
                  const SearchedRoutes(),
                  SizedBox(
                    height: 10,
                  ),
                  const SearchedRoutes(),
                  SizedBox(
                    height: 10,
                  ),
                  const SearchedRoutes(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
