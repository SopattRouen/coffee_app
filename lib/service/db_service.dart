import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_test_1/model/firebase_model.dart';
import 'package:get/get.dart';

const REF = "user";

class ServiceDb {
  final _firebase = FirebaseFirestore.instance;
  late final CollectionReference collect;
  ServiceDb() {
    collect = _firebase.collection(REF).withConverter<DatabaseModel>(
        fromFirestore: (snashot, _) => DatabaseModel.fromJson(snashot.data()!),
        toFirestore: (snap, _) => snap.toJson());
  }
  Stream<QuerySnapshot?> getData() {
    return collect.snapshots();
  }

  void addData(DatabaseModel db) {
    collect.add(db);
    Get.snackbar("Notification", "You're have create account succesfully");
  }
}
