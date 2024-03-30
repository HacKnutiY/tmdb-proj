import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RedRectangle(),
    );
  }
}

class RedRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 100,
      height: 200,
      color: Colors.red,
    );
  }
}
