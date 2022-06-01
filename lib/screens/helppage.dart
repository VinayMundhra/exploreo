import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/global_variable.dart';

class HelpPageScreen extends StatefulWidget {
  const HelpPageScreen({Key? key}) : super(key: key);

  @override
  _HelpPageScreenState createState() => _HelpPageScreenState();
}

class _HelpPageScreenState extends State<HelpPageScreen> {
  bool _isLoading = false;

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
        title: textstyle('Help'),
      ),
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
              textstyle('Having problem while log in & Sign up?'),
              const SizedBox(
                height: 24,
              ),
              textstyle('Call us'),
              const SizedBox(
                height: 14,
              ),
              InkWell(
                child: Container(
                    child: !_isLoading
                        ? const Text(
                            '+65 9876543210',
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
                onTap: () {},
              ),
              SizedBox(
                height: 20,
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
              textstyle('Mail us'),
              const SizedBox(
                height: 14,
              ),
              InkWell(
                child: Container(
                    child: !_isLoading
                        ? const Text(
                            'help@gromart.com',
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
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
