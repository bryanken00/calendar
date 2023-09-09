import 'package:flutter/material.dart';
import '../models/colors.dart';
import 'line_generator.dart';

class PanelGen extends StatefulWidget {
  const PanelGen({
    super.key,
    required this.dataSched,
  });

  @override
  State<PanelGen> createState() => _PanelGen();
  final List<Map<String, dynamic>> dataSched;
}

class _PanelGen extends State<PanelGen> {
  ColorPallete color = ColorPallete();
  List<Map<String, dynamic>>? sched;

  @override
  void initState() {
    super.initState();
    sched = widget.dataSched;
  }

  @override
  void didUpdateWidget(PanelGen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.dataSched != oldWidget.dataSched) {
      // Update the data when dataSched changes
      setState(() {
        sched = widget.dataSched;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        sched!.length,
        (index) => Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      // Time
                      Text(
                        '${sched![index]['start']}',
                        style: TextStyle(
                            color: color.stiColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const LineGen(
                        lines: [20.0, 30.0, 40.0, 10.0],
                      ),
                      Text(
                        '${sched![index]['end']}',
                        style: TextStyle(
                            color: color.stiColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                // Details
                const SizedBox(width: 10.0),

                Expanded(
                  child: Container(
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: color.stiBackground,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0)),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(left: 6.0),
                      color: color.stiColor,
                      padding: const EdgeInsets.only(left: 16.0, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: <Widget>[
                              Text(
                                '${sched![index]['start']} - ${sched![index]['end']}',
                                style: TextStyle(
                                    color: color.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const VerticalDivider(),
                              Text(
                                '${sched![index]['room']}',
                                style: TextStyle(
                                    color: color.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            '${sched![index]['subject']}',
                            style: TextStyle(
                                color: color.stiBackground,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
