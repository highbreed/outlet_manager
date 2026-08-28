import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// Shared chrome for the Daily Route flow's bottom sheets (Close Route
/// confirm, Skip Visit reason, Clock Out warning): a dark scrim, a white
/// sheet with 28px top corners, and a small drag-handle grabber.
Future<T?> showRouteBottomSheet<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  EdgeInsetsGeometry padding = const EdgeInsets.fromLTRB(20, 24, 20, 34),
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: kTextDark.withValues(alpha: 0.35),
    builder: (ctx) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 4,
              margin: const EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                color: kBorderColor,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            Builder(builder: builder),
          ],
        ),
      ),
    ),
  );
}
