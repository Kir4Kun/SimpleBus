import 'base_card.dart';
import 'package:flutter/material.dart';

import '../route_page.dart';

class SearchedRoutes extends StatelessWidget {
  final int id;
  final String busName;
  final String busNo;
  final String time;
  final String fromTo;
  const SearchedRoutes(
      {Key? key,
      required this.id,
      this.busName = "",
      this.busNo = "",
      this.time = "",
      this.fromTo = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const RoutePage(),
            settings: RouteSettings(
              arguments: id,
            ),
          ),
        );
      },
      child: BaseCard(
        height: 100,
        child: Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          height: 100,
          child: Row(
            children: <Widget>[
              // Texts
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // UEC607 & Digital communication text
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              'UEC607',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              busName,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                      ],
                    ),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            busNo,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // Card
              Container(
                width: 90,
                color: Colors.lightBlue.withOpacity(.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'L',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '09:00',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
