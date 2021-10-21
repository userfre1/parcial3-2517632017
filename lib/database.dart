import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(String name, String code) async {
    try {
      await firestore.collection("usuarios").add({
        'usuario': usuario,
        'password': pasword,
        'timestamp': FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String idu) async {
    try {
      await firestore.collection("usuarios").doc(idu).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('usuarios').orderBy('timestamp').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "idu": doc.idu,
            "usuario": doc['usuario'],
            "password": doc["password"]
          };
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(String idu, String usuario, String password) async {
    try {
      await firestore.collection("usuarioss").doc(idu).update({
        'usuario': usuario,
        'password': password
      });
    } catch (e) {
      print(e);
    }
  }
}
