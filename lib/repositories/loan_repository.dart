import 'dart:math';

class LoanRepository {
  Future<List<String>?> sendLoan(Map<String, dynamic> json) async {

    print('wysyłam formularz');
    print(json);
    await Future.delayed(const Duration(seconds: 3));
    var los = Random().nextInt(3);
    if(los==1)
      {print('wysłano');
      return ['Oferta1', 'Oferta2'];
      }
    else if(los == 2){
      print('wysłano');
      return null;
    }
    else{
      throw Exception('Nie udało się wysłać');
    }
  }
}