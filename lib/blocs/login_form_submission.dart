abstract class login_form_submission{
const login_form_submission();
}

class InitialFormStatus extends login_form_submission{
  const InitialFormStatus();
}

class FormSubmitting extends login_form_submission{
  const FormSubmitting();
}
class SubmissionSuccess extends login_form_submission{

}

class SubmissionFailed extends login_form_submission{
final Exception exception;
SubmissionFailed(this.exception);
}
