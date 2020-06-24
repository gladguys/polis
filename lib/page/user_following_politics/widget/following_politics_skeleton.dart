import 'package:flutter/material.dart';

import '../../../widget/general/skeleton.dart';

class FollowingPoliticsSkeleton extends StatelessWidget {
  const FollowingPoliticsSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 4),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: 15,
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
                  const Skeleton(width: 140, height: 14),
                  const SizedBox(height: 4),
                  const Skeleton(width: 100, height: 14),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            const Skeleton(width: 110, height: 22),
            const SizedBox(width: 8),
          ],
        );
      },
    );
  }
}
