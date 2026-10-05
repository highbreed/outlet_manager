import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../../item_groups/domain/entities/item_group.dart';
import '../../../item_groups/presentation/providers/item_group_providers.dart';
import '../../domain/entities/facings_count.dart';
import '../providers/facings_count_controller.dart';

/// Screen to search and add item groups to a facings count.
/// Tapping a group adds it directly to the count with a default quantity
/// of 1; the rep can add multiple groups without leaving this screen.
class FacingsItemGroupSelectionScreen extends ConsumerStatefulWidget {
  final String countLocalId;
  final List<int> existingGroupIds;

  const FacingsItemGroupSelectionScreen({
    super.key,
    required this.countLocalId,
    this.existingGroupIds = const [],
  });

  @override
  ConsumerState<FacingsItemGroupSelectionScreen> createState() =>
      _FacingsItemGroupSelectionScreenState();
}

class _FacingsItemGroupSelectionScreenState
    extends ConsumerState<FacingsItemGroupSelectionScreen> {
  final _searchController = TextEditingController();
  List<ItemGroup> _allGroups = [];
  List<ItemGroup> _filteredGroups = [];
  bool _isLoading = true;
  String? _error;
  int? _addingGroupId;

  @override
  void initState() {
    super.initState();
    _loadItemGroups();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadItemGroups() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final repo = await ref.read(itemGroupRepositoryProvider.future);
      final result = await repo.getItemGroups(size: 200);
      if (!mounted) return;

      result.fold(
        (failure) {
          setState(() {
            _isLoading = false;
            _error = failure.displayMessage;
          });
        },
        (groups) {
          setState(() {
            _allGroups = groups;
            _filteredGroups = groups;
            _isLoading = false;
          });
        },
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error = 'Failed to load item groups: $e';
      });
    }
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredGroups = _allGroups;
      } else {
        final lowerQuery = query.toLowerCase();
        _filteredGroups = _allGroups
            .where(
              (g) =>
                  g.name.toLowerCase().contains(lowerQuery) ||
                  g.code.toLowerCase().contains(lowerQuery),
            )
            .toList();
      }
    });
  }

  /// Current existing group IDs (including newly added ones this session)
  List<int> get _currentExistingIds {
    final draft = ref.read(facingsCountControllerProvider).activeDraft;
    if (draft == null) return widget.existingGroupIds;
    return draft.items.map((i) => i.itemGroupId).toList();
  }

  Future<void> _onGroupTapped(ItemGroup group) async {
    final existingIds = _currentExistingIds;
    if (existingIds.contains(group.id)) {
      // Already added — tapping again does nothing, stepper is on the cart screen
      return;
    }

    setState(() => _addingGroupId = group.id);

    final newItem = FacingsCountItem(
      itemGroupId: group.id,
      itemGroupCode: group.code,
      itemGroupName: group.displayName,
      quantity: 1,
    );

    await ref
        .read(facingsCountControllerProvider.notifier)
        .addItemGroups([newItem]);

    if (mounted) {
      setState(() => _addingGroupId = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Add Item Groups',
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: kSecondaryLightColor,
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 18, color: kSecondaryColor),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Tap an item group to add it to the count. You can add as many as you need.',
                    style: TextStyle(
                      fontSize: 13,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search item groups...',
                prefixIcon: const Icon(Icons.search, color: kTextMuted),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: kSecondaryColor,
                    width: 1.5,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: kSecondaryColor),
      );
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: kRedColor),
              const SizedBox(height: 16),
              Text(
                _error!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: kTextMuted, fontSize: 14),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadItemGroups,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_filteredGroups.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 48,
              color: kTextMuted.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            const Text(
              'No item groups found',
              style: TextStyle(fontSize: 16, color: kTextMuted),
            ),
          ],
        ),
      );
    }

    final existingIds = _currentExistingIds;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _filteredGroups.length,
      itemBuilder: (context, index) {
        final group = _filteredGroups[index];
        final isAlreadyAdded = existingIds.contains(group.id);
        final isAdding = _addingGroupId == group.id;

        return GestureDetector(
          onTap: (isAdding || isAlreadyAdded) ? null : () => _onGroupTapped(group),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: isAlreadyAdded
                  ? Colors.green.shade50.withValues(alpha: 0.5)
                  : Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isAlreadyAdded
                    ? Colors.green.shade300
                    : Colors.grey.shade200,
                width: isAlreadyAdded ? 1.5 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: isAlreadyAdded
                          ? Colors.green.shade50
                          : kSecondaryLightColor,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: isAdding
                        ? const Padding(
                            padding: EdgeInsets.all(12),
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: kSecondaryColor,
                            ),
                          )
                        : Icon(
                            isAlreadyAdded
                                ? Icons.check_circle
                                : Icons.category_outlined,
                            color: isAlreadyAdded
                                ? Colors.green
                                : kSecondaryColor,
                            size: 24,
                          ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          group.displayName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kTextDark,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.label_outline,
                              size: 14,
                              color: Colors.grey.shade400,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              group.code,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            if (isAlreadyAdded) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade50,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'Added',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isAlreadyAdded ? Icons.check : Icons.add_circle_outline,
                    color: isAlreadyAdded
                        ? Colors.green.shade400
                        : kSecondaryColor,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
