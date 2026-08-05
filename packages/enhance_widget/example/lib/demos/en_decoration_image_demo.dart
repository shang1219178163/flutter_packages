import 'package:enhance_widget/enhance_widget.dart';
import 'package:flutter/material.dart';

class EnDecorationImageDemo extends StatelessWidget {
  const EnDecorationImageDemo({super.key});

  static const _networkImage = NetworkImage(
    'https://picsum.photos/seed/enhance_widget/800/400',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EnDecorationImage')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'placeholder while loading',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Container(
            height: 180,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              color: Colors.grey.shade200,
              image: const EnDecorationImage(
                image: _networkImage,
                placeholder: NetworkImage(
                  'https://picsum.photos/seed/placeholder/80/40',
                ),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            child: const Text('EnDecorationImage + placeholder'),
          ),
          const SizedBox(height: 32),
          Text(
            'destinationOffset (corner badge)',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Container(
            height: 120,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              image: const EnDecorationImage(
                image: NetworkImage(
                  'https://picsum.photos/seed/badge/80/80',
                ),
                alignment: Alignment.topRight,
                destinationOffset: Offset(-12, -12),
                fit: BoxFit.none,
              ),
            ),
            alignment: Alignment.centerLeft,
            child: const Text(
              '静夜思 · 床前明月光…',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
