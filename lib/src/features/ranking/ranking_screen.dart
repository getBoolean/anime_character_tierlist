import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:anime_character_tierlist/src/features/storage/store.dart';
import 'package:anime_character_tierlist/src/features/storage/database.dart';
import 'package:anime_character_tierlist/src/features/character/character_ranking.dart';

class RankingScreen extends ConsumerWidget {
  const RankingScreen({super.key});

  Widget _buildCharacterTile(
    BuildContext context,
    CharacterData character,
    int tierRank,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
        leading:
            character.pictures.isNotEmpty
                ? CircleAvatar(
                  backgroundImage: NetworkImage(
                    character.pictures.first.toString(),
                  ),
                )
                : null,
        title: Text(character.name),
        subtitle: Text(character.animeName),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => EditRankingDialog(
                        character: character,
                        currentRank: tierRank,
                      ),
                );
              },
            ),
            const Icon(Icons.drag_handle),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(storeProvider);
    final tiersAsync = ref.watch(store.stream.tiersProvider);

    return tiersAsync.when(
      data: (tiers) {
        if (tiers.isEmpty) {
          return const Center(child: Text('No characters ranked yet'));
        }

        final dragAndDropLists =
            tiers.map((tier) {
              return DragAndDropList(
                header: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Rank ${tier.rank}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                children:
                    tier.characters.map((character) {
                      return DragAndDropItem(
                        child: _buildCharacterTile(
                          context,
                          character,
                          tier.rank,
                        ),
                      );
                    }).toList(),
              );
            }).toList();

        return DragAndDropLists(
          children: dragAndDropLists,
          onItemReorder: (
            int oldItemIndex,
            int oldListIndex,
            int newItemIndex,
            int newListIndex,
          ) async {
            final oldTier = tiers[oldListIndex];
            final newTier = tiers[newListIndex];
            final movedCharacter = oldTier.characters[oldItemIndex].copyWith(
              sortOrder: newItemIndex,
            );

            if (oldListIndex != newListIndex || oldItemIndex != newItemIndex) {
              // Character moved to a different tier
              await store.future.rankCharacter(
                character: movedCharacter,
                rank: newTier.rank,
              );
            }
          },
          onListReorder: (int oldListIndex, int newListIndex) {
            // We don't support reordering tiers themselves
            return;
          },
          listInnerDecoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          addLastItemTargetHeightToTop: true,
          lastListTargetSize: 40.0,
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
