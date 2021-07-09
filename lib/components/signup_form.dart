import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignUpForm extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController mobileController;
  final TextEditingController passwordController;
  final TextEditingController userNameController;
  bool isNameValid;
  bool isEmailValid;
  bool isMobileValid;
  bool isPasswordValid;
  bool isUserNameValid;

  SignUpForm(
      {Key key,
      @required this.nameController,
      @required this.emailController,
      @required this.passwordController,
      @required this.mobileController,
      @required this.isNameValid,
      @required this.isEmailValid,
      @required this.isPasswordValid,
      @required this.isMobileValid,
      @required this.isUserNameValid,
      @required this.userNameController})
      : super(key: key);
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          45,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(
              0.0,
              3,
            ),
            blurRadius: 4,
          )
        ],
      ),
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
          // The name field
          TextField(
            autocorrect: false,
            keyboardType: TextInputType.text,
            controller: widget.nameController,
            style: new TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: "Name",
              hintStyle: TextStyle(
                color: Color(4280554290),
                fontSize: 16,
              ),
              errorText: widget.isNameValid ? null : 'Name Can\'t Be Empty',
              errorStyle: TextStyle(
                fontSize: 12,
              ),
            ),
          ),

          SizedBox(
            height: 35,
          ),

          // The email address field
          TextField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            controller: widget.emailController,
            style: new TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(
                color: Color(4280554290),
                fontSize: 16,
              ),
              errorText: widget.isEmailValid ? null : 'Email Can\'t Be Empty',
              errorStyle: TextStyle(
                fontSize: 12,
              ),
            ),
          ),

          SizedBox(
            height: 35,
          ),

          // The username field

          // The mobile field
          TextField(
            autocorrect: false,
            keyboardType: TextInputType.phone,
            controller: widget.mobileController,
            style: new TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: "Phone Number",
              hintStyle: TextStyle(
                color: Color(4280554290),
                fontSize: 16,
              ),
              errorText:
                  widget.isMobileValid ? null : 'Phone Number Can\'t Be Empty',
              errorStyle: TextStyle(
                fontSize: 12,
              ),
            ),
          ),

          SizedBox(
            height: 35,
          ),
          //the password field
          TextField(
            autocorrect: false,
            keyboardType: TextInputType.text,
            controller: widget.userNameController,
            style: new TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: "User Name",
              hintStyle: TextStyle(
                color: Color(4280554290),
                fontSize: 16,
              ),
              errorText:
                  widget.isUserNameValid ? null : 'Username Can\'t Be Empty',
              errorStyle: TextStyle(
                fontSize: 12,
              ),
            ),
          ),

          SizedBox(
            height: 35,
          ),
          //the password field
          TextField(
            obscureText: true,
            autocorrect: false,
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
                fontSize: 16,
              ),
              errorText:
                  widget.isPasswordValid ? null : 'Password Can\'t Be Empty',
              errorStyle: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
