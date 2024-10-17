import 'package:bloc/bloc.dart';
import 'package:e_com/product_model.dart';
import 'package:e_com/screens/home_screen.dart';
import 'package:e_com/services/auth_services.dart';
import 'package:get/get.dart';

part 'application_state.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit()
      : super(ApplicationState(
          authState: AuthState.unauthorized,
          products: [],
          token: "",
        ));
  void login(String email, String pass) async {
    emit(state.copyWith(authState: AuthState.loading));
    var token = await ApiServices.login(email: email, password: pass);

    if (token != null) {
      emit(state.copyWith(token: token, authState: AuthState.authorized));
      Get.to(const HomeScreen());
    } else {
      emit(state.copyWith(authState: AuthState.fail));
    }
  }

  void getPoducts() async {
    var products = await ApiServices.getProducts(state.token);
    emit(state.copyWith(products: products));
  }
}
