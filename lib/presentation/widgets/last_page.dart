import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lottie/lottie.dart';
import 'package:size_config/size_config.dart';

class LastPage extends StatefulWidget {
  const LastPage({super.key});

  @override
  State<LastPage> createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  double width = 0;
  double height = 0;
  double right = 0;
  bool start = false;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          start = true;
          width = 350.w;
          height = 700.h;
          right = 50.w;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return DecoratedBox(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/ram_bg.png"), fit: BoxFit.fill)),
        child: GlassmorphicContainer(
          borderRadius: 2,
          blur: 5,
          alignment: Alignment.center,
          border: 2,
          linearGradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
            const Color(0xFFffffff).withOpacity(0.1),
            const Color(0xFFFFFFFF).withOpacity(0.05),
          ], stops: const [
            0.1,
            1,
          ]),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFffffff).withOpacity(0.5),
              const Color((0xFFFFFFFF)).withOpacity(0.5),
            ],
          ),
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedPositioned(
                width: width,
                height: height,
                right: right,
                bottom: 0,
                duration: const Duration(milliseconds: 1500),
                child: Image.asset("assets/images/ramlala.png"),
              ),
              Visibility(
                visible: start,
                child: Positioned(
                  bottom: 10,
                  child: LottieBuilder.asset("assets/lottie/lights_lottie.json"),
                ),
              ),
              Visibility(
                visible: start,
                child: Positioned(
                  top: 10,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: LottieBuilder.asset("assets/lottie/lights_lottie.json"),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Transform.rotate(
                  angle: pi / 4,
                  child: Image.asset(
                    "assets/images/bhagwa_flur.gif",
                  ),
                ),
              ),
              // Positioned(
              //   child: Image.asset("assets/images/bhagwa_flur.gif"),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
