import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:anime_character_tierlist/src/features/storage/store.dart';
import 'package:anime_character_tierlist/src/features/storage/database.dart';
import 'package:anime_character_tierlist/src/features/character/character_ranking.dart';

class RankingScreen extends ConsumerStatefulWidget {
  const RankingScreen({super.key});

  @override
  ConsumerState<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends ConsumerState<RankingScreen> {
  List<TierData>? _tiers;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(storeProvider);
    final tiers = ref.watch(store.stream.tiersProvider).valueOrNull ?? _tiers;
    if (tiers == null) {
      return const Center(child: Text('Loading...'));
    } else if (tiers.isEmpty) {
      return const Center(child: Text('No characters ranked yet'));
    }
    ref.listen(store.stream.tiersProvider, (prev, val) {
      val.whenData((newTiers) {
        setState(() {
          _tiers = newTiers;
        });
      });
    });

    if (tiers.isEmpty) {
      return const Center(child: Text('No characters ranked yet'));
    }

    final dragAndDropLists =
        tiers.map((tier) {
          return DragAndDropList(
            canDrag: false,
            header: Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0),
              child: Text(
                'Rank ${tier.rank}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            children:
                tier.characters.map((character) {
                  return DragAndDropItem(
                    key: ValueKey(character.id),
                    child: CharacterTileWidget(
                      character: character,
                      tierRank: tier.rank,
                    ),
                  );
                }).toList(),
          );
        }).toList();

    return Container(
      color: Colors.transparent,
      child: DragAndDropLists(
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
          if (oldListIndex == newListIndex) {
            oldTier.characters.removeAt(oldItemIndex);
            oldTier.characters.insert(newItemIndex, movedCharacter);
            setState(() {
              _tiers = tiers;
            });
          } else {
            oldTier.characters.removeAt(oldItemIndex);
            newTier.characters.insert(newItemIndex, movedCharacter);
            setState(() {
              _tiers = tiers;
            });
            await store.future.rankCharacters(
              characters:
                  oldTier.characters
                      .mapIndexed((i, c) => c.copyWith(sortOrder: i))
                      .toList(),
              rank: oldTier.rank,
            );
          }

          await store.future.rankCharacters(
            characters:
                newTier.characters
                    .mapIndexed((i, c) => c.copyWith(sortOrder: i))
                    .toList(),
            rank: newTier.rank,
          );
        },
        onListReorder: (int oldListIndex, int newListIndex) {
          // We don't support reordering tiers themselves
          return;
        },
        listInnerDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        lastItemTargetHeight: 48.0,
        itemDragHandle: DragHandle(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 24.0),
            child: Icon(Icons.drag_handle),
          ),
        ),
      ),
    );
  }
}

class CharacterTileWidget extends ConsumerWidget {
  const CharacterTileWidget({
    super.key,
    required this.character,
    required this.tierRank,
  });

  final CharacterData character;
  final int tierRank;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
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
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                // ask for confirmation
                final confirmed =
                    await showDialog<bool>(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: const Text('Delete Character'),
                            content: const Text(
                              'Are you sure you want to delete this character?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                    ) ??
                    false;
                if (confirmed) {
                  ref.read(storeProvider).future.deleteCharacter(character.id);
                }
              },
            ),
            SizedBox(width: 16.0),
          ],
        ),
      ),
    );
  }
}
