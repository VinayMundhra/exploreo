import 'package:flutter/material.dart';

import 'package:exploreo_app/screens/login_screen.dart';

import '../../utils/colors.dart';
import '../../utils/global_variable.dart';
import '../signup_screen.dart';

class SplashDetail extends StatefulWidget {
  const SplashDetail({Key? key}) : super(key: key);

  @override
  _SplashDetailState createState() => _SplashDetailState();
}

class _SplashDetailState extends State<SplashDetail> {
  bool _isLoading = false;

  Widget textstyle(String data) {
    return Text(data, style: TextStyle(color: primaryColor));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: MediaQuery.of(context).size.width > webScreenSize
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3)
              : const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage(
                'assets/Splash1.png',
              )),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                child: Container(
                    child: !_isLoading
                        ? const Text(
                            'LOG IN',
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
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: blueColor,
                    )),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
           
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                    child: !_isLoading
                        ? const Text(
                            'SIGN UP',
                            style: TextStyle(color: Colors.black),
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
                        color: Colors.white,
                        border: Border.all(color: Colors.blue))),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Expanded(
                      child: Divider(
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    textstyle("OR"),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                        child: Divider(
                      color: primaryColor,
                    )),
                  ]),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Container(
                      child: const Text(
                        'Google',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Container(
                      child: const Text(
                        'facebook',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        color: Color.fromARGB(255, 0, 81, 147),
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
