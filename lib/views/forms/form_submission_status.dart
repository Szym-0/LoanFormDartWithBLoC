abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {}

class SubmissionSuccessWithOffer extends FormSubmissionStatus {
  final List<String> offers;

  SubmissionSuccessWithOffer({required this.offers});
}

class SubmissionSuccessWithoutOffer extends FormSubmissionStatus {}

class SubmissionFailed extends FormSubmissionStatus {
  final Exception exception;

  SubmissionFailed(this.exception);
}
