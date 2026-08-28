import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/aftersales_registration_list_item.dart';
import '../providers/complaint_providers.dart';
import '../widgets/widgets.dart';

class ComplaintsHomeScreen extends ConsumerStatefulWidget {
  const ComplaintsHomeScreen({super.key});

  @override
  ConsumerState<ComplaintsHomeScreen> createState() =>
      _ComplaintsHomeScreenState();
}

class _ComplaintsHomeScreenState extends ConsumerState<ComplaintsHomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(aftersalesListProvider.notifier).loadMore();
    }
  }

  List<AftersalesRegistrationListItem> _applySearch(
    List<AftersalesRegistrationListItem> items,
    String query,
  ) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return items;
    return items.where((item) {
      return item.complaintNo.toLowerCase().contains(q) ||
          (item.consumerName?.toLowerCase().contains(q) ?? false) ||
          (item.consumerPhone?.contains(q) ?? false) ||
          (item.serialNumber?.toLowerCase().contains(q) ?? false);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(aftersalesListProvider);
    final search = ref.watch(aftersalesSearchProvider);
    final displayItems = _applySearch(state.items, search);

    return AppScaffold(
      title: 'After Sales',
      showBottomNav: true,
      body: Column(
        children: [
          const ComplaintFilterBar(),
          Expanded(child: _body(state, displayItems)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/after-sales/register'),
        backgroundColor: kSecondaryColor,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('New After Sales'),
      ),
    );
  }

  Widget _body(
    AftersalesListState state,
    List<AftersalesRegistrationListItem> displayItems,
  ) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null && state.items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud_off_outlined,
                size: 48,
                color: kTextMuted,
              ),
              const SizedBox(height: 16),
              Text(
                state.error!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: kTextMuted),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () =>
                    ref.read(aftersalesListProvider.notifier).load(refresh: true),
                style: FilledButton.styleFrom(backgroundColor: kSecondaryColor),
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (displayItems.isEmpty) {
      return _EmptyState(hasServerData: state.items.isNotEmpty);
    }

    return RefreshIndicator(
      color: kSecondaryColor,
      onRefresh: () =>
          ref.read(aftersalesListProvider.notifier).load(refresh: true),
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 80),
        itemCount: displayItems.length + (state.hasMore ? 1 : 0),
        itemBuilder: (_, i) {
          if (i == displayItems.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final item = displayItems[i];
          return AftersalesListCard(
            item: item,
            onTap: () => context.push('/after-sales/${item.complaintNo}'),
          );
        },
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final bool hasServerData;

  const _EmptyState({this.hasServerData = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: kSecondaryLightColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.support_agent_outlined,
                size: 56,
                color: kSecondaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              hasServerData ? 'No matches' : 'No after sales yet',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: kTextDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              hasServerData
                  ? 'Try adjusting your search or filters.'
                  : 'Tap "New After Sales" to register the first after-sales request.',
              textAlign: TextAlign.center,
              style: const TextStyle(color: kTextMuted),
            ),
          ],
        ),
      ),
    );
  }
}
