import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/mocks/bank_http.mocks.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  final MockBankHttp httpMock = MockBankHttp();
  testWidgets('My Widget has a Text "Spent" ', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5')); // adicionado na aula de mocks
    await tester.pumpWidget(
      MaterialApp(
        // dependencia
        home: BankInherited(
            //dependencia
            child: Home(
          api: httpMock.dolarToReal(),// isso aqui é adicionado apenas na ultima aula, de mock.
        )),
      ),
    );

    final spentFinder = find.text('Spent');

    expect(spentFinder, findsOneWidget);
  });
  testWidgets('My Widget has a Text "Earned" ', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(
      MaterialApp(
        // dependencia
        home: BankInherited(
            //dependencia
            child: Home(api: httpMock.dolarToReal())),
      ),
    );

    final spentFinder = find.text('Earned');

    expect(spentFinder, findsOneWidget);
  });
  testWidgets('finds a AccountStatus', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(
      MaterialApp(
        // dependencia
        home: BankInherited(
            //dependencia
            child: Home(api: httpMock.dolarToReal())),
      ),
    );
    expect(find.byKey(Key('testKey')), findsOneWidget);
  });
  testWidgets('finds a LinearProgressIndicator', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(
      MaterialApp(
        // dependencia
        home: BankInherited(
            //dependencia
            child: Home(api: httpMock.dolarToReal())),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });
  testWidgets('finds a BoxCard', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(
      MaterialApp(
        // dependencia
        home: BankInherited(
            //dependencia
            child: Home(api: httpMock.dolarToReal())),
      ),
    );
    expect(find.byWidgetPredicate((widget) {
      if (widget is BoxCard) {
        return true;
      }
      return false;
    }), findsNWidgets(5));
  });
  testWidgets('test Deposit', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(
      MaterialApp(
        // dependencia
        home: BankInherited(
            //dependencia
            child: Home(api: httpMock.dolarToReal())),
      ),
    );
    await tester.tap(find.text('Deposit'));

    await tester.tap(find.text('Earned'));
    await tester.pumpAndSettle();

    expect(find.text('\$10.0'), findsOneWidget);
  });
  testWidgets('test Transfer', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(
      MaterialApp(
        // dependencia
        home: BankInherited(
            //dependencia
            child: Home(api: httpMock.dolarToReal())),
      ),
    );
    await tester.tap(find.text('Transfer'));
    await tester.tap(find.text('Transfer'));
    await tester.tap(find.text('Spent'));
    await tester.pumpAndSettle();

    expect(find.text('\$20.0'), findsOneWidget);
  });
}
