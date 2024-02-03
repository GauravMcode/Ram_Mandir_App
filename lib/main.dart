import 'package:flutter/material.dart';
import 'package:ram_mandir_app/config/route_generator.dart';
import 'package:size_config/size_config.dart';

void main() {
  runApp(const RamMandirApp());
}

class RamMandirApp extends StatelessWidget {
  const RamMandirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizeConfigInit(
      //for responsiveness
      referenceHeight: MediaQuery.of(context).size.height,
      referenceWidth: MediaQuery.of(context).size.width,
      builder: (context, orientation) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: RouteGenerator.generateRoutes,
      ),
    );
  }
}
