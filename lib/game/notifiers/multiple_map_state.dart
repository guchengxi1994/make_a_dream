import 'package:bonfire/bonfire.dart' as b;

class MultipleMapState {
  final String routeName;
  final b.Vector2 position;

  MultipleMapState({
    required this.routeName,
    required this.position,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MultipleMapState &&
          runtimeType == other.runtimeType &&
          routeName == other.routeName &&
          position == other.position;

  @override
  int get hashCode => routeName.hashCode;

  MultipleMapState copyWith({
    String? routeName,
    b.Vector2? position,
  }) {
    return MultipleMapState(
      routeName: routeName ?? this.routeName,
      position: position ?? this.position,
    );
  }
}
