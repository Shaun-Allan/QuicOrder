import '../models/user_model.dart';

class CoreState {
  final UserModel? user;

  const CoreState({
    this.user,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CoreState &&
              runtimeType == other.runtimeType &&
              user == other.user;

  @override
  int get hashCode => user.hashCode;

  CoreState copy({
    UserModel? user,
  }) =>
      CoreState(
        user: user ?? this.user,
      );
}