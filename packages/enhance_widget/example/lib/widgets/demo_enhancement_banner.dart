import 'package:flutter/material.dart';

/// Display language for demo enhancement copy.
enum DemoLanguage {
  en,
  zh,
}

/// One enhancement bullet in English and Chinese.
class DemoEnhancementItem {
  const DemoEnhancementItem({
    required this.en,
    required this.zh,
  });

  final String en;
  final String zh;

  String text(DemoLanguage language) {
    return language == DemoLanguage.zh ? zh : en;
  }
}

/// Top-of-page banner describing enhancements vs an official Flutter widget.
///
/// Supports English / Chinese; defaults to [DemoLanguage.en].
/// Tap the language chip to toggle.
class DemoEnhancementBanner extends StatefulWidget {
  const DemoEnhancementBanner({
    super.key,
    required this.comparedTo,
    required this.items,
    this.initialLanguage = DemoLanguage.en,
  });

  /// Official widget this enhances, e.g. `BottomNavigationBar`.
  final String comparedTo;

  /// Bilingual enhancement bullets.
  final List<DemoEnhancementItem> items;

  /// Defaults to English.
  final DemoLanguage initialLanguage;

  @override
  State<DemoEnhancementBanner> createState() => _DemoEnhancementBannerState();
}

class _DemoEnhancementBannerState extends State<DemoEnhancementBanner> {
  late DemoLanguage _language = widget.initialLanguage;

  String get _title {
    return switch (_language) {
      DemoLanguage.en => 'Enhancements over ${widget.comparedTo}',
      DemoLanguage.zh => '相对 ${widget.comparedTo} 的增强',
    };
  }

  void _toggleLanguage() {
    setState(() {
      _language =
          _language == DemoLanguage.en ? DemoLanguage.zh : DemoLanguage.en;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Material(
      color: primary.withValues(alpha: 0.08),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.auto_awesome, size: 18, color: primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                _LanguageToggle(
                  language: _language,
                  onPressed: _toggleLanguage,
                ),
              ],
            ),
            const SizedBox(height: 8),
            for (final item in widget.items)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('•  ', style: TextStyle(color: primary)),
                    Expanded(
                      child: Text(
                        item.text(_language),
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _LanguageToggle extends StatelessWidget {
  const _LanguageToggle({
    required this.language,
    required this.onPressed,
  });

  final DemoLanguage language;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final label = language == DemoLanguage.en ? 'EN' : '中文';

    return ActionChip(
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      avatar: Icon(Icons.translate, size: 16, color: primary),
      label: Text(
        label,
        style: TextStyle(
          color: primary,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
      side: BorderSide(color: primary.withValues(alpha: 0.4)),
      backgroundColor: Colors.transparent,
      onPressed: onPressed,
    );
  }
}
