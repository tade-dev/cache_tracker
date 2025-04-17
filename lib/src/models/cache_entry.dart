class CacheEntry {
  final String key;
  final DateTime timestamp;
  final Duration ttl;
  final bool isHit;

  CacheEntry({
    required this.key,
    required this.timestamp,
    required this.ttl,
    required this.isHit,
  });

  bool get isExpired => DateTime.now().difference(timestamp) > ttl;
  Duration get timeLeft => ttl - DateTime.now().difference(timestamp);
}