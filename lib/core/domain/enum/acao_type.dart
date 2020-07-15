enum AcaoType { follow, unfollow, like, unlike }

bool isActionFollowUnfollow(AcaoType acaoType) {
  switch (acaoType) {
    case AcaoType.follow:
    case AcaoType.unfollow:
      return true;
    case AcaoType.like:
    case AcaoType.unlike:
      return false;
  }
  return false;
}

bool isActionLikeUnlike(AcaoType acaoType) {
  switch (acaoType) {
    case AcaoType.follow:
    case AcaoType.unfollow:
      return false;
    case AcaoType.like:
    case AcaoType.unlike:
      return true;
  }
  return false;
}
