import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
static FirebaseApp? _app;
static FirebaseFirestore get firestore => FirebaseFirestore.instance;
static FirebaseAuth get auth => FirebaseAuth.instance;

static Future<void> init() async {
if (Firebase.apps.isEmpty) {
_app = await Firebase.initializeApp();
}

// sign in anonymously to allow read access if rules permit
try {
if (auth.currentUser == null) {
await auth.signInAnonymously();
}
} catch (e) {
// ignore errors for simplicity
print('Auth error: \$e');
}
}

static Stream<QuerySnapshot> streamLetters() {
return firestore.collection('letters').orderBy('char').snapshots();
}

static Stream<QuerySnapshot> streamNumbers() {
return firestore.collection('numbers').orderBy('value').snapshots();
}
}