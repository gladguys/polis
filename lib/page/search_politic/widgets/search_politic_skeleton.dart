import 'package:flutter/material.dart';

import '../../../widget/skeleton.dart';

class SearchPoliticSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 32),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: 6,
      itemBuilder: (_, i) {
        return Row(
          children: <Widget>[
            const SizedBox(width: 8),
            const Skeleton(width: 48, height: 48),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 4),
                  const Skeleton(width: 180, height: 14),
                  const SizedBox(height: 4),
                  const Skeleton(width: 80, height: 14),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            const Skeleton(width: 80, height: 24),
            const SizedBox(width: 8),
          ],
        );
      },
    );
  }
}
