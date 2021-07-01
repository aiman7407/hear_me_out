import 'package:flutter/material.dart';
import 'package:hear_me_out/components/logintabs.dart';
import 'package:hear_me_out/components/signup_form.dart';
import 'package:hear_me_out/src/const.dart';
import 'package:hear_me_out/views/login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  TextEditingController _textNameController = TextEditingController();
  TextEditingController _textEmailController = TextEditingController();
  TextEditingController _textMobileController = TextEditingController();
  TextEditingController _textPasswordController = TextEditingController();
  TextEditingController _texUsernameController = TextEditingController();

  bool _isLoading = false;
  bool _isNameValid = true;
  bool _isEmailValid = true;
  bool _isMobileValid = true;
  bool _isPasswordValid = true;
  bool _isUserNameValid = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !_isLoading,
      child: Scaffold(
        key: _scaffoldKey,
        body: new SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 75,
                ),
                LoginTabsButtons(
                  isSignIn: false,
                  isForgetPassword: false,
                  isLoading: _isLoading,
                ),
                SizedBox(
                  height:20,
                ),
                SignUpForm(
                  nameController: _textNameController,
                  emailController: _textEmailController,
                  passwordController: _textPasswordController,
                  mobileController: _textMobileController,
                  isNameValid: _isNameValid,
                  isEmailValid: _isEmailValid,
                  isPasswordValid: _isPasswordValid,
                  isMobileValid: _isMobileValid,
                  isUserNameValid: _isUserNameValid,
                  userNameController: _texUsernameController,
                ),
                SizedBox(
                  height: 20,
                ),
                _isLoading
                    ? new Center(
                  // Showing CircularProgressIndicator for the loading process
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                      kSecondColor,
                    ),
                  ),
                )
                    : InkWell(
                  borderRadius: BorderRadius.circular(
                   327,
                  ),
                  child: Container(
                    width: 327,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        327,
                      ),
                      color: kSecondColor,
                    ),
                    child: Center(
                      child: Text(
                        "CONTINUE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    if (_textNameController.text.length > 0 &&
                        _textEmailController.text.length > 0 &&
                        _textPasswordController.text.length > 0 &&
                        _textMobileController.text.length > 0)
                    {
                      // 1. Switch button to loading
                      setState(() {
                        _isLoading = true;
                        _isNameValid = true;
                        _isEmailValid = true;
                        _isPasswordValid = true;
                        _isMobileValid = true;
                        _isUserNameValid=true;
                      });

                      // 1. Switch button to loading
                      setState(() {
                        _isLoading = true;
                      });

                      // 2. Close keyboard
                      FocusScope.of(context)
                          .requestFocus(new FocusNode());

                      // 3. Request Register



                    }
                    else {
                      if (_textNameController.text.length < 1) {
                        setState(() {
                          _isNameValid = false;
                        });
                      } else {
                        setState(() {
                          _isNameValid = true;
                        });
                      }
                      if (_textEmailController.text.length < 1) {
                        setState(() {
                          _isEmailValid = false;
                        });
                      } else {
                        setState(() {
                          _isEmailValid = true;
                        });
                      }
                      if (_textPasswordController.text.length < 1) {
                        setState(() {
                          _isPasswordValid = false;
                        });
                      } else {
                        setState(() {
                          _isPasswordValid = true;
                        });
                      }
                      if (_textMobileController.text.length < 1) {
                        setState(() {
                          _isMobileValid = false;
                        });
                      } else {
                        setState(() {
                          _isMobileValid = true;
                        });
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Already Have an Account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(4285887861),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(
                       40,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal:5,
                        ),
                        child: Text(
                          "Switch to Sign In",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: kMainColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textNameController.dispose();
    _textEmailController.dispose();
    _textPasswordController.dispose();
    _textMobileController.dispose();
    super.dispose();
  }
}
