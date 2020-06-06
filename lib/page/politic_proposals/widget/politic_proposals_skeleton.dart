import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../widget/skeleton.dart';

class PoliticProposalsSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const Center(
          child: Skeleton(width: 120, height: 16),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.separated(
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
                        const Skeleton(
                          width: 280,
                          height: 60,
                          radius: 5.0,
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
