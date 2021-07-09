import 'package:flutter/material.dart';
import 'package:hear_me_out/src/const.dart';

import 'package:hear_me_out/views/login_screen.dart';

class LoginTabsButtons extends StatefulWidget {
  final bool isSignIn;
  final bool isForgetPassword;
  bool isLoading;

  LoginTabsButtons({
    Key key,
    @required this.isSignIn,
    @required this.isForgetPassword,
    @required this.isLoading,
  }) : super(key: key);
  @override
  _LoginTabsButtonsState createState() => _LoginTabsButtonsState();
}

class _LoginTabsButtonsState extends State<LoginTabsButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          borderRadius: BorderRadius.circular(
            121,
          ),
          child: Container(
            width: 121,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                121,
              ),
              border: widget.isSignIn
                  ? null
                  : Border.all(
                      color: kSilverColor,
                      width: 2,
                    ),
              color: widget.isSignIn ? kMainColor : Colors.white,
            ),
            child: Center(
              child: Text(
                "SIGN IN",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: widget.isSignIn ? Colors.white : kSilverColor,
                ),
              ),
            ),
          ),
          onTap: widget.isLoading
              ? null
              : () {
                  if (widget.isForgetPassword) {
                    Navigator.of(context).pop();
                  }

                  if (!widget.isSignIn) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }
                },
        ),
        SizedBox(
          width: 39,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(
            121,
          ),
          child: Container(
            width: 121,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                121,
              ),
              border: !widget.isSignIn
                  ? null
                  : Border.all(
                      color: kSilverColor,
                      width: 2,
                    ),
              color: !widget.isSignIn ? kMainColor : Colors.white,
            ),
            child: Center(
              child: Text(
                "SIGN UP",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: !widget.isSignIn ? Colors.white : kSilverColor,
                ),
              ),
            ),
          ),
          onTap: widget.isLoading
              ? null
              : () {
                  if (widget.isForgetPassword) {
                    Navigator.of(context).pop();
                  }
                  if (widget.isSignIn) {
                    Navigator.of(context).pop();
                  }
                },
        ),
      ],
    );
  }
}
