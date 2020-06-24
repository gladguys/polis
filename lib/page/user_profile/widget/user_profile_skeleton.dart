import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../widget/general/skeleton.dart';

class UserProfileSkeleton extends StatelessWidget {
  const UserProfileSkeleton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Skeleton(width: 90, height: 30),
            const SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 4),
        Column(
          children: <Widget>[
            const Skeleton(width: 120, height: 120),
            const SizedBox(height: 8),
            const Skeleton(width: 100, height: 18),
            const SizedBox(height: 8),
            const Skeleton(width: 160, height: 12),
            const SizedBox(height: 16),
            const Skeleton(width: 130, height: 30),
            const SizedBox(height: 16),
            const Skeleton(width: 60, height: 40),
          ],
        ),
        const SizedBox(height: 48),
        Expanded(
          child: Column(
            children: <Widget>[
              const Skeleton(width: 140, height: 18),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 8),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(width: 8),
                        const Skeleton(width: 48, height: 48),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(height: 4),
                              const Skeleton(width: 400, height: 14),
                              const SizedBox(height: 4),
                              const Skeleton(width: 400, height: 14),
                              const SizedBox(height: 4),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
