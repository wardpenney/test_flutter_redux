class ScoreEntity {
  final String id;
  final int value;

  ScoreEntity(
    this.value,
    this.id,
  );

  @override
  int get hashCode =>
      value.hashCode ^
      id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScoreEntity &&
          value == other.value &&
          id == other.id;

  Map<String, Object> toJson() {
    return {
      "value": value,
      "id": id,
    };
  }

  @override
  String toString() {
    return 'TodoEntity{score: $value, id: $id}';
  }

  static ScoreEntity fromJson(Map<String, Object> json) {
    return ScoreEntity(
      json["value"] as int,
      json["id"] as String,
    );
  }
}
