import 'package:flutter/material.dart';
import 'package:order_app/screens/auth/auth_info.dart';
import 'package:order_app/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

import '../../models/http_exception.dart';
import '../shared/dialog_utils.dart';

import 'auth_manager.dart';

enum AuthMode { signup, login }

class AuthCard extends StatefulWidget {
  const AuthCard({
    super.key,
  });

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.login;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  final _isSubmitting = ValueNotifier<bool>(false);
  final _passwordController = TextEditingController();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    _isSubmitting.value = true;

    try {
      if (_authMode == AuthMode.login) {
        // Log user in

        await context.read<AuthManager>().login(
              _authData['email']!,
              _authData['password']!,
            );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              // return HomeScreen();
              return AuthInfo();
            },
          ),
        );
      } else {
        // Sign user up
        await context.read<AuthManager>().signup(
              _authData['email']!,
              _authData['password']!,
            );
      }
    } catch (error) {
      showErrorDialog(
          context,
          (error is HttpException)
              ? error.toString()
              : 'Authentication failed');
    }

    _isSubmitting.value = false;
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.login) {
      setState(() {
        _authMode = AuthMode.signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(children: [
      Container(
        height: _authMode == AuthMode.signup ? 420 : 360,
        constraints:
            BoxConstraints(minHeight: _authMode == AuthMode.signup ? 320 : 260),
        // width: deviceSize.width * 0.75,
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _buildEmailField(),
              _buildPasswordField(),
              if (_authMode == AuthMode.signup) _buildPasswordConfirmField(),
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder<bool>(
                valueListenable: _isSubmitting,
                builder: (context, isSubmitting, child) {
                  if (isSubmitting) {
                    return const CircularProgressIndicator();
                  }
                  return _buildSubmitButton();
                },
              ),
              _buildAuthModeSwitchButton(),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget _buildAuthModeSwitchButton() {
    return TextButton(
      onPressed: _switchAuthMode,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Text(
        '${_authMode == AuthMode.login ? 'ĐĂNG KÝ' : 'ĐĂNG NHẬP'}',
        style: TextStyle(color: Colors.green),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _submit,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
        textStyle: TextStyle(color: Colors.green),
      ),
      child: Text(
        _authMode == AuthMode.login ? 'ĐĂNG NHẬP' : 'ĐĂNG KÝ',
      ),
    );
  }

  Widget _buildPasswordConfirmField() {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 25),
        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        //padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 1),
                blurRadius: 50,
                color: Color.fromARGB(255, 250, 246, 246),
              )
            ]),
        child: TextFormField(
          enabled: _authMode == AuthMode.signup,
          obscureText: true,
          validator: _authMode == AuthMode.signup
              ? (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match!';
                  }
                  return null;
                }
              : null,
          cursorColor: Colors.green,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
            icon: Icon(
              Icons.key,
              color: Colors.green[500],
            ),
            hintText: "Enter your password",
          ),
        ));
  }

  Widget _buildPasswordField() {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 40),
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
        //padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 1),
                blurRadius: 50,
                color: Color.fromARGB(255, 250, 246, 246),
              )
            ]),
        child: TextFormField(
          obscureText: true,
          validator: (value) {
            if (value == null || value.length < 5) {
              return 'Password is too short!';
            }
            return null;
          },
          onSaved: (value) {
            _authData['password'] = value!;
          },
          controller: _passwordController,
          cursorColor: Colors.green,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
            icon: Icon(
              Icons.key,
              color: Colors.green[500],
            ),
            hintText: "Enter your password",
          ),
        ));
  }

  Widget _buildEmailField() {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 25),
        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        //padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 1),
                blurRadius: 50,
                color: Color.fromARGB(255, 250, 246, 246),
              )
            ]),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          cursorColor: Colors.green,
          validator: (value) {
            if (value!.isEmpty || !value.contains('@')) {
              return 'Invalid email!';
            }
            return null;
          },
          onSaved: (value) {
            _authData['email'] = value!;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
            icon: Icon(
              Icons.phone_android_outlined,
              color: Colors.green[500],
            ),
            hintText: "Enter your email",
          ),
        ));
  }
}
