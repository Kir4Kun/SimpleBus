// import 'package:app/ui/test/showcase_timeline.dart';
import 'package:app/api/routes.dart';
import 'package:app/domain/route_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Example {
  const Example({
    required this.name,
    required this.description,
  });

  final String name;
  final String description;
}

const examples = <Example>[
  Example(name: "name", description: "description"),
  Example(name: "name", description: "description"),
  Example(name: "name", description: "description"),
  Example(name: "name", description: "description"),
  Example(name: "name", description: "description"),
  Example(name: "name", description: "description"),
];

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final busId = ModalRoute.of(context)!.settings.arguments as int;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(105, 127, 189, 0.5),
            Color.fromRGBO(122, 215, 240, 0.5),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: FutureBuilder(
            future: getRoutesByBusId(busId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: const Center(child: CircularProgressIndicator()),
                );
              }
              if (snapshot.hasData) {
                final routes = snapshot.data as List<RouteModel>;
                return Center(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 16),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  )),
                            ),
                            const Text(
                              'Bus Timeline',
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                              ),
                            ),
                            Container(width: 50)
                          ]),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: routes.length,
                          itemBuilder: (BuildContext context, int index) {
                            final route = routes[index];

                            return TimelineTile(
                              alignment: TimelineAlign.manual,
                              lineXY: 0.1,
                              isFirst: index == 0,
                              isLast: index == routes.length - 1,
                              indicatorStyle: IndicatorStyle(
                                width: 40,
                                height: 40,
                                indicator:
                                    _IndicatorExample(number: '${index + 1}'),
                                drawGap: true,
                              ),
                              beforeLineStyle: LineStyle(
                                color: Colors.white.withOpacity(0.2),
                              ),
                              endChild: GestureDetector(
                                child: _RowExample(
                                  example: Example(
                                    name: route.busStop.name,
                                    description: '',
                                  ),
                                ),
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute<ShowcaseTimeline>(
                                  //     builder: (_) =>
                                  //         ShowcaseTimeline(example: example),
                                  //   ),
                                  // );
                                },
                              ),
                            );
                          },
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
      ),
    );
  }
}

class _IndicatorExample extends StatelessWidget {
  const _IndicatorExample({Key? key, required this.number}) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.white.withOpacity(0.2),
            width: 4,
          ),
        ),
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _RowExample extends StatelessWidget {
  const _RowExample({Key? key, required this.example}) : super(key: key);

  final Example example;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: Text(
                  example.name,
                  style: GoogleFonts.jura(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          const Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 26,
          ),
        ],
      ),
    );
  }
}
