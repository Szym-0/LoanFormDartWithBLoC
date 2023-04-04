abstract class RegExps {        //jeszcze do poprawki kilka
  static RegExp nameOrSurname = RegExp(r'^[a-zA-Zą-źĄ-Ź]{3,20}$');

  static RegExp phoneNumber = RegExp(r'\d{9,14}');

  static RegExp pesel = RegExp(r'^\d{11}$');

  static RegExp idNumber = RegExp(r'^([a-z\s*A-Z]{3})(\d{6}$)');

  static RegExp postalCode = RegExp(r'(^\d{2})(-)(\d{3}$)');

  static RegExp city = RegExp(r'^[a-zA-Zą-źĄ-Ź]{3,62}$');

  static RegExp street = RegExp(r'^[a-zA-Zą-źĄ-Ź]{3,20}$');

  static RegExp buildingOrLocalNumber = RegExp(r'(\d){1,4}');

}