import 'package:meta/meta.dart';
import 'package:test_flutter_redux/utilities/uuid.dart';
import 'package:test_flutter_redux/repositories/score_entity.dart';

@immutable
class Score {
  final String id;
  final int value;

  Score(this.value, {String id})
      : this.id = id ?? Uuid().generateV4();

  Score copyWith({int value, String id}) {
    return Score(
      value ?? this.value,
      id: id ?? this.id,
    );
  }

  @override
  int get hashCode =>
      value.hashCode ^ 
      id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Score &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          id == other.id;

  @override
  String toString() {
    return 'Todo{value: $value, id: $id}';
  }

  ScoreEntity toEntity() {
    return ScoreEntity(value, id);
  }

  static Score fromEntity(ScoreEntity entity) {
    return Score(
      entity.value,
      id: entity.id ?? Uuid().generateV4(),
    );
  }
}
