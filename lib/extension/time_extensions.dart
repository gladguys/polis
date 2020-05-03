extension TimeExtension on int {
  Duration get second {
    return const Duration(seconds: 1);
  }

  Duration get seconds {
    return Duration(seconds: this);
  }

  Duration get milliseconds {
    return Duration(milliseconds: this);
  }
}
