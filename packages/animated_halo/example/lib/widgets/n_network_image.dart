import 'package:flutter/material.dart';

/// 网络图（精简版）：用 [Image.network] 替代 [ExtendedImage]，可传 [url] 与 [fit]。
///
/// 非 http 地址或加载失败时显示 [placeholder]。
class NNetworkImage extends StatelessWidget {
  const NNetworkImage({
    super.key,
    this.title,
    required this.url,
    this.placeholder,
    this.fit = BoxFit.fill,
    this.width,
    this.height,
    this.radius = 8,
  });

  final String? title;

  final String url;

  /// 占位图；缺省用灰色占位色块。
  final ImageProvider? placeholder;

  final BoxFit? fit;

  final double? width;

  final double? height;

  final double radius;

  @override
  Widget build(BuildContext context) {
    final isUrlError = !url.startsWith('http');
    if (isUrlError) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: buildPlaceholder(),
      );
    }
    final borderRadius = BorderRadius.circular(radius);
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: fit,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: frame == null ? buildPlaceholder() : child,
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return buildPlaceholder();
        },
        errorBuilder: (context, error, stackTrace) {
          return buildPlaceholder();
        },
      ),
    );
  }

  Widget buildPlaceholder() {
    if (placeholder != null) {
      return Image(
        image: placeholder!,
        width: width,
        height: height,
        fit: fit,
      );
    }
    return ColoredBox(
      color: Colors.black.withValues(alpha: 0.12),
      child: SizedBox(
        width: width,
        height: height,
        child: const Center(
          child: Icon(Icons.broken_image_outlined, color: Colors.black26),
        ),
      ),
    );
  }
}
