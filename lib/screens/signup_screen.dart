import 'dart:typed_data';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../resources/auth_method.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsivelayout.dart';
import '../responsive/web_screen_layout.dart';
import '../utils/colors.dart';
import '../utils/global_variable.dart';
import '../utils/utils.dart';
import '../widgets/text_field_input.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileCodeController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _dob = TextEditingController();

  bool _isLoading = false;
  bool agree = false;
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstName.dispose();
    _dob.dispose();
    _lastName.dispose();
    _mobileController.dispose();
    _passwordController1.dispose();
  }

  void signUpUser() async {
    if (_formkey.currentState!.validate()) {
      print("Successfull");
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (context) => LoginScreen()),
      // );
      return;
    } else {
      print("UnSuccessfull");
    }
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _firstName.text,
        bio: _lastName.text,
        file: _image!);
    // if string returned is sucess, user has been created
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout(),
          ),
        ),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      showSnackBar(context, res);
    }
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  Widget textstyle(String data) {
    return Text(data, style: TextStyle(color: primaryColor));
  }

  textFieldConfirmPassword(
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
            title: textstyle('Sign up')),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                padding: MediaQuery.of(context).size.width > webScreenSize
                    ? EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 3)
                    : const EdgeInsets.symmetric(horizontal: 32),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      const Image(
                          image: AssetImage(
                        'assets/Splash1.png',
                      )),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFieldInput(
                              hintText: 'First Name',
                              textInputType: TextInputType.text,
                              textEditingController: _firstName,
                              labelText: '',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter first name";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFieldInput(
                              hintText: 'Last Name',
                              textInputType: TextInputType.text,
                              textEditingController: _lastName,
                              labelText: '',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter last name";
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
                      TextFieldInput(
                        hintText: 'Enter your email',
                        textInputType: TextInputType.text,
                        textEditingController: _emailController,
                        labelText: '',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      textFieldConfirmPassword(
                        labelText: '',
                        hintText: 'Password',
                        textInputType: TextInputType.visiblePassword,
                        textEditingController: _passwordController1,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter Password";
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
                      textFieldConfirmPassword(
                        hintText: 'Confirm Password',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
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
                      TextFieldInput(
                        labelText: '',
                        hintText: 'Date Of Birth',
                        textInputType: TextInputType.text,
                        textEditingController: _dob,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter date of birth";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            fillColor: MaterialStateProperty.all(Colors.black),
                            checkColor: Colors.white,
                            // focusColor: Colors.black,
                            value: agree,
                            onChanged: (value) {
                              setState(() {
                                agree = value ?? false;
                              });
                            },
                          ),
                          const AutoSizeText(
                            'I agree to terms of Use & Privacy Policy',
                            overflow: TextOverflow.ellipsis,
                            maxFontSize: 17,
                            minFontSize: 15,
                            style: TextStyle(color: primaryColor),
                          )
                        ],
                      ),
                      InkWell(
                        child: Container(
                          child: !_isLoading
                              ? const Text(
                                  'Sign up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              : const CircularProgressIndicator(
                                  color: primaryColor,
                                ),
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                            color: blueColor,
                          ),
                        ),
                        onTap: signUpUser,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: textstyle(
                              'Already have an account?',
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            ),
                            child: Container(
                              child: const Text(
                                ' Log in',
                                style: TextStyle(
                                    color: blueColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }
}

// TextFieldInput(
//   hintText: 'Enter your email',
//   textInputType: TextInputType.text,
//   textEditingController: _usernameController,
//   labelText: '',
// ),
// const SizedBox(
//   height: 24,
// ),
// TextFieldInput(
//   hintText: 'Password',
//   textInputType: TextInputType.text,
//   textEditingController: _passwordController,
//   labelText: '',
//   isPass: true,
// ),
// const SizedBox(
//   height: 24,
// ),
// TextFieldInput(
//   labelText: '',
//   hintText: 'Confirm password',
//   textInputType: TextInputType.text,
//   textEditingController: _passwordController,
//   isPass: true,
// ),
// const SizedBox(
//   height: 24,
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Container(
//       width: MediaQuery.of(context).size.width * 0.2,
//       child: TextFieldInput(
//         hintText: 'Code',
//         textInputType: TextInputType.phone,
//         textEditingController: _usernameController,
//         labelText: '',
//       ),
//     ),
//     Container(
//       width: MediaQuery.of(context).size.width * 0.6,
//       child: TextFieldInput(
//         hintText: 'Mobile Enter',
//         textInputType: TextInputType.phone,
//         textEditingController: _usernameController,
//         labelText: '',
//       ),
//     ),
//   ],
// ),
// const SizedBox(
//   height: 24,
// ),
// TextFieldInput(
//   labelText: '',
//   hintText: 'Date Of Birth',
//   textInputType: TextInputType.text,
//   textEditingController: _bioController,
// ),
// const SizedBox(
//   height: 24,
// ),
// InkWell(
//   child: Container(
//     child: !_isLoading
//         ? const Text(
//             'Sign up',
//           )
//         : const CircularProgressIndicator(
//             color: primaryColor,
//           ),
//     width: double.infinity,
//     alignment: Alignment.center,
//     padding: const EdgeInsets.symmetric(vertical: 12),
//     decoration: const ShapeDecoration(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(4)),
//       ),
//       color: blueColor,
//     ),
//   ),
//   onTap: signUpUser,
// ),
// const SizedBox(
//   height: 12,
// ),
// Flexible(
//   child: Container(),
//   flex: 2,
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     Container(
//       child: const Text(
//         'Already have an account?',
//       ),
//       padding: const EdgeInsets.symmetric(vertical: 8),
//     ),
//     GestureDetector(
//       onTap: () => Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => const LoginScreen(),
//         ),
//       ),
//       child: Container(
//         child: const Text(
//           ' Log in.',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 8),
//       ),
//     ),
//   ],
// ),
