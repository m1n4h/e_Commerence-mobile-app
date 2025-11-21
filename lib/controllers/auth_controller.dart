import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController{
  final _storage = GetStorage();
  final RxBool _isFirstTime = true.obs;
  final RxBool _isloggedIn = false.obs;
  // Getters
  bool get isFirstTime => _isFirstTime.value;
  bool get isloggedIn=> _isloggedIn.value;

  @override
 void onInit(){
  super.onInit();
  _loadInitialState();
 }

  void _loadInitialState(){
    _isFirstTime.value = _storage.read('isfirstTime')?? true;
    _isloggedIn.value = _storage.read('isloggedIn')?? false;
  }

  void setfirstTime(){
    _isFirstTime.value = false;
    _storage.write('isfirsrTime', false);
  }
  void login(){
    _isloggedIn.value = true;
    _storage.write('islogged', true);
  }
  void logout(){
    _isloggedIn.value = true;
    _storage.write('islogged', false);
  }
  
}