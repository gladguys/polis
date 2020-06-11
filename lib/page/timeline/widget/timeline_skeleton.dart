import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../widget/skeleton.dart';

class TimelineSkeleton extends StatelessWidget {
  const TimelineSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 8),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: 10,
      itemBuilder: (context, i) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  const Skeleton(width: 240, height: 24),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      const Skeleton(width: 20, height: 20),
                      const SizedBox(width: 16),
                      const Skeleton(width: 20, height: 20),
                      const SizedBox(width: 16),
                      const Skeleton(width: 20, height: 20),
                      const Spacer(flex: 1),
                      const Skeleton(width: 20, height: 20),
                      const SizedBox(width: 8),
                      const Skeleton(width: 20, height: 20),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
