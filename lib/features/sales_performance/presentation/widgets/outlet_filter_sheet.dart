import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../../../sales_order/domain/entities/customer.dart';
import '../../../sales_order/presentation/providers/sales_order_providers.dart';

/// Result of [OutletFilterSheet] — `outlet == null` means "all my outlets".
/// Distinct from the sheet popping plain `null` on dismiss (no change).
class OutletFilterResult {
  final SalesCustomer? outlet;

  const OutletFilterResult(this.outlet);
}

/// Full-sheet outlet picker, triggered from a filter button rather than an
/// inline field — searches the agent's own outlets
/// (`GET /sales/customers`) and lets them narrow "My Performance" to one,
/// or clear back to all outlets combined.
class OutletFilterSheet extends ConsumerStatefulWidget {
  final SalesCustomer? selected;

  const OutletFilterSheet({super.key, this.selected});

  @override
  ConsumerState<OutletFilterSheet> createState() => _OutletFilterSheetState();
}

class _OutletFilterSheetState extends ConsumerState<OutletFilterSheet> {
  final _searchController = TextEditingController();
  Timer? _debounce;
  List<SalesCustomer> _results = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _search('');
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> _search(String query) async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final ds = ref.read(salesCustomerRemoteDataSourceProvider);
      final result = await ds.fetchCustomers(
        cardName: query.isEmpty ? null : query,
        size: 30,
      );
      if (!mounted) return;
      setState(() {
        _results = result.items;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _error = 'Unable to load outlets';
        _loading = false;
      });
    }
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 400),
      () => _search(value.trim()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return SafeArea(
          top: false,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: kBorderColor,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 12, 0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Select outlet',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: kTextDark,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: kTextFaint, size: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                child: TextField(
                  controller: _searchController,
                  autofocus: false,
                  onChanged: _onSearchChanged,
                  style: const TextStyle(fontSize: 13, color: kTextDark),
                  decoration: InputDecoration(
                    hintText: 'Search outlets',
                    hintStyle: const TextStyle(fontSize: 13, color: kTextFaint),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 18,
                      color: kTextFaint,
                    ),
                    isDense: true,
                    filled: true,
                    fillColor: kBackground,
                    contentPadding: const EdgeInsets.symmetric(vertical: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              _OutletTile(
                title: 'All outlets (agent-wide)',
                subtitle: null,
                selected: widget.selected == null,
                onTap: () =>
                    Navigator.of(context).pop(const OutletFilterResult(null)),
              ),
              const Divider(height: 1, color: Color(0xFFF0F0EE)),
              Expanded(
                child: _loading
                    ? const Center(child: CircularProgressIndicator())
                    : _error != null
                    ? Center(
                        child: Text(
                          _error!,
                          style: const TextStyle(color: kTextMuted),
                        ),
                      )
                    : _results.isEmpty
                    ? const Center(
                        child: Text(
                          'No outlets found.',
                          style: TextStyle(fontSize: 13, color: kTextMuted),
                        ),
                      )
                    : ListView.separated(
                        controller: scrollController,
                        itemCount: _results.length,
                        separatorBuilder: (_, _) =>
                            const Divider(height: 1, color: Color(0xFFF0F0EE)),
                        itemBuilder: (_, i) {
                          final c = _results[i];
                          final isSelected = widget.selected?.code == c.code;
                          return _OutletTile(
                            title: c.name,
                            subtitle: c.code,
                            selected: isSelected,
                            onTap: () => Navigator.of(
                              context,
                            ).pop(OutletFilterResult(c)),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _OutletTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool selected;
  final VoidCallback onTap;

  const _OutletTile({
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                      color: selected ? kSecondaryColor : kTextDark,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: const TextStyle(fontSize: 11, color: kTextFaint),
                    ),
                ],
              ),
            ),
            if (selected)
              const Icon(Icons.check, size: 18, color: kSecondaryColor),
          ],
        ),
      ),
    );
  }
}
