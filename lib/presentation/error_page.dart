import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error Page"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return const SizedBox(
          child: Center(
            child: Text("Some Error Occured!"),
          ),
        );
      }),
    );
  }
}
