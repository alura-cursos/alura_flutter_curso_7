import 'package:estilizacao_componentes/models/bank.dart';
import 'package:flutter_test/flutter_test.dart';
void main(){
 group('Bank model deposit tests', () {
   test('Bank model deposit should turn points into 10', (){
     final bank = BankModel();
     bank.deposit(10);
     expect(bank.points, 10);
   });
   test('Bank model deposit should turn available into 10', (){
     final bank = BankModel();
     bank.deposit(10);
     expect(bank.available, 10);
   });
 });

test('Bank model transfer should turn points into 10', (){
  final bank = BankModel();
  bank.transfer(10);
  expect(bank.points, 10);
});

}