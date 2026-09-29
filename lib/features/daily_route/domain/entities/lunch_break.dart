/// State of the agent's one-per-day lunch break, from the `lunch_break`
/// object embedded in `GET /visits/routes/day-status` (and returned
/// directly by the start/end endpoints). Mirrors [DayStatus]'s shape —
/// polled, server-authoritative, never decided client-side.
enum LunchBreakState {
  /// Route activated, break not yet taken today — the agent can start it.
  available,

  /// Currently on break.
  onBreak,

  /// Break taken today (ended early, expired, or ended by route close) —
  /// cannot be taken again today.
  used,

  /// Route not yet activated, or already closed — no lunch action possible.
  unavailable,
}

/// Why an [LunchBreakState.used] break ended.
enum LunchBreakEndReason {
  /// The agent tapped "End lunch" before time ran out.
  manual,

  /// The allotted time ran out; the server ended it automatically.
  expired,

  /// Today's route was closed (or force-closed) while on break.
  routeClosed,
}

/// Single-source-of-truth snapshot of the agent's lunch break for today.
/// The app only ever displays and requests this state — [state],
/// [endsAt], and [endReason] are always what the backend last reported,
/// never a locally-decided value.
class LunchBreak {
  final LunchBreakState state;
  final int allowedMinutes;
  final DateTime? startedAt;
  final DateTime? endsAt;
  final DateTime? returnedAt;
  final LunchBreakEndReason? endReason;

  /// Seconds remaining as reported by the server at response time —
  /// informational only. The UI countdown always recomputes from [endsAt]
  /// instead, since this value goes stale the instant time passes.
  final int? remainingSeconds;

  final int? outletVisitId;

  const LunchBreak({
    required this.state,
    required this.allowedMinutes,
    this.startedAt,
    this.endsAt,
    this.returnedAt,
    this.endReason,
    this.remainingSeconds,
    this.outletVisitId,
  });

  bool get canStart => state == LunchBreakState.available;
}
