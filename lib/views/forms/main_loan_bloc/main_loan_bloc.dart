import 'package:POKv2/helpers/dictionaries.dart';
import 'package:POKv2/helpers/reg_exps.dart';
import 'package:POKv2/models/main_loan_form_data.dart';
import 'package:POKv2/repositories/loan_repository.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:POKv2/views/forms/form_submission_status.dart';

part 'main_loan_event.dart';
part 'main_loan_state.dart';

class MainLoanBloc extends Bloc<MainLoanEvent, MainLoanState> {
  final LoanRepository loanRepo;

  MainLoanBloc({required this.loanRepo}) : super(MainLoanState());

  @override
  Stream<MainLoanState> mapEventToState(MainLoanEvent event) async* {
    if (event is NameFieldChanged) {
      yield state.copyWith(name: event.name);
    } else if (event is SurnameFieldChanged) {
      yield state.copyWith(surname: event.surname);
    } else if (event is PhoneNumberFieldChanged) {
      yield state.copyWith(phoneNumber: event.phoneNumber);
    } else if (event is PeselFieldChanged) {
      yield state.copyWith(pesel: event.pesel);
    } else if (event is IdNumberFieldChanged) {
      yield state.copyWith(idNumber: event.idNumber);
    } else if (event is EmailFieldChanged) {
      yield state.copyWith(email: event.email);
    } else if (event is CorrespondenceAdressBoxChanged) {
      yield state.copyWith(isCorrespondenceAdressSame: event.checkBoxValue);
    } else if (event is PostalCodeFieldChanged) {
      yield state.copyWith(postalCode: event.postalCode);
    } else if (event is CityFieldChanged) {
      yield state.copyWith(city: event.city);
    } else if (event is StreetFieldChanged) {
      yield state.copyWith(street: event.street);
    } else if (event is BuildingNumberFieldChanged) {
      yield state.copyWith(buildingNumber: event.buildingNumber);
    } else if (event is LocalNumberFieldChanged) {
      yield state.copyWith(localNumber: event.localNumber);
    } else if (event is CorrPostalCodeFieldChanged) {
      yield state.copyWith(postalCode: event.corrPostalCode);
    } else if (event is CorrCityFieldChanged) {
      yield state.copyWith(city: event.corrCity);
    } else if (event is CorrStreetFieldChanged) {
      yield state.copyWith(street: event.corrStreet);
    } else if (event is CorrBuildingNumberFieldChanged) {
      yield state.copyWith(buildingNumber: event.corrBuildingNumber);
    } else if (event is CorrLocalNumberFieldChanged) {
      yield state.copyWith(localNumber: event.corrLocalNumber);
    } else if (event is IncomeTypeBoxChanged) {
      yield state.copyWith(selectedIncomesType: event.incomeTypeBoxValue);
    } else if (event is LoanSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      //TODO if(adresZamieszkania == adresKorespondencyjny) To podstaw zamieszkania do korespondencyjnego

      //TODO w zależności od typu dochodu ustaw poprawnie resztę z nich

      try {
        var loanData = _extractDataFromState();

        var response = await loanRepo.sendLoan(loanData.toJson());

        if (response != null) {
          yield state.copyWith(
              formStatus: SubmissionSuccessWithOffer(offers: response));
        } else {
          yield state.copyWith(formStatus: SubmissionSuccessWithoutOffer());
        }
      } on Exception catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }

  MainLoanFormData _extractDataFromState() {
    return state.isCorrespondenceAdressSame
        ? MainLoanFormData(           //Jeśli adres korespondencyjny jest taki sam jak zaimeszkania to ustawiam adres korespondencyjny = adres zamieszkania
            name: state.name,
            surname: state.surname,
            phoneNumber: state.phoneNumber,
            pesel: state.pesel,
            idNumber: state.idNumber,
            email: state.email,
            isCorrespondenceAdressSame: state.isCorrespondenceAdressSame ? 1 : 0,
            postalCode: state.postalCode,
            city: state.city,
            street: state.street,
            buildingNumber: state.buildingNumber,
            localNumber: state.localNumber,
            corrPostalCode: state.postalCode,
            corrCity: state.city,
            corrStreet: state.street,
            corrBuildingNumber: state.buildingNumber,
            corrLocalNumber: state.localNumber,
            selectedIncomesType: state.selectedIncomeTypeAsInt,
            netIncomeFromLastMonth: state.netIncomeFromLastMonth,
            payday: state.payday,
            companyName: state.companyName)
        : MainLoanFormData(
            name: state.name,
            surname: state.surname,
            phoneNumber: state.phoneNumber,
            pesel: state.pesel,
            idNumber: state.idNumber,
            email: state.email,
            isCorrespondenceAdressSame: state.isCorrespondenceAdressSame ? 1 : 0,
            postalCode: state.postalCode,
            city: state.city,
            street: state.street,
            buildingNumber: state.buildingNumber,
            localNumber: state.localNumber,
            corrPostalCode: state.corrPostalCode,
            corrCity: state.corrCity,
            corrStreet: state.corrStreet,
            corrBuildingNumber: state.corrBuildingNumber,
            corrLocalNumber: state.corrLocalNumber,
            selectedIncomesType: state.selectedIncomeTypeAsInt,
            netIncomeFromLastMonth: state.netIncomeFromLastMonth,
            payday: state.payday,
            companyName: state.companyName);
  }
}
