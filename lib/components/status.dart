import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class AccountStatus extends StatefulWidget {
  const AccountStatus({Key? key}) : super(key: key);

  @override
  State<AccountStatus> createState() => _AccountStatusState();
}

class _AccountStatusState extends State<AccountStatus> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ThemeColors.transactions['spent']),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          'Spent',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      Text(
                        '\$${BankInherited.of(context).values.spent}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ThemeColors.transactions['earned']),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          'Earned',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      Text(
                        '\$${BankInherited.of(context).values.earned}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: Text('Spending Limit: \$1000.00'), // desafio pode ser criar a função que limita deposito e transação baseado nesse limite. E TESTAR
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: LinearProgressIndicator(
                    value: BankInherited.of(context).values.spent/1000,
                    semanticsLabel: 'Current points',
                    minHeight: 8,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Container(
              height: 1,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'This month you spent ${spentAndEarned()} % of your money. Try to make it lower!',
              ),
              TextButton(
                  onPressed: () => {}, child: const Text('Tell me more')),
            ],
          ),
        ],
      ),
    );
  }
  double spentAndEarned(){
    double result = (BankInherited.of(context).values.spent/BankInherited.of(context).values.earned)*100;
    if(result.isNaN) {
      return 0;
    }
    return result;
  }
}
