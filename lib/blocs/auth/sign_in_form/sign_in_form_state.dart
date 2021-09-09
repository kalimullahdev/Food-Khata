part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required bool isSubmitting,
    required bool showErrors,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        isSubmitting: false,
        showErrors: false,
        authFailureOrSuccessOption: none(),
      );
}
