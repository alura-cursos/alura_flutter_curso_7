import 'package:estilizacao_componentes/models/bank.dart';
import 'package:flutter/material.dart';

class BankInherited extends InheritedWidget {
  BankInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final BankModel values = BankModel();

  static BankInherited of(BuildContext context) {
    final BankInherited? result = context.dependOnInheritedWidgetOfExactType<BankInherited>();
    assert(result != null, 'No BankInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(BankInherited old) {
    print('updateShouldNotify: ${old.values.points}');
    return values.points != old.values.points;
  }
}
