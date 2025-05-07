import 'package:anime_character_tierlist/src/features/auth.dart';
import 'package:anime_character_tierlist/src/features/ranking/ranking_screen.dart';
import 'package:anime_character_tierlist/src/features/storage/database.dart';
import 'package:anime_character_tierlist/src/features/storage/store.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CharacterFormDialog extends ConsumerStatefulWidget {
  const CharacterFormDialog({super.key});

  @override
  ConsumerState<CharacterFormDialog> createState() =>
      _CharacterFormDialogState();
}

class _CharacterFormDialogState extends ConsumerState<CharacterFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _id = TextEditingController(text: 0.toString());
  final TextEditingController _sortOrder = TextEditingController(
    text: 0.toString(),
  );
  final TextEditingController _rankingNumber = TextEditingController(
    text: 0.toString(),
  );
  final TextEditingController _animeId = TextEditingController(
    text: 0.toString(),
  );
  final TextEditingController _animeName = TextEditingController(text: '');
  final TextEditingController _name = TextEditingController(text: '');
  final List<String> _pictures = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text('Add New Character'),
      content: NewCharacterDialog(
        formKey: _formKey,
        rankingNumber: _rankingNumber,
        sortOrder: _sortOrder,
        id: _id,
        animeId: _animeId,
        animeName: _animeName,
        name: _name,
        pictures: _pictures,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            final isValid = _formKey.currentState!.validate();
            if (isValid) {
              final character = CharacterData(
                id: int.parse(_id.text),
                animeId: int.parse(_animeId.text),
                animeName: _animeName.text,
                name: _name.text,
                pictures: _pictures.map((e) => Uri.parse(e)).toList(),
                sortOrder: int.parse(_sortOrder.text),
              );
              await ref
                  .read(storeProvider)
                  .future
                  .rankCharacter(
                    character: character,
                    rank: int.parse(_rankingNumber.text),
                  );

              if (context.mounted) {
                Navigator.pop(context);
              }
            }
          },
          child: Text('Add Character'),
        ),
      ],
    );
  }
}

class NewCharacterDialog extends ConsumerStatefulWidget {
  const NewCharacterDialog({
    super.key,
    required this.formKey,
    required this.rankingNumber,
    required this.sortOrder,
    required this.id,
    required this.animeId,
    required this.animeName,
    required this.name,
    required this.pictures,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController rankingNumber;
  final TextEditingController sortOrder;
  final TextEditingController id;
  final TextEditingController animeId;
  final TextEditingController animeName;
  final TextEditingController name;
  final List<String> pictures;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewCharacterDialogState();
}

class _NewCharacterDialogState extends ConsumerState<NewCharacterDialog> {
  final _pictureFormKey = GlobalKey<FormState>();
  final TextEditingController _newPictureUrl = TextEditingController();

  void _addPicture() {
    final isValid = _pictureFormKey.currentState!.validate();
    if (isValid) {
      setState(() {
        widget.pictures.add(_newPictureUrl.text);
        _newPictureUrl.clear();
      });
    }
  }

  void _removePicture(int index) {
    setState(() {
      widget.pictures.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: widget.rankingNumber,
              decoration: InputDecoration(labelText: 'Ranking #'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a ranking #';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            TextFormField(
              controller: widget.sortOrder,
              decoration: InputDecoration(labelText: 'Sort #'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a sort #';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            TextFormField(
              controller: widget.id,
              decoration: InputDecoration(labelText: 'Character ID'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an ID';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            TextFormField(
              controller: widget.animeId,
              decoration: InputDecoration(labelText: 'Anime ID'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an anime ID';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            TextFormField(
              controller: widget.animeName,
              decoration: InputDecoration(labelText: 'Anime Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the anime name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: widget.name,
              decoration: InputDecoration(labelText: 'Character Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the character name';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            Text(
              'Character Pictures',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Row(
              children: [
                Expanded(
                  child: Form(
                    key: _pictureFormKey,
                    child: TextFormField(
                      controller: _newPictureUrl,
                      decoration: InputDecoration(labelText: 'Picture URL'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a picture URL';
                        }
                        final uri = Uri.tryParse(value);
                        if (uri == null || !uri.isAbsolute) {
                          return 'Please enter a valid URL';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.add), onPressed: _addPicture),
              ],
            ),
            if (widget.pictures.isNotEmpty) ...[
              SizedBox(height: 8),
              ...widget.pictures.mapIndexed(
                (index, url) => ListTile(
                  dense: true,
                  title: Text(
                    widget.pictures[index],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removePicture(index),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: RankingScreen()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => CharacterFormDialog(),
          );
        },
        tooltip: 'Add New Character Ranking',
        child: Icon(Icons.add),
      ),
    );
  }
}

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('MyAnimeList Login')),
      body: Center(
        child: authState.when(
          data: (state) {
            final credential = state.credential;
            return credential == null
                ? ElevatedButton(
                  onPressed: () async {
                    ref.read(authServiceProvider).login();
                  },
                  child: Text('Login with MyAnimeList'),
                )
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Logged in as: ${state.username}'),
                    ElevatedButton(
                      onPressed: ref.read(authServiceProvider).logout,
                      child: Text('Logout'),
                    ),
                  ],
                );
          },
          error: (err, st) => Text('Error: $err'),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
