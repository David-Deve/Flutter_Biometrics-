import 'package:local_auth/local_auth.dart';

class Auth {
  static final _auth = LocalAuthentication();
  static Future<bool> canAuthenticated() async {
    bool canCheckBiometrics = await _auth.canCheckBiometrics;
    bool isDeviceSupported = await _auth.isDeviceSupported();
    return canCheckBiometrics || isDeviceSupported;
  }

  static Future<bool> authentication() async{
    try{
      if(!await canAuthenticated()){
        return false;
      }
      return await _auth.authenticate(localizedReason: "check");
    }catch(e){
      print(e);
      return false;
    }
  }

}