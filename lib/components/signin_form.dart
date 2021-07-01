import 'package:flutter/material.dart';


class SignInForm extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  bool isUsernameValid;
  bool isPasswordValid;
  bool isLoading;

  SignInForm({
    Key key,
    @required this.usernameController,
    @required this.passwordController,
    @required this.isUsernameValid,
    @required this.isPasswordValid,
    @required this.isLoading,
  }) : super(key: key);
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 37,
        right: 37,
        top: 23,
        bottom: 50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // The email address field
          TextField(
            autocorrect: false,
            keyboardType: TextInputType.text,
            controller: widget.usernameController,
            style: new TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: "Username",
              hintStyle: TextStyle(
                color: Color(4280554290),
                fontSize:16,
              ),
              errorText:
              widget.isUsernameValid ? null : 'Username Can\'t Be Empty',
              errorStyle: TextStyle(
                fontSize: 12,
              ),
            ),
          ),

          SizedBox(
            height: 35,
          ),

          // The password field
          TextField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.text,
            controller: widget.passwordController,
            style: new TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(
                color: Color(4280554290),
                fontSize:16,
              ),
              errorText:
              widget.isPasswordValid ? null : 'Password Can\'t Be Empty',
              errorStyle: TextStyle(
                fontSize:12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
