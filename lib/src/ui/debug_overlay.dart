import 'package:flutter/material.dart';
import '../tracker_core.dart';

class CacheTrackerOverlay extends StatelessWidget {
  final CacheTrackerCore tracker;

  const CacheTrackerOverlay({super.key, required this.tracker});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: tracker,
      builder: (context, _, __) {
        return DraggableScrollableSheet(
          initialChildSize: 0.2,
          minChildSize: 0.1,
          maxChildSize: 0.8,
          builder: (context, scrollController) {
            return Container(
              color: Colors.black.withOpacity(0.9),
              child: ListView.builder(
                controller: scrollController,
                itemCount: tracker.entries.length,
                itemBuilder: (context, index) {
                  final entry = tracker.entries[index];
                  return ListTile(
                    title: Text(entry.key, style: const TextStyle(color: Colors.white)),
                    subtitle: Text(
                      entry.isHit
                          ? '✅ HIT — expires in ${entry.timeLeft.inSeconds}s'
                          : '❌ MISS',
                      style: TextStyle(
                        color: entry.isHit ? Colors.greenAccent : Colors.redAccent,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}