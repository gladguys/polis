import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../widget/skeleton.dart';

class PoliticProfileSkeleton extends StatelessWidget {
  const PoliticProfileSkeleton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 16),
        Column(
          children: <Widget>[
            const Skeleton(width: 120, height: 120),
            const SizedBox(height: 8),
            const Skeleton(width: 140, height: 18),
            const SizedBox(height: 4),
            const Skeleton(width: 60, height: 14),
            const SizedBox(height: 4),
            const Skeleton(width: 100, height: 12),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Skeleton(width: 130, height: 30),
                const SizedBox(width: 8),
                const Skeleton(width: 130, height: 30),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Skeleton(width: 80, height: 40),
                const SizedBox(width: 12),
                const Skeleton(width: 80, height: 40),
              ],
            ),
            const SizedBox(height: 8),
            const Skeleton(width: 120, height: 40),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
