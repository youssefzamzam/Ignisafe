import 'package:bloc/bloc.dart';
import 'package:ignisafe/auth/data/repo/auth_repo.dart';
import 'package:ignisafe/auth/manager/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(AuthInitial());

  void signIn(String id, String name) async {
    emit(AuthLoading());
    try {
      final token = await _authRepository.login(id: id, name: name);
      emit(AuthSuccess(token: token));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
