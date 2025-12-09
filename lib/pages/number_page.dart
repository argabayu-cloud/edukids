import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import '../models/number_item.dart';


class NumbersPage extends StatelessWidget {
const NumbersPage({super.key});


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Belajar Angka')),
body: StreamBuilder<QuerySnapshot>(
stream: FirebaseService.streamNumbers(),
builder: (context, snapshot) {
if (snapshot.hasError) return const Center(child: Text('Terjadi kesalahan'));
if (snapshot.connectionState == ConnectionState.waiting) {
return const Center(child: CircularProgressIndicator());
}


final docs = snapshot.data!.docs;
final items = docs.map((d) => NumberItem.fromMap(d.id, d.data() as Map<String, dynamic>)).toList();


return GridView.builder(
padding: const EdgeInsets.all(12),
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 4,
mainAxisSpacing: 12,
crossAxisSpacing: 12,
),
itemCount: items.length,
itemBuilder: (context, i) {
return CardTile(
title: items[i].value.toString(),
subtitle: '',
imagePath: items[i].image,
onTap: () => _onTapNumber(context, items[i]),
);
},
);
},
),
);
}


void _onTapNumber(BuildContext context, NumberItem item) {
showDialog(
context: context,
builder: (_) => AlertDialog(
title: Text(item.value.toString(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 48)),
content: Text('Jumlah: \${item.value}'),
actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup'))],
),
);
}
}