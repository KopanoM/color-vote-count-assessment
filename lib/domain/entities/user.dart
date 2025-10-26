class User {
  final int id;
  final String name;
  final String surname;

  const User({required this.id, required this.name, required this.surname});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && id == other.id && name == other.name && surname == other.surname;

  @override
  int get hashCode => Object.hash(id, name, surname);
}
