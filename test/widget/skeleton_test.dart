import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/favorite_posts/widget/favorites_posts_skeleton.dart';
import 'package:polis/page/politic_profile/widget/politic_profile_skeleton.dart';
import 'package:polis/page/search_politic/widgets/search_politic_skeleton.dart';
import 'package:polis/widget/skeleton.dart';

void main() {
  group('Skeleton tests', () {
    test('assert', () {
      expect(() => Skeleton(height: null, width: 10.0), throwsAssertionError);
      expect(() => Skeleton(height: 10.0, width: null), throwsAssertionError);
    });

    test('const ', () {
      // ignore: prefer_const_constructors
      expect(FavoritesPostsSkeleton() == const FavoritesPostsSkeleton(), false);
      // ignore: prefer_const_constructors
      expect(PoliticProfileSkeleton() == const PoliticProfileSkeleton(), false);
      // ignore: prefer_const_constructors
      expect(SearchPoliticSkeleton() == const SearchPoliticSkeleton(), false);
    });
  });
}
