// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmp_online/classes/app/app_bloc.dart';
import 'package:tmp_online/classes/auth/auth_repository.dart';
import 'package:tmp_online/classes/usermodal/user_modal.dart';
import 'package:tmp_online/classes/usermodal/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../usermodal/user_modal.dart';
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
        super(authRepository.currentUser.isNotEmpty
            ? AuthState.authenticated(user: authRepository.currentUser)
            : const AuthState.unauthenticated()) {
    on<AuthUserChanged>(_onAuthuserChanged);

    on<AppLogoutRequest>(_onlogoutrequest);
  }

  void _onAuthuserChanged(
    AuthUserChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(event.user!.isNotEmpty
        ? AuthState.authenticated(user: event.user!)
        : const AuthState.unauthenticated());
  }

  void _onlogoutrequest(
    AppLogoutRequest event,
    Emitter<AuthState> emit,
  ) {
    unawaited(_authRepository.signout());
  }

  @override
  Future<void> close() {
    _authUsersubscription.cancel();
    _usersubscription.cancel();
    return super.close();
  }
}




    // _authUsersubscription = _authRepository.listen((authuser) {
    //   print('auth user : $authuser');
    //   if (authuser != null) {
    //     _userRepo.getUser(User.uid).listen((user) {
    //       add(UserChanged(User: authuser, user: user));
    //     });
    //   } else {
    //     add(AuthUserChanged(
    //       authUser: authuser,
    //     ));
    //   }
    // });