import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:food_khata/repository/food_khata/firebase_firestore_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'users_balance_event.dart';
part 'users_balance_state.dart';
part 'users_balance_bloc.freezed.dart';

@injectable
class UsersBalanceBloc extends Bloc<UsersBalanceEvent, UsersBalanceState> {
  UsersBalanceBloc(this._firebaseFirestoreRepo)
      : super(UsersBalanceState.initial());
  final FirebaseFirestoreRepo _firebaseFirestoreRepo;

  @override
  Stream<UsersBalanceState> mapEventToState(
    UsersBalanceEvent event,
  ) async* {
    yield* event.map(
      started: (value) async* {
        final Map<String, dynamic> user =
            await _firebaseFirestoreRepo.getUsers();
        yield UsersBalanceState.update(
          ikram: int.parse(user['Ikrambahi'].toString()),
          kalim: int.parse(user['Kalimullah'].toString()),
          nafay: int.parse(user['NafayNiazi'].toString()),
          umair: int.parse(user['UmariSaqib'].toString()),
        );
      },
    );
  }
}
