// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'application_cubit.dart';

class ApplicationState {
  final AuthState authState;
  final List<ProductModel> products;
  final String token;
  ApplicationState({
    required this.authState,
    required this.products,
    required this.token,
  });

  ApplicationState copyWith({
    AuthState? authState,
    List<ProductModel>? products,
    String? token,
  }) {
    return ApplicationState(
      authState: authState ?? this.authState,
      products: products ?? this.products,
      token: token ?? this.token,
    );
  }
}

enum AuthState { unauthorized, authorized, fail, loading }
