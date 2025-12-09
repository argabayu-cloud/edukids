import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import '../models/letter.dart';
import '../widgets/card_tile.dart';


class LettersPage extends StatelessWidget {
const LettersPage({super.key});


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Belajar Huruf')),
body: StreamBuilder<QuerySnapshot>(
stream: FirebaseService.streamLetters(),
builder: (context, snapshot) {
if (snapshot.hasError) return const Center(child: Text('Terjadi kesalahan'));
if (snapshot.connectionState == ConnectionState.waiting) {
return const Center(child: CircularProgressIndicator());
}


final docs = snapshot.data!.docs;
final letters = docs.map((d) => Letter.fromMap(d.id, d.data() as Map<String, dynamic>)).toList();


return GridView.builder(
padding: const EdgeInsets.all(12),
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 4,
mainAxisSpacing: 12,
crossAxisSpacing: 12,
),
itemCount: letters.length,
itemBuilder: (context, i) {
return CardTile(
title: letters[i].char,
subtitle: '',
imagePath: letters[i].image,
onTap: () => _onTapLetter(context, letters[i]),
);
},
);
},
),
);
}


void _onTapLetter(BuildContext context, Letter letter) {
showDialog(
context: context,
builder: (_) => AlertDialog(
title: Text(letter.char, textAlign: TextAlign.center, style: const TextStyle(fontSize: 48)),
content: const Text('Contoh: A untuk Apel'),
actions: [
TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup'))
],
),
);


// play sound if available (opsional)
}
}