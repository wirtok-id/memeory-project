import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MemeCard extends StatefulWidget {
  const MemeCard({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.year,
    required this.viewCount,
    super.key,
    this.qualityScore,
    this.templateName,
    this.isTrending = false,
    this.trendingRank,
    this.sourcePlatform,
    this.isBookmarked = false,
    this.onTap,
    this.onBookmarkToggle,
  });

  final String id;
  final String title;
  final String thumbnailUrl;
  final String year;
  final int viewCount;
  final int? qualityScore;
  final String? templateName;
  final bool isTrending;
  final int? trendingRank;
  final String? sourcePlatform;
  final bool isBookmarked;
  final VoidCallback? onTap;
  final void Function(String memeId)? onBookmarkToggle;

  @override
  State<MemeCard> createState() => _MemeCardState();
}

class _MemeCardState extends State<MemeCard>
    with SingleTickerProviderStateMixin {
  late final _scaleController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 150),
  );

  late final _scale = Tween<double>(begin: 1, end: 0.97).animate(
    CurvedAnimation(parent: _scaleController, curve: Curves.easeOutCubic),
  );

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails _) => _scaleController.forward();

  void _handleTapUp(TapUpDetails _) {
    _scaleController.reverse();
    widget.onTap?.call();
  }

  void _handleTapCancel() => _scaleController.reverse();

  String _formatViewCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    }
    if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final hasBookmark = widget.onBookmarkToggle != null;

    return Semantics(
      button: true,
      label: '${widget.title}, ${widget.year}',
      child: ScaleTransition(
        scale: _scale,
        child: GestureDetector(
          onTapDown: _handleTapDown,
          onTapUp: _handleTapUp,
          onTapCancel: _handleTapCancel,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildThumbnail(colorScheme),
                _buildMetadata(colorScheme, hasBookmark),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnail(ColorScheme colorScheme) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: CachedNetworkImage(
          imageUrl: widget.thumbnailUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => ColoredBox(
            color: colorScheme.surfaceContainerHighest,
          ),
          errorWidget: (context, url, error) => ColoredBox(
            color: colorScheme.surfaceContainerHighest,
            child: Icon(
              Icons.image_not_supported_outlined,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMetadata(ColorScheme colorScheme, bool hasBookmark) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.visibility_outlined,
                size: 14,
                color: colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Text(
                _formatViewCount(widget.viewCount),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              if (widget.year.isNotEmpty) ...[
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    widget.year,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
              const Spacer(),
              if (hasBookmark)
                IconButton(
                  onPressed: () => widget.onBookmarkToggle?.call(widget.id),
                  icon: Icon(
                    widget.isBookmarked
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    size: 20,
                  ),
                  color: widget.isBookmarked
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                  style: IconButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: const Size(32, 32),
                    padding: EdgeInsets.zero,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
