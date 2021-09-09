part of 'users_balance_bloc.dart';

@freezed
class UsersBalanceState with _$UsersBalanceState {
  const factory UsersBalanceState({
    required int ikramBalance,
    required int kalimBalance,
    required int nafayBalance,
    required int umairBalance,
  }) = _UsersBalanceState;

  factory UsersBalanceState.initial() => const UsersBalanceState(
        ikramBalance: 0,
        kalimBalance: 0,
        nafayBalance: 0,
        umairBalance: 0,
      );

  factory UsersBalanceState.update({
    required int ikram,
    required int kalim,
    required int nafay,
    required int umair,
  }) =>
      UsersBalanceState(
        ikramBalance: ikram,
        kalimBalance: kalim,
        nafayBalance: nafay,
        umairBalance: umair,
      );
}
