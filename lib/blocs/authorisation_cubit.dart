import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roonyx/blocs/authorisation_state.dart';
import 'package:roonyx/services/network.dart';

class AuthorisationCubit extends Cubit<AuthorisationState> {
  AuthorisationCubit() : super(AuthorisationInitialState());

  Future<void> authoriseUser(String pin) async {
    emit(AuthorisationLoading());
    Network().authoriseUser(pin).then((value) {
      if (value.authorisationStatus == 'Success') {
        emit(AuthorisationSuccess(value));
      }
      if (value.authorisationStatus == 'Failed') {
        emit(const AuthorisationFailed());
      }
    }).onError((error, stackTrace) {
      emit(const AuthorisationNetworkFailed());
    });
  }
}
