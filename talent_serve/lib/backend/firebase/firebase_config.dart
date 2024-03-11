import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCi_1xYiieSgTZ1qyhT_UPVNvg5Djl67nE",
            authDomain: "talent-serve-fqbamm.firebaseapp.com",
            projectId: "talent-serve-fqbamm",
            storageBucket: "talent-serve-fqbamm.appspot.com",
            messagingSenderId: "238133792593",
            appId: "1:238133792593:web:d49297be3e708797c08d70"));
  } else {
    await Firebase.initializeApp();
  }
}
