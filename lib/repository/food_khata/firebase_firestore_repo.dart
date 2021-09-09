import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseFirestoreRepo {
  final FirebaseFirestore _firebaseFirestore;

  // FirebaseFirestoreRepo(this._firebaseFirestore);

  factory FirebaseFirestoreRepo(FirebaseFirestore _firebaseAuth) {
    print("FirebaseFirestoreRepo Object created");
    return FirebaseFirestoreRepo._(_firebaseAuth);
  }

  const FirebaseFirestoreRepo._(this._firebaseFirestore);

  Future<Map<String, dynamic>> getUsers() async {
    Map<String, dynamic> users = <String, dynamic>{};
    await _firebaseFirestore
        .collection('group_members')
        .doc("vCtbIKnZkfp2n8y8ITtl")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      users = documentSnapshot.data() as Map<String, dynamic>;
      // if (documentSnapshot.exists) {
      //   // ignore: cast_nullable_to_non_nullable
      //   users = documentSnapshot.data() as Map<String, dynamic>;
      // } else {
      //   print('Document does not exist on the database');
      // }
    });
    return users;
  }

  Future<void> makeTransaction({
    required bool debit,
    required int amount,
    required List<String> usersList,
  }) async {
    print("Debit $debit and amount $amount and  ${usersList.toString()} ");

    final int usersCount = usersList.length;
    final int individualAmount = (amount / usersCount).round();
    final Map<String, dynamic> users = await getUsers();
    _transaction(
      debit: debit,
      individualAmount: individualAmount,
      users: users,
      usersList: usersList,
    );

    _firebaseFirestore
        .collection("group_members")
        .doc("vCtbIKnZkfp2n8y8ITtl")
        .update(users);
  }
}

void _transaction({
  required Map<String, dynamic> users,
  required int individualAmount,
  required bool debit,
  required List<String> usersList,
}) {
  final int addOrSubtract = debit ? 1 : -1;
  if (usersList.contains("Kalimullah")) {
    users["Kalimullah"] = convertStringToInt(users["Kalimullah"].toString()) +
        individualAmount * addOrSubtract;
  }
  if (usersList.contains("Ikrambahi")) {
    users["Ikrambahi"] = convertStringToInt(users["Ikrambahi"].toString()) +
        individualAmount * addOrSubtract;
  }
  if (usersList.contains("NafayNiazi")) {
    users["NafayNiazi"] = convertStringToInt(users["NafayNiazi"].toString()) +
        individualAmount * addOrSubtract;
  }
  if (usersList.contains("UmariSaqib")) {
    users["UmariSaqib"] = convertStringToInt(users["UmariSaqib"].toString()) +
        individualAmount * addOrSubtract;
  }
}

int convertStringToInt(String value) {
  return int.parse(value);
}
