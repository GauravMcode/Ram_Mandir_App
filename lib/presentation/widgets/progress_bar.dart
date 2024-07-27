import 'package:flutter/material.dart';
import 'package:ram_mandir_app/data/app_data/events.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar(
      {super.key, required this.index, required this.constraints});
  final int index;
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    final events = getEvents(context);
    final length = events.length;
    return Stack(
      children: [
        Container(
          width: constraints.maxWidth * 0.7,
          height: constraints.maxHeight * 0.02,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green,
          ),
        ),
        Container(
          width: index * (constraints.maxWidth * 0.7 / length),
          height: constraints.maxHeight * 0.02,
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            //index < length ? const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))
            color: Color.fromARGB(255, 247, 147, 24),
          ),
        ),
      ],
    );
  }
}
