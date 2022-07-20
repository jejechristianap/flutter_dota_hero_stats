class HomePageState {
  final int count;
  final bool isMinusEnabled;
  final bool isPlusEnabled;

  HomePageState({
    this.isMinusEnabled = false,
    this.isPlusEnabled = true,
    this.count = 0,
  });

  HomePageState copyWith({
    bool? isMinusEnabled,
    bool? isPlusEnabled,
    int? count,
  }) {
    return HomePageState(
      isMinusEnabled: isMinusEnabled ?? this.isMinusEnabled,
      isPlusEnabled: isPlusEnabled ?? this.isPlusEnabled,
      count: count ?? this.count,
    );
  }
}
