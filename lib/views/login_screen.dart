import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/components/logintabs.dart';
import 'package:hear_me_out/components/signin_form.dart';
import 'package:hear_me_out/services/auth.dart';
import 'package:hear_me_out/services/database.dart';
import 'package:hear_me_out/services/local_storage.dart';
import 'package:hear_me_out/src/const.dart';
import 'package:hear_me_out/src/const_function.dart';
import 'package:hear_me_out/src/const_strings.dart';
import 'package:hear_me_out/views/on_boarding.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _textUsernameController = TextEditingController();
  TextEditingController _textPasswordController = TextEditingController();

  bool _isLoading = false;
  bool _isUsernameValid = true;
  bool _isPasswordValid = true;

  DataBaseHelper dbHelper = DataBaseHelper();
  QuerySnapshot userInfoSnapshot;
  Auth auth = Auth();

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
              children: <Widget>[
                SizedBox(
                  height: 75,
                ),
                LoginTabsButtons(
                  isSignIn: true,
                  isForgetPassword: false,
                  isLoading: _isLoading,
                ),
                SizedBox(
                  height: 20,
                ),
                SignInForm(
                  usernameController: _textUsernameController,
                  passwordController: _textPasswordController,
                  isUsernameValid: _isUsernameValid,
                  isPasswordValid: _isPasswordValid,
                  isLoading: _isLoading,
                ),
                SizedBox(
                  height: 30,
                ),
                _isLoading
                    ? Center(
                        // Showing CircularProgressIndicator for the loading process
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
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
                          if (_textUsernameController.text.length > 0 &&
                              _textPasswordController.text.length > 0) {
                            // 1. Switch button to loading
                            setState(() {
                              _isLoading = true;
                              _isUsernameValid = true;
                              _isPasswordValid = true;
                            });

                            // 2. Close keyboard
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            //
                            //  dbHelper.getUserByEmail(_textUsernameController.text).then((value){
                            //   userInfoSnapshot=value;
                            //   print(userInfoSnapshot.docs[0][USERS_USERNAME]);
                            //   // SharedPreferencesHelper.saveUsername(
                            //   //
                            //   // );
                            // });

                            // 3. Request login

                            auth
                                .signinwithEmai(
                                    password: _textPasswordController.text,
                                    email: _textUsernameController.text)
                                .then((value) async {
                              QuerySnapshot userInfoSnapshot = await dbHelper
                                  .getUserByEmail(_textUsernameController.text);

                              SharedPreferencesHelper.saveUserLoggedIn(true);
                              print('fdsfsdfds' +
                                  userInfoSnapshot.docs[0][USERS_USERNAME]);
                              SharedPreferencesHelper.saveUsername(
                                  userInfoSnapshot.docs[0][USERS_USERNAME]);
                              SharedPreferencesHelper.saveUserEmail(
                                  userInfoSnapshot.docs[0][USERS_EMAIL]);

                              navigateAndFinish(
                                  screen: IntroGuideScreen(), context: context);
                            });
                          } else {
                            if (_textUsernameController.text.length < 1) {
                              setState(() {
                                _isUsernameValid = false;
                              });
                            } else {
                              setState(() {
                                _isUsernameValid = true;
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
                          }
                        },
                      ),
                SizedBox(
                  height: 32,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Text(
                      "FORGOT PASSWORD",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: kSilverColor,
                      ),
                    ),
                  ),
                  onTap: _isLoading
                      ? null
                      : () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ForgetPassword(),
                          //   ),
                          //);
                        },
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
    _textUsernameController.dispose();
    _textPasswordController.dispose();
    super.dispose();
  }
}
