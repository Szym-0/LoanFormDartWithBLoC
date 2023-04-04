import 'package:POKv2/views/forms/form_submission_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:POKv2/views/forms/main_loan_bloc/main_loan_bloc.dart';
import 'package:POKv2/repositories/loan_repository.dart';
import 'package:flutter_svg/svg.dart';

class MainLoanForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  MainLoanForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white24,
        title: const Center(child: Text('Formularz pożyczkowy')),
      ),
      body: RepositoryProvider(
        create: (context) => LoanRepository(),
        child: BlocProvider(
          create: (context) => MainLoanBloc(
            loanRepo: context.read<LoanRepository>(),
          ),
          child: _mainLoanForm(),
        ),
      ),
    );
  }

  Widget _mainLoanForm() {
    return BlocListener<MainLoanBloc, MainLoanState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.exception.toString());
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
          child: _mainLoanFormFields(),
        ),
      ),
    );
  }

  Widget _mainLoanFormFields() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white38,
        child: Center(
          child: Column(
            children: [
              BlocBuilder<MainLoanBloc, MainLoanState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          _standardTextFieldCase(
                            textFormchild: TextFormField(
                              decoration:
                                  const InputDecoration(labelText: '   Imię'),
                              onChanged: (val) => context
                                  .read<MainLoanBloc>()
                                  .add(NameFieldChanged(name: val)),
                              validator: (_) => state.isValidName
                                  ? null
                                  : '  Wprowadź poprawne imię',
                            ),
                          ),
                          _standardTextFieldCase(
                            textFormchild: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: '   Nazwisko'),
                              onChanged: (val) => context
                                  .read<MainLoanBloc>()
                                  .add(SurnameFieldChanged(surname: val)),
                              validator: (_) => state.isValidSurname
                                  ? null
                                  : '  Wprowadź poprawne nazwisko',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _standardTextFieldCase(
                            textFormchild: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  labelText: '   Telefon'),
                              onChanged: (val) => context
                                  .read<MainLoanBloc>()
                                  .add(PhoneNumberFieldChanged(
                                      phoneNumber: val)),
                              validator: (_) => state.isValidPhoneNumber
                                  ? null
                                  : '  Wprowadź poprawny numer telefonu',
                            ),
                          ),
                          _standardTextFieldCase(
                            textFormchild: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration:
                                  const InputDecoration(labelText: '   PESEL'),
                              onChanged: (val) => context
                                  .read<MainLoanBloc>()
                                  .add(PeselFieldChanged(pesel: val)),
                              validator: (_) => state.isValidPesel
                                  ? null
                                  : '  Wprowadź poprawny PESEL',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _standardTextFieldCase(
                            textFormchild: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: '   Numer dowodu osobistego'),
                              onChanged: (val) => context
                                  .read<MainLoanBloc>()
                                  .add(IdNumberFieldChanged(idNumber: val)),
                              validator: (_) => state.isValidIdNumber
                                  ? null
                                  : '  Wprowadź poprawny numer dowodu',
                            ),
                          ),
                          _standardTextFieldCase(
                            textFormchild: TextFormField(
                              decoration:
                                  const InputDecoration(labelText: '   Email'),
                              onChanged: (val) => context
                                  .read<MainLoanBloc>()
                                  .add(EmailFieldChanged(email: val)),
                              validator: (_) => state.isValidEmail
                                  ? null
                                  : '  Wprowadź poprawny email',
                            ),
                          ),
                        ],
                      ),
                      //Adres zamieszkania klienta
                      Row(
                        children: [
                          _standardTextFieldCase(
                            textFormchild: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: '   Kod pocztowy'),
                              onChanged: (val) => context
                                  .read<MainLoanBloc>()
                                  .add(PostalCodeFieldChanged(postalCode: val)),
                              validator: (_) => state.isValidPostalCode
                                  ? null
                                  : '  Wprowadź poprawny kod pocztowy',
                            ),
                          ),
                          _standardTextFieldCase(
                            textFormchild: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: '   Miejscowość'),
                              onChanged: (val) => context
                                  .read<MainLoanBloc>()
                                  .add(CityFieldChanged(city: val)),
                              validator: (_) => state.isValidCity
                                  ? null
                                  : '  Wprowadź poprawną miejscowość',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _standardTextFieldCase(
                            flex: 2,
                            textFormchild: TextFormField(
                              decoration:
                                  const InputDecoration(labelText: '   Ulica'),
                              onChanged: (val) => context
                                  .read<MainLoanBloc>()
                                  .add(StreetFieldChanged(street: val)),
                              validator: (_) => state.isValidStreet
                                  ? null
                                  : '  Wprowadź poprawną nazwę ulicy',
                            ),
                          ),
                          _standardTextFieldCase(
                            flex: 1,
                            textFormchild: TextFormField(
                              decoration: const InputDecoration(
                                labelText: '   Nr budynku',
                              ),
                              onChanged: (val) => context
                                  .read<MainLoanBloc>()
                                  .add(BuildingNumberFieldChanged(
                                      buildingNumber: val)),
                              validator: (_) => state.isValidBuildingNumber
                                  ? null
                                  : '  Błędny numer',
                            ),
                          ),
                          _standardTextFieldCase(
                            flex: 1,
                            textFormchild: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: '   Nr lokalu'),
                              onChanged: (val) => context
                                  .read<MainLoanBloc>()
                                  .add(LocalNumberFieldChanged(
                                      localNumber: val)),
                              validator: (_) => state.isValidLocalNumber
                                  ? null
                                  : '  Błędny numer',
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => context.read<MainLoanBloc>().add(
                            CorrespondenceAdressBoxChanged(
                                checkBoxValue:
                                    !state.isCorrespondenceAdressSame)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              checkColor: Colors.red,
                              value: state.isCorrespondenceAdressSame,
                              onChanged: (_) {},
                            ),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 8, 5, 15),
                                child: Text(
                                  'Adres korespondencyjny taki sam jak adres zamieszkania',
                                  style: TextStyle(
                                      fontSize: 18,
                                      overflow: TextOverflow.visible),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      state.isCorrespondenceAdressSame
                          ? //Adres korespondencyjny klienta
                          const SizedBox()
                          : Column(
                              children: [
                                Row(
                                  children: [
                                    _standardTextFieldCase(
                                      textFormchild: TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: '   Kod pocztowy'),
                                        onChanged: (val) => context
                                            .read<MainLoanBloc>()
                                            .add(CorrPostalCodeFieldChanged(
                                                corrPostalCode: val)),
                                        validator: (_) => state
                                                .isValidCorrPostalCode
                                            ? null
                                            : '  Wprowadź poprawny kod pocztowy',
                                      ),
                                    ),
                                    _standardTextFieldCase(
                                      textFormchild: TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: '   Miejscowość'),
                                        onChanged: (val) => context
                                            .read<MainLoanBloc>()
                                            .add(CorrCityFieldChanged(
                                                corrCity: val)),
                                        validator: (_) => state.isValidCorrCity
                                            ? null
                                            : '  Wprowadź poprawną miejscowość',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    _standardTextFieldCase(
                                      flex: 2,
                                      textFormchild: TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: '   Ulica'),
                                        onChanged: (val) => context
                                            .read<MainLoanBloc>()
                                            .add(CorrStreetFieldChanged(
                                                corrStreet: val)),
                                        validator: (_) => state
                                                .isValidCorrStreet
                                            ? null
                                            : '  Wprowadź poprawną nazwę ulicy',
                                      ),
                                    ),
                                    _standardTextFieldCase(
                                      flex: 1,
                                      textFormchild: TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: '   Nr budynku'),
                                        onChanged: (val) => context
                                            .read<MainLoanBloc>()
                                            .add(CorrBuildingNumberFieldChanged(
                                                corrBuildingNumber: val)),
                                        validator: (_) =>
                                            state.isValidCorrBuildingNumber
                                                ? null
                                                : '  Błędny numer',
                                      ),
                                    ),
                                    _standardTextFieldCase(
                                      flex: 1,
                                      textFormchild: TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: '   Nr lokalu'),
                                        onChanged: (val) => context
                                            .read<MainLoanBloc>()
                                            .add(CorrLocalNumberFieldChanged(
                                                corrLocalNumber: val)),
                                        validator: (_) =>
                                            state.isValidCorrLocalNumber
                                                ? null
                                                : '  Błędny numer',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                      DropdownButton(
                        hint: const Text('Typ dochodu'),
                        value: state.selectedIncomesType,
                        items: state.incomeTypes,
                        onChanged: (val) => context.read<MainLoanBloc>().add(
                            IncomeTypeBoxChanged(
                                incomeTypeBoxValue: val.toString())),
                      ),
                      if (state.whatIncomeFormToBuild == 1) ...[
                        Row(
                          children: [
                            _netIncomeFromLastMonthField(),
                            _paydayField(),
                          ],
                        ),
                        Row(
                          children: [_companyNameField()],
                        )
                      ] else if (state.whatIncomeFormToBuild == 2) ...[
                        Row(
                          children: [
                            _netIncomeFromLastMonthField(),
                            _paydayField(),
                          ],
                        ),
                      ] else if (state.whatIncomeFormToBuild == 3) ...[
                        Row(
                          children: [
                            _netIncomeFromLastMonthField(),
                          ],
                        ),
                      ] else if (state.whatIncomeFormToBuild == 4) ...[
                        Row(
                          children: [
                            _netIncomeFromLastMonthField(),
                            _companyNameField(),
                          ],
                        ),
                      ] else
                        const SizedBox(),

                      const SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                          _formKey.currentState!.validate();
                          context.read<MainLoanBloc>().add(LoanSubmitted());
                        },
                        child: Card(
                          shadowColor: Colors.green,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.red,
                          child: SizedBox(
                            height: 60,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: const Center(
                              child: Text(
                                'Złóż wniosek',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _netIncomeFromLastMonthField() {
    return _standardTextFieldCase(
      flex: 1,
      textFormchild: TextFormField(
        decoration: const InputDecoration(
            labelText: '   Dochody netto za ostatni miesiąc'),
        validator: (val) => null,
      ),
    );
  }

  Widget _paydayField() {
    return _standardTextFieldCase(
      flex: 1,
      textFormchild: TextFormField(
        decoration: const InputDecoration(labelText: '   Dzień wypłaty'),
        validator: (val) => null,
      ),
    );
  }

  Widget _companyNameField() {
    return _standardTextFieldCase(
      flex: 1,
      textFormchild: TextFormField(
        decoration: const InputDecoration(
            labelText: '   Dochody netto za ostatni miesiąc'),
        validator: (val) => null,
      ),
    );
  }

  Widget _standardTextFieldCase(
      {int flex = 1, required TextFormField textFormchild}) {
    return Flexible(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: textFormchild,
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
