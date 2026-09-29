import 'package:flutter_test/flutter_test.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/entities/mapping_enums.dart';

void main() {
  group('MappingLocalState', () {
    test('only server-confirmed/employee-cancelled states are terminal', () {
      expect(MappingLocalState.pendingReview.isTerminal, isTrue);
      expect(MappingLocalState.captureFailed.isTerminal, isTrue);
      expect(MappingLocalState.abandoned.isTerminal, isTrue);
      expect(MappingLocalState.cancelled.isTerminal, isTrue);

      expect(MappingLocalState.idle.isTerminal, isFalse);
      expect(MappingLocalState.preparing.isTerminal, isFalse);
      expect(MappingLocalState.capturing.isTerminal, isFalse);
      expect(MappingLocalState.captureFinishedLocal.isTerminal, isFalse);
      expect(MappingLocalState.uploadPending.isTerminal, isFalse);
      expect(MappingLocalState.submitting.isTerminal, isFalse);
      expect(MappingLocalState.finishResultUnknown.isTerminal, isFalse);
      expect(MappingLocalState.abandoning.isTerminal, isFalse);
    });

    test('only `capturing` is actively-capturing — spec §4/§39 gate', () {
      for (final state in MappingLocalState.values) {
        expect(
          state.isActivelyCapturing,
          state == MappingLocalState.capturing,
          reason: '$state should ${state == MappingLocalState.capturing ? '' : 'not '}be actively capturing',
        );
      }
    });
  });

  group('MappingFootprintStatus.fromWire', () {
    test('parses every documented backend value (spec §11)', () {
      expect(MappingFootprintStatus.fromWire('CAPTURING'), MappingFootprintStatus.capturing);
      expect(MappingFootprintStatus.fromWire('PENDING_REVIEW'), MappingFootprintStatus.pendingReview);
      expect(MappingFootprintStatus.fromWire('CAPTURE_FAILED'), MappingFootprintStatus.captureFailed);
      expect(MappingFootprintStatus.fromWire('ABANDONED'), MappingFootprintStatus.abandoned);
      expect(MappingFootprintStatus.fromWire('REJECTED'), MappingFootprintStatus.rejected);
      expect(MappingFootprintStatus.fromWire('ACTIVE'), MappingFootprintStatus.active);
      expect(MappingFootprintStatus.fromWire('SUPERSEDED'), MappingFootprintStatus.superseded);
    });

    test('rejects an unknown status rather than silently inventing one (spec §11)', () {
      expect(() => MappingFootprintStatus.fromWire('SOMETHING_NEW'), throwsArgumentError);
    });
  });

  group('MappingFailureCode.fromWire', () {
    test('parses every documented failure code and never throws on an unknown one', () {
      expect(MappingFailureCode.fromWire('INSUFFICIENT_SAMPLES'), MappingFailureCode.insufficientSamples);
      expect(MappingFailureCode.fromWire(null), isNull);
      expect(MappingFailureCode.fromWire('SOME_FUTURE_CODE'), isNull);
    });

    test('every code has non-technical, employee-facing copy (spec §112)', () {
      for (final code in MappingFailureCode.values) {
        expect(code.displayMessage, isNotEmpty);
        expect(code.displayMessage.toUpperCase(), isNot(contains('_'))); // not a raw enum/code string
      }
    });
  });
}
