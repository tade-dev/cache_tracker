import 'package:flutter/foundation.dart';
import 'models/cache_entry.dart';

class CacheTrackerCore extends ChangeNotifier {
  final Map<String, CacheEntry> _cache = {};

  void trackHit(String key, {Duration ttl = const Duration(minutes: 5)}) {
    _cache[key] = CacheEntry(
      key: key,
      timestamp: DateTime.now(),
      ttl: ttl,
      isHit: true,
    );
    notifyListeners();
  }

  void trackMiss(String key) {
    _cache[key] = CacheEntry(
      key: key,
      timestamp: DateTime.now(),
      ttl: Duration.zero,
      isHit: false,
    );
    notifyListeners();
  }

  List<CacheEntry> get entries => _cache.values.toList();

  void clear() {
    _cache.clear();
    notifyListeners();
  }
}