part of 'main_loan_bloc.dart';

abstract class MainLoanEvent {}

class NameFieldChanged extends MainLoanEvent {
  final String name;

  NameFieldChanged({required this.name});
}

class SurnameFieldChanged extends MainLoanEvent {
  final String surname;

  SurnameFieldChanged({required this.surname});
}

class PhoneNumberFieldChanged extends MainLoanEvent {
  final String phoneNumber;

  PhoneNumberFieldChanged({required this.phoneNumber});
}

class PeselFieldChanged extends MainLoanEvent {
  final String pesel;

  PeselFieldChanged({required this.pesel});
}

class IdNumberFieldChanged extends MainLoanEvent {
  final String idNumber;

  IdNumberFieldChanged({required this.idNumber});
}

class EmailFieldChanged extends MainLoanEvent {
  final String email;

  EmailFieldChanged({required this.email});
}

class PostalCodeFieldChanged extends MainLoanEvent {
  final String postalCode;

  PostalCodeFieldChanged({required this.postalCode});
}

class CityFieldChanged extends MainLoanEvent {
  final String city;

  CityFieldChanged({required this.city});
}

class StreetFieldChanged extends MainLoanEvent {
  final String street;

  StreetFieldChanged({required this.street});
}

class BuildingNumberFieldChanged extends MainLoanEvent {
  final String buildingNumber;

  BuildingNumberFieldChanged({required this.buildingNumber});
}

class LocalNumberFieldChanged extends MainLoanEvent {
  final String localNumber;

  LocalNumberFieldChanged({required this.localNumber});
}

class CorrPostalCodeFieldChanged extends MainLoanEvent {
  final String corrPostalCode;

  CorrPostalCodeFieldChanged({required this.corrPostalCode});
}

class CorrCityFieldChanged extends MainLoanEvent {
  final String corrCity;

  CorrCityFieldChanged({required this.corrCity});
}

class CorrStreetFieldChanged extends MainLoanEvent {
  final String corrStreet;

  CorrStreetFieldChanged({required this.corrStreet});
}

class CorrBuildingNumberFieldChanged extends MainLoanEvent {
  final String corrBuildingNumber;

  CorrBuildingNumberFieldChanged({required this.corrBuildingNumber});
}

class CorrLocalNumberFieldChanged extends MainLoanEvent {
  final String corrLocalNumber;

  CorrLocalNumberFieldChanged({required this.corrLocalNumber});
}

class CorrespondenceAdressBoxChanged extends MainLoanEvent {
  final bool checkBoxValue;

  CorrespondenceAdressBoxChanged({required this.checkBoxValue});
}

class IncomeTypeBoxChanged extends MainLoanEvent {
  final String incomeTypeBoxValue;

  IncomeTypeBoxChanged({required this.incomeTypeBoxValue});
}

class LoanSubmitted extends MainLoanEvent {}