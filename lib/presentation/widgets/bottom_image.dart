import 'package:flutter/material.dart';
import 'package:ram_mandir_app/data/app_data/events.dart';
import 'package:size_config/size_config.dart';

class BottomImage extends StatelessWidget {
  const BottomImage({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        events[index].image,
        fit: BoxFit.fill,
        width: double.infinity,
        height: 210.h,
      ),
    );
  }
}
