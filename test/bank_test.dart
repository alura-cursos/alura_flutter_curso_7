import 'package:estilizacao_componentes/models/bank.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Counter',(){
    test('value should increment', (){
      final bank = BankModel();
      bank.deposit(10);
      expect(bank.points, 10);
    });
    test('value should decrement', (){
      final bank = BankModel();
      bank.transfer(10);
      expect(bank.points, 10);
    });
  });

}