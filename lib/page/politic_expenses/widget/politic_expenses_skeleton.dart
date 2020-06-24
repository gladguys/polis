import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../widget/general/skeleton.dart';

class PoliticExpensesSkeleton extends StatelessWidget {
  const PoliticExpensesSkeleton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const Center(
          child: Skeleton(width: 160, height: 16),
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
                        const Skeleton(width: 240, height: 36),
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
