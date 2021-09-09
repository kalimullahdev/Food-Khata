import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:food_khata/repository/food_khata/firebase_firestore_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'group_transaction_event.dart';
part 'group_transaction_state.dart';
part 'group_transaction_bloc.freezed.dart';

@injectable
class GroupTransactionBloc
    extends Bloc<GroupTransactionEvent, GroupTransactionState> {
  GroupTransactionBloc(this._firebaseFirestoreRepo)
      : super(GroupTransactionState.initial());
  final FirebaseFirestoreRepo _firebaseFirestoreRepo;

  @override
  Stream<GroupTransactionState> mapEventToState(
    GroupTransactionEvent event,
  ) async* {
    yield* event.map(
      groupTransaction: (value) async* {},
      kalimCheckBoxChange: (value) async* {
        yield state.copyWith(
          kalimChecked: value.checked,
          checkBoxFailure:
              !checkCheckBoxesChecked(currentCheckBoxValue: value.checked),
        );
      },
      ikramCheckBoxChange: (value) async* {
        yield state.copyWith(
          ikramChecked: value.checked,
          checkBoxFailure:
              !checkCheckBoxesChecked(currentCheckBoxValue: value.checked),
        );
      },
      umairCheckBoxChange: (value) async* {
        yield state.copyWith(
          umairChecked: value.checked,
          checkBoxFailure:
              !checkCheckBoxesChecked(currentCheckBoxValue: value.checked),
        );
      },
      nafayheckBoxChange: (value) async* {
        yield state.copyWith(
          nafayChecked: value.checked,
          checkBoxFailure:
              !checkCheckBoxesChecked(currentCheckBoxValue: value.checked),
        );
      },
      debitTransaction: (value) async* {
        yield state.copyWith(debit: value.isDebited);
      },
      amountEntered: (value) async* {
        yield state.copyWith(amount: value.amount);
      },
      makeTransaction: (value) async* {
        final bool boxesChecked = checkCheckBoxesChecked();
        yield state.copyWith(
          checkBoxFailure: !boxesChecked,
          isFormValid: boxesChecked,
        );
        if (boxesChecked) {
          List<String> usersList = <String>[];
          if (state.ikramChecked) {
            usersList.add("Ikrambahi");
          }
          if (state.kalimChecked) {
            usersList.add("Kalimullah");
          }
          if (state.nafayChecked) {
            usersList.add("NafayNiazi");
          }
          if (state.umairChecked) {
            usersList.add("UmariSaqib");
          }
          _firebaseFirestoreRepo.makeTransaction(
            debit: state.debit,
            amount: value.amount,
            usersList: usersList,
          );
        }
      },
    );
  }

  bool checkCheckBoxesChecked({bool currentCheckBoxValue = false}) {
    if (currentCheckBoxValue) {
      return currentCheckBoxValue;
    } else {
      final List<bool> checkBoxList = <bool>[
        state.ikramChecked,
        state.kalimChecked,
        state.nafayChecked,
        state.umairChecked
      ];
      return checkBoxList.contains(true);
    }
  }
}
