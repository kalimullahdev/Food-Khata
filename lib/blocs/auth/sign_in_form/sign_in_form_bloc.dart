import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:food_khata/entities_failures/auth_failure.dart';
import 'package:food_khata/entities_failures/i_auth_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  factory SignInFormBloc(IAuthFacade _authFacade) {
    print("SignInFormBloc Object created");
    return SignInFormBloc._(_authFacade);
  }

  SignInFormBloc._(this._authFacade) : super(SignInFormState.initial());

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(
      signInWithEmailAndPasswordPressed: (value) async* {
        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        );

        Option<Either<AuthFailure, Unit>> failureOrSuccessOption;
        failureOrSuccessOption = none();

        failureOrSuccessOption =
            optionOf(await _authFacade.signInWithEmailAndPassword(
          emailAddress: value.email,
          password: value.password,
        ));

        yield state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: failureOrSuccessOption,
        );
      },
      changeShowErrorMessage: (value) async* {
        yield state.copyWith(
          showErrors: value.showMessages,
        );
      },
    );
  }
}
