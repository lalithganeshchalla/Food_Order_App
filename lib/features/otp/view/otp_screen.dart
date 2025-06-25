import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../view_model/otp_viewmodel.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _remainingSeconds = 125;
  Timer? _timer;

  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }
  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        timer.cancel();
      }
    });
  }
  String _formatTime(int s) =>
      '${(s ~/ 60).toString().padLeft(2, '0')}:${(s % 60).toString().padLeft(2, '0')} mins';
  @override
  void dispose() {
    _timer?.cancel();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }
  void _syncOtpToViewModel(OTPViewModel vm) {
    vm.updateOtp(_controllers.map((c) => c.text).join());
  }
  void _showColorfulPopup(BuildContext context, bool success) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: success
                  ? [Color(0xFFE8F5E9), Color(0xFF43A047)] // green success
                  : [Color(0xFFFFEBEE), Color(0xFFE53935)], // red error
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                success ? Icons.check_circle : Icons.error,
                size: 60,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                success ? 'OTP Verified!' : 'Invalid OTP',
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                success
                    ? 'successfully.'
                    : 'Please try again.',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: success ? Colors.green : Colors.red,
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OTPViewModel(),
      child: Scaffold(
        body: Consumer<OTPViewModel>(
          builder: (context, vm, _) {
            return Stack(
              children: [
                Positioned(
                  top: -120,
                  left: -120,
                  child: Container(
                    height: 740,
                    width: 700,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFF3D00),
                    ),
                  ),
                ),
                Positioned(
                  top: -100,
                  left: -100,
                  child: Container(
                    height: 500,
                    width: 500,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(127, 255, 110, 97),
                    ),
                  ),
                ),
                Positioned(
                  top: -80,
                  left: -80,
                  child: Container(
                    height: 400,
                    width: 400,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(136, 255, 177, 153),
                    ),
                  ),
                ),
                SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'OTP \nVerification',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Enter the OTP sent to your mobile number\nand email ID.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Container(
                            padding: const EdgeInsets.only(top: 40, bottom: 300, left: 20, right: 40),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: List.generate(4, (index) {
                                    return SizedBox(
                                      width: 50,
                                      child: Focus(
                                        onKey: (node, event) {
                                          if (event is RawKeyDownEvent &&
                                              event.logicalKey == LogicalKeyboardKey.backspace &&
                                              _controllers[index].text.isEmpty &&
                                              index > 0) {
                                            FocusScope.of(context)
                                                .requestFocus(_focusNodes[index - 1]);
                                          }
                                          return KeyEventResult.ignored;
                                        },
                                        child: TextField(
                                          controller: _controllers[index],
                                          focusNode: _focusNodes[index],
                                          maxLength: 1,
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 18, fontWeight: FontWeight.bold),
                                          decoration: InputDecoration(
                                            counterText: '',
                                            filled: true,
                                            fillColor: Colors.grey[200],
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                  color: Colors.deepOrange, width: 2),
                                            ),
                                          ),
                                          onChanged: (val) {
                                            if (val.isNotEmpty && index < 3) {
                                              FocusScope.of(context)
                                                  .requestFocus(_focusNodes[index + 1]);
                                            }
                                            _syncOtpToViewModel(vm);
                                          },
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                const SizedBox(height: 10),
                                TextButton(
                                  onPressed: () {
                                  },
                                  child: const Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "Didn't receive code? ",
                                            style: TextStyle(color: Colors.black)),
                                        TextSpan(
                                            text: "Resend",
                                            style: TextStyle(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                ),
                                Text('⏱ ${_formatTime(_remainingSeconds)}',
                                    style: const TextStyle(color: Colors.red)),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepOrange,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                  onPressed: vm.validateOtp()
                                      ? () async {
                                          final ok = await vm.verifyOtp();
                                          _showColorfulPopup(context, ok);
                                        }
                                      : null,
                                  child: vm.isVerifying
                                      ? const CircularProgressIndicator()
                                      : const Text("Verify"),
                                ),
                                const SizedBox(height: 30),
                                const Center(child: Text("Or sign in with")),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.g_mobiledata, size: 40, color: Color(0xFF03BA52)),
                                    SizedBox(width: 10),
                                    Icon(Icons.facebook, size: 30, color: Color(0xFF1B50F1)),
                                    SizedBox(width: 10),
                                    Icon(Icons.apple, size: 30),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('Already have an account?', style: TextStyle(color: Colors.black)),
                                    Text(' Sign in', style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
