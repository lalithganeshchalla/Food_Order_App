import 'package:flutter/material.dart';
import '../model/otp_model.dart';

class OTPViewModel extends ChangeNotifier {
  final OTPModel _otpModel = OTPModel();
  bool isVerifying = false;
  int resendTimer = 125;
  String get otpCode => _otpModel.otpCode;

  void updateOtp(String value) {
    _otpModel.otpCode = value;
    notifyListeners();
  }

  bool validateOtp() {
    return _otpModel.otpCode.length == 4;
  }

  Future<bool> verifyOtp() async {
    isVerifying = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));
    isVerifying = false;

    bool result = _otpModel.otpCode == "1234";
    notifyListeners();
    return result;
  }

  void resetOtp() {
    _otpModel.otpCode = '';
    notifyListeners();
  }
}
