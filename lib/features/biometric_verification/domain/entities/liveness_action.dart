/// A single liveness challenge action. Wire values match the backend's
/// proposed `/biometrics/challenge` contract exactly, since challenge
/// generation is server-issued from V1 (see [LivenessAction.fromWireValue]).
enum LivenessAction {
  lookStraight,
  turnLeft,
  turnRight,
  blink;

  String get wireValue => switch (this) {
    LivenessAction.lookStraight => 'LOOK_STRAIGHT',
    LivenessAction.turnLeft => 'TURN_LEFT',
    LivenessAction.turnRight => 'TURN_RIGHT',
    LivenessAction.blink => 'BLINK',
  };

  static LivenessAction fromWireValue(String value) => switch (value) {
    'LOOK_STRAIGHT' => LivenessAction.lookStraight,
    'TURN_LEFT' => LivenessAction.turnLeft,
    'TURN_RIGHT' => LivenessAction.turnRight,
    'BLINK' => LivenessAction.blink,
    _ => throw ArgumentError('Unknown liveness action wire value: $value'),
  };
}
