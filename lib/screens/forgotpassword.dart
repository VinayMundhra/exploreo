import 'package:exploreo_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/global_variable.dart';
import '../widgets/text_field_input.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
  void dispose() {
    super.dispose();
    _mobileCodeController.dispose();
    _mobileController.dispose();
  }

  Widget textstyle(String data) {
    return Text(data,
        textAlign: TextAlign.center,
        style: const TextStyle(
            letterSpacing: 0.3,
            color: primaryColor,
            fontWeight: FontWeight.w500));
  }

  textFieldForgotPassword(
      {String? hintText,
      String? labelText,
      TextInputType? textInputType,
      TextEditingController? textEditingController,
      bool isPass = false,
      required String? Function(dynamic val) validator}) {
    const inputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1));
    return TextFormField(
      validator: validator,
      style: TextStyle(color: Colors.black),
      controller: textEditingController,
      decoration: InputDecoration(
        // labelText: labelText,
        labelStyle: TextStyle(color: Colors.black),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black),
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: textstyle('Forgot Password'),
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
                  height: 30,
                ),
                textstyle('Enter your Mobile Number below\nto change password'),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: TextFieldInput(
                        hintText: '+91',
                        textInputType: TextInputType.phone,
                        textEditingController: _mobileCodeController,
                        labelText: '',
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: TextFieldInput(
                        hintText: 'Mobile Number',
                        textInputType: TextInputType.phone,
                        textEditingController: _mobileController,
                        labelText: '',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter mobile number";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      print("Successfull");
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
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
                                0, 3), // changes position of shadow
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
    );
  }
}
