import 'package:estilizacao_componentes/components/current_points.dart';
import 'package:flutter/material.dart';

import '../box_card.dart';

class PointsExchange extends StatelessWidget {
  const PointsExchange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text('Account Points', style: Theme.of(context).textTheme.titleLarge,),
                ),
                const BoxCard(boxCardBody: AccountPoints()),
              ],
            ),
          );
  }
}
