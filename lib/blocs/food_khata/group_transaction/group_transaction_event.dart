part of 'group_transaction_bloc.dart';

@freezed
class GroupTransactionEvent with _$GroupTransactionEvent {
  const factory GroupTransactionEvent.groupTransaction({
    required List<String> groupMembers,
  }) = _GroupTransaction;

  const factory GroupTransactionEvent.kalimCheckBoxChange({
    required bool checked,
  }) = _KalimCheckBoxChange;
  const factory GroupTransactionEvent.ikramCheckBoxChange({
    required bool checked,
  }) = _IkramCheckBoxChange;
  const factory GroupTransactionEvent.nafayheckBoxChange({
    required bool checked,
  }) = _NafayCheckBoxChange;
  const factory GroupTransactionEvent.umairCheckBoxChange({
    required bool checked,
  }) = _UmairCheckBoxChange;
  const factory GroupTransactionEvent.debitTransaction({
    required bool isDebited,
  }) = _DebitTransaction;
  const factory GroupTransactionEvent.amountEntered({
    required int amount,
  }) = _AmountEntered;
  const factory GroupTransactionEvent.makeTransaction({required int amount}) =
      _MakeTransaction;
}
