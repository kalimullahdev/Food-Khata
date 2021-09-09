import 'package:dartz/dartz.dart';
import 'package:food_khata/entities_failures/auth_failure.dart';

abstract class IAuthFacade {
  Future<Option<String>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future<void> signOut();
}
