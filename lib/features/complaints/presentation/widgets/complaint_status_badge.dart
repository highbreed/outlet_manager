import 'package:flutter/material.dart';

import '../../domain/entities/complaint.dart';

class ComplaintStatusBadge extends StatelessWidget {
  final ComplaintStatus status;

  const ComplaintStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: _bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: _fg,
        ),
      ),
    );
  }

  Color get _bg {
    switch (status) {
      case ComplaintStatus.open:
        return const Color(0xFFE3F2FD);
      case ComplaintStatus.inProgress:
        return const Color(0xFFFFF3E0);
      case ComplaintStatus.resolved:
        return const Color(0xFFE8F5E9);
      case ComplaintStatus.closed:
        return const Color(0xFFF3E5F5);
      case ComplaintStatus.cancelled:
        return const Color(0xFFFFEBEE);
    }
  }

  Color get _fg {
    switch (status) {
      case ComplaintStatus.open:
        return const Color(0xFF1565C0);
      case ComplaintStatus.inProgress:
        return const Color(0xFFE65100);
      case ComplaintStatus.resolved:
        return const Color(0xFF2E7D32);
      case ComplaintStatus.closed:
        return const Color(0xFF6A1B9A);
      case ComplaintStatus.cancelled:
        return const Color(0xFFC62828);
    }
  }
}
