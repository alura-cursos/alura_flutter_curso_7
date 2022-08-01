import 'package:flutter/material.dart';

class BoxCard extends StatelessWidget {
  final Widget boxCardBody;

  const BoxCard({Key? key, required this.boxCardBody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: kElevationToShadow[2],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: boxCardBody,
      ),
    );
  }
}
