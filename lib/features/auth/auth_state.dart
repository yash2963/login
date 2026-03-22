class AuthState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  AuthState(
      {this.isSuccess = false, this.errorMessage, this.isLoading = false});
}
