class NumberItem {
final String id;
final int value;
final String? image;
final String? sound;


NumberItem({required this.id, required this.value, this.image, this.sound});


factory NumberItem.fromMap(String id, Map<String, dynamic> data) {
return NumberItem(
id: id,
value: (data['value'] ?? 0) as int,
image: data['image'],
sound: data['sound'],
);
}
}