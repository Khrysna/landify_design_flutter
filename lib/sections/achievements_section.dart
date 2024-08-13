import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:landify_design_flutter/design_systems/components/label_with_description.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/gen/assets.gen.dart';
import 'package:landify_design_flutter/gen/colors.gen.dart';
import 'package:landify_design_flutter/utils/breakpoint.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;

    Widget content = const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LeftSection(),
        SizedBox(height: 48),
        _RightSection(),
      ],
    );

    if (breakpoint.responsiveFromLaptop) {
      content = const Row(
        children: [
          Expanded(child: _LeftSection()),
          SizedBox(width: 32),
          Expanded(child: _RightSection()),
        ],
      );
    }

    return MaxContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: content,
      ),
    );
  }
}

class _LeftSection extends StatelessWidget {
  const _LeftSection();

  @override
  Widget build(BuildContext context) {
    return const LabelWithDescription(
      title: 'Our 18 years of achievements',
      subtitle: 'With our super powers we have reached this',
    );
  }
}

class _RightSection extends StatelessWidget {
  const _RightSection();

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;

    int rowSizes = 4;
    int columnSizes = 1;

    if (breakpoint.responsiveFromTablet) {
      rowSizes = 2;
      columnSizes = 2;
    }

    return LayoutGrid(
      rowSizes: List.generate(rowSizes, (_) => auto),
      columnSizes: List.generate(columnSizes, (_) => auto),
      rowGap: 40,
      columnGap: 32,
      children: const [
        _AchievementItem(
          icon: Assets.robustWorkflow,
          title: '10,000+',
          subtitle: 'Downloads per day',
        ),
        _AchievementItem(
          icon: Assets.multipleLayouts,
          title: '2 Million',
          subtitle: 'Users',
        ),
        _AchievementItem(
          icon: Assets.betterComponents,
          title: '500+',
          subtitle: 'Clients',
        ),
        _AchievementItem(
          icon: Assets.countries,
          title: '140',
          subtitle: 'Countries',
        ),
      ],
    );
  }
}

class _AchievementItem extends StatelessWidget {
  const _AchievementItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final AssetGenImage icon;

  final String title;

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;

    TextStyle titleStyle = AppTextStyles.displayExtraSmallBold;
    TextStyle subtitleStyle = AppTextStyles.bodySmallRegular;

    if (breakpoint.responsiveFromLaptop) {
      titleStyle = AppTextStyles.displayMediumBold;
      subtitleStyle = AppTextStyles.bodyMediumRegular;
    } else if (breakpoint.responsiveFromTablet) {
      titleStyle = AppTextStyles.displaySmallBold;
      subtitleStyle = AppTextStyles.bodyMediumRegular;
    }

    return Row(
      children: [
        icon.image(height: 32),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: titleStyle.copyWith(color: ColorName.neutral900)),
              Text(subtitle, style: subtitleStyle.copyWith(color: ColorName.neutral900)),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomGridDelegate extends SliverGridDelegate {
  CustomGridDelegate({required this.dimension});

  final double dimension;

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    int count = constraints.crossAxisExtent ~/ dimension;
    if (count < 1) {
      count = 1;
    }
    final double squareDimension = constraints.crossAxisExtent / count;
    return CustomGridLayout(
      crossAxisCount: 2,
      fullRowPeriod: 2,
      dimension: squareDimension,
    );
  }

  @override
  bool shouldRelayout(CustomGridDelegate oldDelegate) {
    return dimension != oldDelegate.dimension;
  }
}

class CustomGridLayout extends SliverGridLayout {
  const CustomGridLayout({
    required this.crossAxisCount,
    required this.dimension,
    required this.fullRowPeriod,
  })  : assert(crossAxisCount > 0),
        assert(fullRowPeriod > 1),
        loopLength = crossAxisCount * (fullRowPeriod - 1) + 1,
        loopHeight = fullRowPeriod * dimension;

  final int crossAxisCount;
  final double dimension;
  final int fullRowPeriod;

  // Computed values.
  final int loopLength;
  final double loopHeight;

  @override
  double computeMaxScrollOffset(int childCount) {
    // This returns the scroll offset of the end side of the childCount'th child.
    // In the case of this example, this method is not used, since the grid is
    // infinite. However, if one set an itemCount on the GridView above, this
    // function would be used to determine how far to allow the user to scroll.
    if (childCount == 0 || dimension == 0) {
      return 0;
    }
    return (childCount ~/ loopLength) * loopHeight +
        ((childCount % loopLength) ~/ crossAxisCount) * dimension;
  }

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    // This returns the position of the index'th tile.
    //
    // The SliverGridGeometry object returned from this method has four
    // properties. For a grid that scrolls down, as in this example, the four
    // properties are equivalent to x,y,width,height. However, since the
    // GridView is direction agnostic, the names used for SliverGridGeometry are
    // also direction-agnostic.
    //
    // Try changing the scrollDirection and reverse properties on the GridView
    // to see how this algorithm works in any direction (and why, therefore, the
    // names are direction-agnostic).
    final int loop = index ~/ loopLength;
    final int loopIndex = index % loopLength;
    if (loopIndex == loopLength - 1) {
      // Full width case.
      return SliverGridGeometry(
        scrollOffset: (loop + 1) * loopHeight - dimension, // "y"
        crossAxisOffset: 0, // "x"
        mainAxisExtent: dimension, // "height"
        crossAxisExtent: crossAxisCount * dimension, // "width"
      );
    }
    // Square case.
    final int rowIndex = loopIndex ~/ crossAxisCount;
    final int columnIndex = loopIndex % crossAxisCount;
    return SliverGridGeometry(
      scrollOffset: (loop * loopHeight) + (rowIndex * dimension), // "y"
      crossAxisOffset: columnIndex * dimension, // "x"
      mainAxisExtent: dimension, // "height"
      crossAxisExtent: dimension, // "width"
    );
  }

  @override
  int getMinChildIndexForScrollOffset(double scrollOffset) {
    // This returns the first index that is visible for a given scrollOffset.
    //
    // The GridView only asks for the geometry of children that are visible
    // between the scroll offset passed to getMinChildIndexForScrollOffset and
    // the scroll offset passed to getMaxChildIndexForScrollOffset.
    //
    // It is the responsibility of the SliverGridLayout to ensure that
    // getGeometryForChildIndex is consistent with getMinChildIndexForScrollOffset
    // and getMaxChildIndexForScrollOffset.
    //
    // Not every child between the minimum child index and the maximum child
    // index need be visible (some may have scroll offsets that are outside the
    // view; this happens commonly when the grid view places tiles out of
    // order). However, doing this means the grid view is less efficient, as it
    // will do work for children that are not visible. It is preferred that the
    // children are returned in the order that they are laid out.
    final int rows = scrollOffset ~/ dimension;
    final int loops = rows ~/ fullRowPeriod;
    final int extra = rows % fullRowPeriod;
    return loops * loopLength + extra * crossAxisCount;
  }

  @override
  int getMaxChildIndexForScrollOffset(double scrollOffset) {
    // (See commentary above.)
    final int rows = scrollOffset ~/ dimension;
    final int loops = rows ~/ fullRowPeriod;
    final int extra = rows % fullRowPeriod;
    final int count = loops * loopLength + extra * crossAxisCount;
    if (extra == fullRowPeriod - 1) {
      return count;
    }
    return count + crossAxisCount - 1;
  }
}
