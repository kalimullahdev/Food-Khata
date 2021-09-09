// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'blocs/auth/auth_bloc.dart' as _i11;
import 'blocs/auth/sign_in_form/sign_in_form_bloc.dart' as _i9;
import 'blocs/food_khata/dashboard/dashboard_bloc.dart' as _i12;
import 'blocs/food_khata/group_transaction/group_transaction_bloc.dart' as _i6;
import 'blocs/food_khata/users_balance/users_balance_bloc.dart' as _i10;
import 'entities_failures/i_auth_repo.dart' as _i7;
import 'repository/auth/firebase_auth.dart' as _i8;
import 'repository/core/firebase_injectable_module.dart' as _i13;
import 'repository/food_khata/firebase_firestore_repo.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuthhhhhhh);
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i5.FirebaseFirestoreRepo>(
      () => _i5.FirebaseFirestoreRepo(get<_i4.FirebaseFirestore>()));
  gh.factory<_i6.GroupTransactionBloc>(
      () => _i6.GroupTransactionBloc(get<_i5.FirebaseFirestoreRepo>()));
  gh.lazySingleton<_i7.IAuthFacade>(
      () => _i8.FirebaseAuthRepo(get<_i3.FirebaseAuth>()));
  gh.factory<_i9.SignInFormBloc>(
      () => _i9.SignInFormBloc(get<_i7.IAuthFacade>()));
  gh.factory<_i10.UsersBalanceBloc>(
      () => _i10.UsersBalanceBloc(get<_i5.FirebaseFirestoreRepo>()));
  gh.factory<_i11.AuthBloc>(() => _i11.AuthBloc(get<_i7.IAuthFacade>()));
  gh.factory<_i12.DashboardBloc>(
      () => _i12.DashboardBloc(get<_i5.FirebaseFirestoreRepo>()));
  return get;
}

class _$FirebaseInjectableModule extends _i13.FirebaseInjectableModule {}
