part of 'group_transaction_bloc.dart';

@freezed
class GroupTransactionState with _$GroupTransactionState {
  const factory GroupTransactionState({
    required bool kalimChecked,
    required bool nafayChecked,
    required bool ikramChecked,
    required bool umairChecked,
    required bool debit,
    required int amount,
    required bool checkBoxFailure,
    required bool isFormValid,
  }) = _GroupTransactionState;

  factory GroupTransactionState.initial() => const GroupTransactionState(
        kalimChecked: false,
        nafayChecked: false,
        ikramChecked: false,
        umairChecked: false,
        isFormValid: false,
        checkBoxFailure: false,
        debit: true,
        amount: 0,
      );
}
