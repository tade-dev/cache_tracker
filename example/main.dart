import 'package:flutter/material.dart';
import 'package:cache_tracker/cache_tracker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cache Tracker Demo',
      theme: ThemeData.dark(),
      home: const DemoScreen(),
    );
  }
}

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});
  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  final CacheTrackerCore tracker = CacheTrackerCore();

  void simulateCall(String key, bool hit) {
    if (hit) {
      tracker.trackHit(key, ttl: const Duration(seconds: 10));
    } else {
      tracker.trackMiss(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: const Text('Cache Tracker Example')),
          body: Column(
            children: [
              ElevatedButton(
                onPressed: () => simulateCall("user_profile", true),
                child: const Text("Simulate HIT"),
              ),
              ElevatedButton(
                onPressed: () => simulateCall("dashboard_stats", false),
                child: const Text("Simulate MISS"),
              ),
              ElevatedButton(
                onPressed: () => tracker.clear(),
                child: const Text("Clear Cache"),
              ),
            ],
          ),
        ),
        CacheTrackerOverlay(tracker: tracker),
      ],
    );
  }
}