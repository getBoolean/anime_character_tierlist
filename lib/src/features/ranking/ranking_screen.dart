import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:anime_character_tierlist/src/features/storage/store.dart';

class RankingScreen extends ConsumerWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(storeProvider);
    final tiersAsync = ref.watch(store.stream.tiersProvider);

    return tiersAsync.when(
      data: (tiers) {
        if (tiers.isEmpty) {
          return const Center(child: Text('No characters ranked yet'));
        }

        // Create a flat list of characters with their tier information
        final allCharacters =
            tiers.expand((tier) {
              return tier.characters.map((character) {
                return (tier: tier, character: character);
              });
            }).toList();

        return ReorderableListView.builder(
          itemCount: allCharacters.length,
          itemBuilder: (context, index) {
            final item = allCharacters[index];
            final prevItem = index > 0 ? allCharacters[index - 1] : null;
            final showTierHeader = prevItem?.tier.rank != item.tier.rank;

            return Column(
              key: ValueKey(item.character.id),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showTierHeader)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Tier ${item.tier.rank}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                  ),
                Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: ListTile(
                    leading:
                        item.character.pictures.isNotEmpty
                            ? CircleAvatar(
                              backgroundImage: NetworkImage(
                                item.character.pictures.first.toString(),
                              ),
                            )
                            : null,
                    title: Text(item.character.name),
                    subtitle: Text(item.character.animeName),
                    trailing: const Icon(Icons.drag_handle),
                  ),
                ),
              ],
            );
          },
          onReorder: (oldIndex, newIndex) {
            // Adjust the newIndex if moving down to account for the removal of the item
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }

            final movedItem = allCharacters[oldIndex];
            final targetIndex = newIndex.clamp(0, allCharacters.length - 1);
            final targetTier = allCharacters[targetIndex].tier;

            // Only update if the tier changed
            if (movedItem.tier.rank != targetTier.rank) {
              store.future.rankCharacter(
                character: movedItem.character,
                rank: targetTier.rank,
              );
            }
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
