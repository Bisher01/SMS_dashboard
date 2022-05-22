import 'package:flutter/material.dart';
import '../utill/utill.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  @override
  void initState() {
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var containerWidth = widgetSize.getWidth(400, context);
    var containerHeight = widgetSize.getHeight(600, context);
    return Scaffold(
      backgroundColor: const Color(0Xff2BC3BB),
      body: Center(
        child: Container(
          width: containerWidth,
          height: containerHeight,
          color: Colors.white,
          child: Row(
            children: [
              Container(
                color: const Color(0XffD2F8D7),
                width: containerWidth / 2,
                height: containerHeight,
              ),
              Container(
                color: Colors.white,
                width: containerWidth / 2,
                height: containerHeight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: containerWidth / 40,
                    vertical: containerHeight / 3,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Welcome to our system',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              focusNode: _emailFocusNode,
                              keyboardType: TextInputType.emailAddress,
                              textDirection: TextDirection.ltr,
                              showCursor: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(
                                      0Xff2BC3BB,
                                    ),
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(
                                      0Xff2BC3BB,
                                    ),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(
                                      0Xff2BC3BB,
                                    ),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.red,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(
                                      0Xff007D77,
                                    ),
                                  ),
                                ),
                              ),
                              cursorColor: const Color(0Xff007D77),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              focusNode: _passwordFocusNode,
                              keyboardType: TextInputType.visiblePassword,
                              textDirection: TextDirection.ltr,
                              showCursor: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(
                                      0Xff2BC3BB,
                                    ),
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(
                                      0Xff2BC3BB,
                                    ),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(
                                      0Xff2BC3BB,
                                    ),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.red,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(
                                      0Xff007D77,
                                    ),
                                  ),
                                ),
                              ),
                              cursorColor: const Color(0Xff007D77),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          fixedSize: Size(
                            containerWidth / 2 - containerWidth / 20,
                            containerHeight / 20,
                          ),
                          primary: const Color(
                            0Xff2BC3BB,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Log In',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
