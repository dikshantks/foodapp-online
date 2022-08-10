// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmp_online/classes/auth/auth_repository.dart';
import 'package:tmp_online/classes/usermodal/user_modal.dart';
import 'package:tmp_online/classes/usermodal/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepository;
  final userRepo _userRepo;
  late StreamSubscription<auth.User?> _authUsersubscription;
  late StreamSubscription<User?> _usersubscription;

  AuthBloc({
    required AuthRepo authRepository,
    required userRepo userRepository,
  })  : _authRepository = authRepository,
        _userRepo = userRepository,
        super(AuthState.unkown()) {
    on<AuthUserChanged>(_onAuthuserChanged);

    _authUsersubscription = _authRepository.User.listen((authuser) {
      print('auth user : $authuser');
      if (authuser != null) {
        _userRepo.getUser(authuser.uid).listen((user) {
          add(AuthUserChanged(authUser: authuser, user: user));
        });
      } else {
        add(AuthUserChanged(
          authUser: authuser,
        ));
      }
    });
  }

  void _onAuthuserChanged(
    AuthUserChanged event,
    Emitter<AuthState> emit,
  ) {
    event.authUser != null
        ? emit(AuthState.authenticated(
            authUser: event.authUser!, user: event.user!))
        : emit(AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _authUsersubscription.cancel();
    _usersubscription.cancel();
    return super.close();
  }
}
