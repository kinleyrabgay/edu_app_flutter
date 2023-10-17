part of 'on_board_cubit.dart';

@immutable
abstract class OnBoardState extends Equatable {
  const OnBoardState();

  @override
  List<Object?> get props => [];
}

// Initial
class OnBoardInitial extends OnBoardState {
  const OnBoardInitial();
}

// Caching
class CachingFirstTimer extends OnBoardState {
  const CachingFirstTimer();
}

// Check FirstTimer
class CheckingIfUserIsFirstTimer extends OnBoardState {
  const CheckingIfUserIsFirstTimer();
}

// User Cached
class UserCached extends OnBoardState {
  const UserCached();
}

// Status
class OnBoardStatus extends OnBoardState {
  const OnBoardStatus({required this.isFirstTime});
  final bool isFirstTime;

  @override
  List<bool> get props => [isFirstTime];
}

// Error
class OnBoardError extends OnBoardState {
  const OnBoardError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
