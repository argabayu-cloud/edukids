class Letter {
final String id;
final String char;
final String? image; // optional: path/url
final String? sound; // optional: path/url


Letter({required this.id, required this.char, this.image, this.sound});


factory Letter.fromMap(String id, Map<String, dynamic> data) {
return Letter(
id: id,
char: data['char'] ?? '',
image: data['image'],
sound: data['sound'],
);
}
}