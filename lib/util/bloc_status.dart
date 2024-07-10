enum CCBlocStatus {
  initial,
  success,
  failure,
  noSearchResults,
  inProgress,
  canceled;

  bool get isInitial => this == initial;
  bool get isInProgress => this == inProgress;
  bool get isSuccess => this == success;
  bool get isFailure => this == failure;
  bool get isCanceled => this == canceled;
  bool get isNoSearchResults => this == noSearchResults;
  bool get isInProgressOrSuccess => isInProgress || isSuccess;
}
