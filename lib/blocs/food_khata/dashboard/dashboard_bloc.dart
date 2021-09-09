import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:food_khata/repository/food_khata/firebase_firestore_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._firebaseFirestoreRepo) : super(const _Initial());

  final FirebaseFirestoreRepo _firebaseFirestoreRepo;
  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    yield* event.map(
      started: (value) async* {
        final Map<String, dynamic> users =
            await _firebaseFirestoreRepo.getUsers();
        final int ikramBalance = int.parse(users['Ikrambahi'].toString());
        final int kalimBalance = int.parse(users['Kalimullah'].toString());
        final int nafayBalance = int.parse(users['NafayNiazi'].toString());
        final int umairBalance = int.parse(users['UmariSaqib'].toString());
        final int totalBalance = (ikramBalance > 0 ? ikramBalance : 0) +
            (kalimBalance > 0 ? kalimBalance : 0) +
            (nafayBalance > 0 ? nafayBalance : 0) +
            (umairBalance > 0 ? umairBalance : 0);
        yield DashboardState.totalBalance(balance: totalBalance);
      },
    );
  }
}
