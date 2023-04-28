import 'package:equatable/equatable.dart';
import 'package:roonyx/models/mock_response_model.dart';

abstract class AuthorisationState extends Equatable {
  const AuthorisationState();
}

class AuthorisationInitialState extends AuthorisationState {
  @override
  List<Object?> get props => [];
}

class AuthorisationLoading extends AuthorisationState {
  @override
  List<Object?> get props => [];
}

class AuthorisationSuccess extends AuthorisationState {
  const AuthorisationSuccess(this.data);
  final MockResponseModel data;
  @override
  List<Object?> get props => [data];
}

class AuthorisationFailed extends AuthorisationState {
  const AuthorisationFailed();
  @override
  List<Object?> get props => [];
}

class AuthorisationNetworkFailed extends AuthorisationState {
  const AuthorisationNetworkFailed();
  @override
  List<Object?> get props => [];
}
