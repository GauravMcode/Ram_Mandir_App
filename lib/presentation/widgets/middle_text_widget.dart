import 'package:flutter/material.dart';
import 'package:ram_mandir_app/data/app_data/events.dart';
import 'package:size_config/size_config.dart';

class MiddleText extends StatelessWidget {
  const MiddleText({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final events = getEvents(context);
    return Container(
      height: 450.h,
      width: 350.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/textBackground.png"))),
      alignment: Alignment.center,
      child: SizedBox(
        width: 230.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: const Color.fromARGB(255, 180, 18, 7),
                border: Border.all(
                    color: const Color.fromARGB(255, 245, 223, 28), width: 3),
              ),
              width: 200.w,
              height: 50.h,
              alignment: Alignment.center,
              child: Text(
                events[index].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              events[index].description,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
