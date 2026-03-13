import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern_task/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_intern_task/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_intern_task/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;

  AuthBloc(this.loginUsecase) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final result = await loginUsecase(event.email, event.password);

      result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (user) => emit(AuthSuccess()),
      );
    } catch (e) {
      emit(AuthFailure("Unexpected error occurred"));
    }
  }
}
