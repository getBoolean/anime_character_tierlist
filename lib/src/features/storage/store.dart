import 'package:hooks_riverpod/hooks_riverpod.dart';

class Store {
  // TODO: save ranking process to disk

  // rank character a > character b
  // implicit character tiers (rank character a == character b)
  // how to store this?

  // favorite characters per anime

  // save each tier as list of character ids, order matters
}

final storeProvider = Provider<Store>((ref) {
  return Store();
});
