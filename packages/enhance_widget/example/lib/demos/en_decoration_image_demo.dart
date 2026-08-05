import 'package:cached_network_image/cached_network_image.dart';
import 'package:enhance_widget/enhance_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/n_description_card.dart';

class EnDecorationImageDemo extends StatelessWidget {
  const EnDecorationImageDemo({super.key});

  static final _badgeImage = CachedNetworkImageProvider(
    'https://picsum.photos/seed/badge/80/80',
  );

  static const _placeholderImage = AssetImage(
    'assets/images/img_placeholder.png',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EnDecorationImage')),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const NDescriptionCard(
            comparedTo: 'DecorationImage',
            items: [
              NDescriptionItem(
                en: 'placeholder: show a fallback image while the target loads',
                zh: '新增 placeholder：目标图加载完成前显示占位图',
              ),
              NDescriptionItem(
                en: 'destinationOffset: translate paint position after alignment',
                zh: '新增 destinationOffset：在 alignment 基础上平移绘制位置',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    borderRadius: BorderRadius.circular(8),
                    image: EnDecorationImage(
                      image: CachedNetworkImageProvider(
                        'https://picsum.photos/seed/enhance_widget/800/400',
                        cacheKey: '${DateTime.now()}',
                      ),
                      placeholder: _placeholderImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'EnDecorationImage + placeholder',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'destinationOffset = Offset(-12, -12)',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  'Alignment.topRight + negative offset moves the badge further outward.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
                _buildBadgeCard(destinationOffset: const Offset(-12, -12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeCard({required Offset destinationOffset}) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(12),
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        image: EnDecorationImage(
          image: _badgeImage,
          alignment: Alignment.topRight,
          destinationOffset: destinationOffset,
          fit: BoxFit.none,
          scale: 1.5,
        ),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        '静夜思 · 床前明月光…\noffset: $destinationOffset',
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
