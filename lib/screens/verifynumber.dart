import 'package:exploreo_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/constant.dart';
import '../utils/global_variable.dart';

class VerifyNumberScreen extends StatefulWidget {
  const VerifyNumberScreen({Key? key}) : super(key: key);

  @override
  _VerifyNumberScreenState createState() => _VerifyNumberScreenState();
}

class _VerifyNumberScreenState extends State<VerifyNumberScreen> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _mobileCodeController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final bool _isLoading = false;
  String? Function(String?)? validator;
  TextEditingController? textEditingController;
  final bool isPass = false;
  String? labelText;
  String? hintText;
  TextInputType? textInputType;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _mobileCodeController.dispose();
    _mobileController.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  Widget textstyle(String data) {
    return Text(data,
        textAlign: TextAlign.center,
        style: const TextStyle(
            letterSpacing: 0.3,
            color: primaryColor,
            fontWeight: FontWeight.w500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: textstyle('Verify Number'),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: MediaQuery.of(context).size.width > webScreenSize
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3)
              : const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const Image(
                      image: AssetImage(
                    'assets/Splash1.png',
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Icon(
                    Icons.mobile_friendly_sharp,
                    color: Colors.black,
                    size: 60,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Just One More Step',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textstyle(
                      'Enter the four digit OTP we send to\n+91 87693573832'),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 60,
                        child: TextFormField(
                          autofocus: true,
                          obscureText: true,
                          style: TextStyle(fontSize: 24, color: Colors.black),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: otpInputDecoration,
                          onChanged: (value) {
                            nextField(value, pin2FocusNode);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: TextFormField(
                          focusNode: pin2FocusNode,
                          obscureText: true,
                          style: TextStyle(fontSize: 24, color: Colors.black),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: otpInputDecoration,
                          onChanged: (value) => nextField(value, pin3FocusNode),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: TextFormField(
                          focusNode: pin3FocusNode,
                          obscureText: true,
                          style: TextStyle(fontSize: 24, color: Colors.black),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: otpInputDecoration,
                          onChanged: (value) => nextField(value, pin4FocusNode),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: TextFormField(
                          focusNode: pin4FocusNode,
                          obscureText: true,
                          style: TextStyle(fontSize: 24, color: Colors.black),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: otpInputDecoration,
                          onChanged: (value) {
                            if (value.length == 1) {
                              pin4FocusNode!.unfocus();
                              // Then you need to check is the code is correct or not
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildTimer(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.23,
                        child: const Text(
                          "Resend Code?",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        print("Successfull");
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                        return;
                      } else {
                        print("UnSuccessfull");
                      }
                    },
                    child: Container(
                        child: !_isLoading
                            ? const Text(
                                'SUBMIT',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.8),
                              )
                            : const CircularProgressIndicator(
                                color: primaryColor,
                              ),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(
                                  0, 3), 
                            ),
                          ],
                          color: blueColor,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

buildTimer() {
  return TweenAnimationBuilder(
    tween: Tween(begin: 30.0, end: 0.0),
    duration: Duration(seconds: 30),
    builder: (_, dynamic value, child) => Text(
      "00:${value.toInt()}",
      style: TextStyle(color: Colors.black),
    ),
  );
}
