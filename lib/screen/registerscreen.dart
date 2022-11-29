// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:sesion9/index.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    /*   final loginProvider = Provider.of<LoginProvider>(context); */
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                  'https://assets8.lottiefiles.com/packages/lf20_dn6rwtwl.json',
                  width: 250),
              Text(
                'Registrar',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
              ChangeNotifierProvider(
                create: (context) => LoginProvider(),
                child: RegisterForm(),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, MyRoutes.rLOGIN);
                  },
                  child: Text(
                    'Registrar',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}

InputDecoration _inputDecoration(
    {final String? hintText,
    final Widget? prefixIcon,
    final Widget? sufixIcon}) {
  return InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(15)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(15)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(15)),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(15)),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey),
      prefixIcon: prefixIcon,
      suffixIcon: sufixIcon,
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 18));
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isPassword = true;
  void _viewPass() {
    setState(() {
      _isPassword = !_isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return SizedBox(
      child: Form(
          key: loginProvider.formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration(
                    hintText: 'flutter@dev.com',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (value) => loginProvider.email = value,
                  validator: (value) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = RegExp(pattern);
                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'Correo no válido';
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  autocorrect: false,
                  obscureText: _isPassword,
                  keyboardType: TextInputType.text,
                  decoration: _inputDecoration(
                      hintText: '********',
                      prefixIcon: Icon(
                        Icons.key,
                        color: Colors.white,
                      ),
                      sufixIcon: InkWell(
                        onTap: _viewPass,
                        child: Icon(
                          !_isPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                      )),
                  onChanged: (value) => loginProvider.password = value,
                  validator: (value) {
                    return (value != null && value.length >= 8)
                        ? null
                        : 'La contraseña debe tener mas de8 carácteres';
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  onPressed: loginProvider.isloading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();
                          final authService =
                              Provider.of<AuthService>(context, listen: false);
                          if (!loginProvider.isvalidForm()) return;
                          loginProvider.isloading = true;
                          final String? errorMessage =
                              await authService.createUser(
                                  loginProvider.email, loginProvider.password);
                          /* await Future.delayed(Duration(seconds: 2)); */
                          if (errorMessage == null) {
                            Navigator.pushReplacementNamed(
                                context, MyRoutes.rHOME);
                          } else {
                            loginProvider.isloading = false;
                          }

                          Navigator.pushReplacementNamed(
                              context, MyRoutes.rHOME);
                        },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  disabledColor: Colors.green[200],
                  color: Colors.green,
                  elevation: 1,
                  child: (loginProvider.isloading)
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'Ingresar',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                )
              ],
            ),
          )),
    );
  }
}
