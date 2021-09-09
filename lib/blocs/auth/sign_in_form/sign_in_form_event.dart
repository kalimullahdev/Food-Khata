part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.signInWithEmailAndPasswordPressed({
    required String email,
    required String password,
  }) = SignInWithEmailAndPasswordPressed;
  const factory SignInFormEvent.changeShowErrorMessage({
    required bool showMessages,
  }) = ChangeShowErrorMessage;
}
