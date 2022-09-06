part of 'auth_bloc.dart';

// @immutable

enum AuthStatus { unkown, authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus status;

  // final auth.User? authUser;

  final User? user;

  const AuthState._({
    this.status = AuthStatus.unkown,
    // this.authUser,
    this.user = User.empty,
  });

  const AuthState.unkown() : this._();

  const AuthState.authenticated({
    // required auth.User authUser,
    required User user,
  }) : this._(
          status: AuthStatus.authenticated,
          // authUser: authUser,
          user: user,
        );

  const AuthState.unauthenticated()
      : this._(
          status: AuthStatus.unauthenticated,
        );

  @override
  // TODO: implement props
  List<Object?> get props => [status, user];
}













// abstract class AuthState {}

// class Loading extends AuthState {
//   @override
//   List<Object?> get props => [];
// }

// // When the user is authenticated the state is changed to Authenticated.
// class Authenticated extends AuthState {
//   @override
//   List<Object?> get props => [];
// }

// // This is the initial state of the bloc. When the user is not authenticated the state is changed to Unauthenticated.
// class UnAuthenticated extends AuthState {
//   @override
//   List<Object?> get props => [];
// }

// // If any error occurs the state is changed to AuthError.
// class AuthError extends AuthState {
//   final String error;

//   AuthError(this.error);
//   @override
//   List<Object?> get props => [error];
// }
