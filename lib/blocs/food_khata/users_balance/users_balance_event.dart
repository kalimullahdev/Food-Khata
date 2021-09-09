part of 'users_balance_bloc.dart';

@freezed
class UsersBalanceEvent with _$UsersBalanceEvent {
  const factory UsersBalanceEvent.started() = _Started;
}