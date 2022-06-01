import 'package:exploreo_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/global_variable.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isLoading = false;
  String? Function(String?)? validator;
  TextEditingController? textEditingController;
  final bool isPass = false;
  String? labelText;
  var confirmPass;
  String? hintText;
  TextInputType? textInputType;

  @override
  void dispose() {
    super.dispose();
    _passwordController1.dispose();
    _passwordController.dispose();
  }

  Widget textstyle(String data) {
    return Text(data, style: TextStyle(color: primaryColor));
  }

  textFieldChangePassword(
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
        title: textstyle('Change Password'),
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
                textFieldChangePassword(
                  labelText: '',
                  hintText: 'New Password',
                  textInputType: TextInputType.visiblePassword,
                  textEditingController: _passwordController1,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Enter New Password";
                    } else if (value.length < 8) {
                      return "Password must be atleast 8 characters long";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                textFieldChangePassword(
                  hintText: 'Retype Password',
                  textInputType: TextInputType.text,
                  textEditingController: _passwordController,
                  isPass: true,
                  labelText: '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Re-Enter New Password";
                    } else if (_passwordController.text !=
                        _passwordController1.text) {
                      return "Password does not match";
                    } else {
                      return null;
                    }
                  },
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
                              'CHANGE PASSWORD',
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
