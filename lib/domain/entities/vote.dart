class Vote {
  final int id;
  final String colour;

  const Vote({required this.id, required this.colour});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Vote && id == other.id && colour == other.colour;

  @override
  int get hashCode => Object.hash(id, colour);
}
