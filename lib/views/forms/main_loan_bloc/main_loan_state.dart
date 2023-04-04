part of 'main_loan_bloc.dart';

class MainLoanState {
  final String name;
  final String surname;
  final String phoneNumber;
  final String pesel;
  final String idNumber;
  final String email;

  final bool isCorrespondenceAdressSame;

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

  final String? selectedIncomesType;

  final int netIncomeFromLastMonth;
  final int payday;
  final String companyName;

  final FormSubmissionStatus formStatus;

  MainLoanState({
    this.name = '',
    this.surname = '',
    this.phoneNumber = '',
    this.pesel = '',
    this.idNumber = '',
    this.email = '',
    this.isCorrespondenceAdressSame = true,
    this.postalCode = '',
    this.city = '',
    this.street = '',
    this.buildingNumber = '',
    this.localNumber = '',
    this.corrPostalCode = '',
    this.corrCity = '',
    this.corrStreet = '',
    this.corrBuildingNumber = '',
    this.corrLocalNumber = '',
    this.selectedIncomesType,
    this.netIncomeFromLastMonth = 0,
    this.payday = 0,
    this.companyName = '',
    this.formStatus = const InitialFormStatus(),
  });

  MainLoanState copyWith({
    String? name,
    String? surname,
    String? phoneNumber,
    String? pesel,
    String? idNumber,
    String? email,
    bool? isCorrespondenceAdressSame,
    String? postalCode,
    String? city,
    String? street,
    String? buildingNumber,
    String? localNumber,
    String? corrPostalCode,
    String? corrCity,
    String? corrStreet,
    String? corrBuildingNumber,
    String? corrLocalNumber,
    String? selectedIncomesType,
    int? netIncomeFromLastMonth,
    int? payday,
    String? companyName,
    FormSubmissionStatus? formStatus,
  }) {
    return MainLoanState(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      pesel: pesel ?? this.pesel,
      idNumber: idNumber ?? this.idNumber,
      email: email ?? this.email,
      isCorrespondenceAdressSame:
          isCorrespondenceAdressSame ?? this.isCorrespondenceAdressSame,
      postalCode: postalCode ?? this.postalCode,
      city: city ?? this.city,
      street: street ?? this.street,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      localNumber: localNumber ?? this.localNumber,
      corrPostalCode: corrPostalCode ?? this.corrPostalCode,
      corrCity: corrCity ?? this.corrCity,
      corrStreet: corrStreet ?? this.corrStreet,
      corrBuildingNumber: corrBuildingNumber ?? this.corrBuildingNumber,
      corrLocalNumber: corrLocalNumber ?? this.corrLocalNumber,
      selectedIncomesType: selectedIncomesType ?? this.selectedIncomesType,
      netIncomeFromLastMonth:
          netIncomeFromLastMonth ?? this.netIncomeFromLastMonth,
      payday: payday ?? this.payday,
      companyName: companyName ?? this.companyName,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  bool get isCorrespondenceAdressSameAsResidental => isCorrespondenceAdressSame;

  List<DropdownMenuItem<String>> get incomeTypes =>
      Dictionaries.incomeTypes.values
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                    e),
              ))
          .toList();

  int get whatIncomeFormToBuild {
    switch (selectedIncomesType) {
      case 'Umowa o pracę/kontrakt':
      case 'Umowa zlecenie/dzieło':
      case 'Inne':
        return 1;
      case 'Emerytura':
      case 'Renta inwalidzka':
      case 'Renta socjalna':
      case 'Renta rodzinna':
      case 'Renta strukturalna':
      case 'Alimenty':
      case 'Zasiłek':
      case 'Zasiłek dla bezrobotnych':
        return 2;
      case 'Gospodarstwo rolne':
      case 'Dopłaty bezpośrednie':
      case 'Dochód nieudokumentowany':
        return 3;
      case 'Działalność gospodarcza':
        return 4;
      default:
        return 5;
    }
  }

  int get selectedIncomeTypeAsInt => Dictionaries.incomeTypes.keys.firstWhere((element) => Dictionaries.incomeTypes[element] == selectedIncomesType, orElse: () => throw Exception('Nie udało się zmapować żródła dochodu (${selectedIncomesType!}) na int podczas wysyłki wniosku'));

  bool get isValidName => RegExps.nameOrSurname.hasMatch(name);

  bool get isValidSurname => RegExps.nameOrSurname.hasMatch(surname);

  bool get isValidPhoneNumber => RegExps.phoneNumber.hasMatch(phoneNumber);

  bool get isValidPesel => RegExps.pesel.hasMatch(pesel);

  bool get isValidIdNumber => RegExps.idNumber.hasMatch(idNumber);

  bool get isValidEmail => EmailValidator.validate(email);

  bool get isValidPostalCode => RegExps.postalCode.hasMatch(postalCode);

  bool get isValidCity => RegExps.city.hasMatch(city);

  bool get isValidStreet => RegExps.street.hasMatch(street) || street.isEmpty;
  
  bool get isValidBuildingNumber => RegExps.buildingOrLocalNumber.hasMatch(buildingNumber) && !buildingNumber.startsWith('0');

  bool get isValidLocalNumber => RegExps.buildingOrLocalNumber.hasMatch(localNumber) && !localNumber.startsWith('0') || localNumber.isEmpty;

  bool get isValidCorrPostalCode => RegExps.postalCode.hasMatch(corrPostalCode);

  bool get isValidCorrCity => RegExps.city.hasMatch(corrCity);

  bool get isValidCorrStreet => RegExps.street.hasMatch(corrStreet) || corrStreet.isEmpty;

  bool get isValidCorrBuildingNumber => RegExps.buildingOrLocalNumber.hasMatch(corrBuildingNumber) && !corrBuildingNumber.startsWith('0');

  bool get isValidCorrLocalNumber => RegExps.buildingOrLocalNumber.hasMatch(corrLocalNumber) && !corrLocalNumber.startsWith('0') || corrLocalNumber.isEmpty;
}
