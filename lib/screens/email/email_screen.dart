import 'package:appmobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../services/api_service.dart';
import '../qr_code/qr_code_screen.dart';

class SignInPage1 extends StatefulWidget {
  const SignInPage1({Key? key}) : super(key: key);

  @override
  State<SignInPage1> createState() => _SignInPage1State();
}

class _SignInPage1State extends State<SignInPage1> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Card(
            elevation: 8,
            child: Container(
              padding: const EdgeInsets.all(32.0),
              constraints: const BoxConstraints(maxWidth: 450),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/PayeTonKawa.png',
                    ),
                    _gap(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Welcome !",
                        style: Theme.of(context).textTheme.headline5,
                        selectionColor: kPrimaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Enter your email to continue.",
                        style: Theme.of(context).textTheme.caption,
                        textAlign: TextAlign.center,
                        selectionColor: kPrimaryColor,
                      ),
                    ),
                    _gap(),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        // add email validation
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }

                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return 'Please enter a valid email';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    _gap(),
                    CheckboxListTile(
                      value: _rememberMe,
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          _rememberMe = value;
                        });
                      },
                      title: const Text('Remember me'),
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      contentPadding: const EdgeInsets.all(0),
                    ),
                    _gap(),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            String email = _emailController.text;
                            final apiService = ApiService();
                            String response =
                                await apiService.connectionSeller(email);
                            if (response == "connection successful") {
                              Fluttertoast.showToast(
                                  msg:
                                      "Vérification réussie, consultez vos mails",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.TOP,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Qr_code_Screen()));
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Vérification échouée",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  backgroundColor:
                                      Color.fromARGB(255, 170, 24, 27),
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
