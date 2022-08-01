import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([BankHttp])

class BankHttp {
  Future<String> dolarToReal() async {
    var url = Uri.http('economia.awesomeapi.com.br', '/last/USD-BRL');
    var response = await http.get(url);
    if (response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body) as Map<String,dynamic>;
      String value = jsonResponse['USDBRL']['high'];
      return value;
    } else{
      print('Não foi possível se conectar com a API: ${response.statusCode}');
      return '?';
    }
  }
}
