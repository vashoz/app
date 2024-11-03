import 'package:flutter/material.dart';
import 'package:vashoz/core/shared/extension/context.dart';

import '../../../../core/shared/dimension.dart';

class DotIndicator extends StatelessWidget {
  final int index;
  final int currentPage;
  const DotIndicator({
    super.key,
    required this.index,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.size.vertical.ten,
      width: currentPage == index ? 20 : 10,
      margin: EdgeInsets.only(right: Dimension.padding.horizontal.medium),
      decoration: BoxDecoration(
        color: currentPage == index
            ? context.theme.primaryDark
            : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
      ),
    );
  }
}
