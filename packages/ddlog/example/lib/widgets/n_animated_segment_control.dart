import 'package:flutter/material.dart';

class AnimatedSegmentItem<T> {
  const AnimatedSegmentItem({
    required this.value,
    required this.color,
    required this.icon,
    required this.label,
  });

  final T value;
  final Color color;
  final IconData icon;
  final String label;
}

class NAnimatedSegmentControl<T> extends StatelessWidget {
  const NAnimatedSegmentControl({
    super.key,
    required this.items,
    required this.selected,
    required this.onChanged,
    this.duration = const Duration(milliseconds: 280),
    this.curve = Curves.easeOutCubic,
    this.height = 64,
  });

  final List<AnimatedSegmentItem<T>> items;
  final T selected;
  final ValueChanged<T> onChanged;
  final Duration duration;
  final Curve curve;
  final double height;

  @override
  Widget build(BuildContext context) {
    assert(items.isNotEmpty, 'NAnimatedSegmentControl requires at least one item.');

    final index = items.indexWhere((item) => item.value == selected);
    final selectedIndex = index >= 0 ? index : 0;
    final selectedItem = items[selectedIndex];

    return Container(
      height: height,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = constraints.maxWidth / items.length;

          return Stack(
            children: [
              AnimatedPositioned(
                duration: duration,
                curve: curve,
                left: selectedIndex * itemWidth,
                top: 0,
                bottom: 0,
                width: itemWidth,
                child: TweenAnimationBuilder<Color?>(
                  tween: ColorTween(end: selectedItem.color),
                  duration: duration,
                  curve: curve,
                  builder: (context, color, child) {
                    final c = color ?? selectedItem.color;
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: c,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: c.withValues(alpha: 0.32),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: child,
                    );
                  },
                  child: const SizedBox.expand(),
                ),
              ),
              Row(
                children: [
                  for (final item in items)
                    Expanded(
                      child: _AnimatedSegment(
                        item: item,
                        selected: item.value == selected,
                        duration: duration,
                        curve: curve,
                        onTap: () => onChanged(item.value),
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _AnimatedSegment<T> extends StatelessWidget {
  const _AnimatedSegment({
    required this.item,
    required this.selected,
    required this.duration,
    required this.curve,
    required this.onTap,
  });

  final AnimatedSegmentItem<T> item;
  final bool selected;
  final Duration duration;
  final Curve curve;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: TweenAnimationBuilder<Color?>(
        tween: ColorTween(
          end: selected ? Colors.white : item.color.withValues(alpha: 0.85),
        ),
        duration: duration,
        curve: curve,
        builder: (context, color, _) {
          final c = color ?? (selected ? Colors.white : item.color);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 20, color: c),
              const SizedBox(height: 4),
              Text(
                item.label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                  color: c,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
