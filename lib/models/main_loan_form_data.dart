class MainLoanFormData {
  final String name;
  final String surname;
  final String phoneNumber;
  final String pesel;
  final String idNumber;
  final String email;
  final int isCorrespondenceAdressSame;
  final String postalCode;
  final String city;
  final String street;
  final String buildingNumber;
  final String localNumber;
  final String corrPostalCode;
  final String corrCity;
  final String corrStreet;
  final String corrBuildingNumber;
  final String corrLocalNumber;
  final int selectedIncomesType;
  final int netIncomeFromLastMonth;
  final int payday;
  final String companyName;

  MainLoanFormData({
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.pesel,
    required this.idNumber,
    required this.email,
    required this.isCorrespondenceAdressSame,
    required this.postalCode,
    required this.city,
    required this.street,
    required this.buildingNumber,
    required this.localNumber,
    required this.corrPostalCode,
    required this.corrCity,
    required this.corrStreet,
    required this.corrBuildingNumber,
    required this.corrLocalNumber,
    required this.selectedIncomesType,
    required this.netIncomeFromLastMonth,
    required this.payday,
    required this.companyName,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'surname': surname,
        'phoneNumber': phoneNumber,
        'pesel': pesel,
        'idNumber': idNumber,
        'email': email,
        'isCorrespondenceAdressSame': isCorrespondenceAdressSame,
        'postalCode': postalCode,
        'city': city,
        'street': street,
        'buildingNumber': buildingNumber,
        'localNumber': localNumber,
        'corrPostalCode': corrPostalCode,
        'corrCity': corrCity,
        'corrStreet': corrStreet,
        'corrBuildingNumber': corrBuildingNumber,
        'corrLocalNumber': corrLocalNumber,
        'selectedIncomesType': selectedIncomesType,
        'netIncomeFromLastMonth': netIncomeFromLastMonth,
        'payday': payday,
        'companyName': companyName,
      };

  MainLoanFormData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        surname = json['surname'],
        phoneNumber = json['phoneNumber'],
        pesel = json['pesel'],
        idNumber = json['idNumber'],
        email = json['email'],
        isCorrespondenceAdressSame = json['isCorrespondenceAdressSame'],
        postalCode = json['postalCode'],
        city = json['city'],
        street = json['street'],
        buildingNumber = json['buildingNumber'],
        localNumber = json['localNumber'],
        corrPostalCode = json['corrPostalCode'],
        corrCity = json['corrCity'],
        corrStreet = json['corrStreet'],
        corrBuildingNumber = json['corrBuildingNumber'],
        corrLocalNumber = json['corrLocalNumber'],
        selectedIncomesType = json['selectedIncomesType'],
        netIncomeFromLastMonth = json['netIncomeFromLastMonth'],
        payday = json['payday'],
        companyName = json['companyName'];
}
