import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../services/api_response.dart';
import '../utill/utill.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  bool isHidden = false;

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
    return Scaffold(
      //backgroundColor: const Color(0Xff2BC3BB),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'mount.jpg',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            width: widgetSize.getWidth(400, context),
            height: widgetSize.getHeight(600, context),
            //color: Colors.white,
            child: Row(
              children: [
                SizedBox(
                  width: widgetSize.getWidth(200, context),
                  height: widgetSize.getHeight(600, context),
                  child: SvgPicture.asset(
                    'login.svg',
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: widgetSize.getWidth(200, context),
                    height: widgetSize.getHeight(600, context),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: widgetSize.getWidth(40, context),
                        vertical: widgetSize.getHeight(150, context),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Welcome to our system',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Form(
                            key: _formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (String? text) {
                                    if (text == null ||
                                        text == '' ||
                                        text.isEmpty) {
                                      return 'Can\'t be empty';
                                    }
                                    if (text.length < 6) {
                                      return 'too short';
                                    }
                                    if (text.contains('@') == false ||
                                        text.contains('.') == false ||
                                        text.contains(' ') == true) {
                                      return 'Invalid email format';
                                    }
                                    return null;
                                  },
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
                                  obscureText: isHidden,
                                  validator: (String? text) {
                                    if (text == null ||
                                        text == '' ||
                                        text.isEmpty) {
                                      return 'Can\'t be empty';
                                    }
                                    if (text.length < 6) {
                                      return 'too short';
                                    }
                                    if (text.contains(' ') == true) {
                                      return 'Invalid password format';
                                    }
                                    return null;
                                  },
                                  controller: _passwordController,
                                  focusNode: _passwordFocusNode,
                                  keyboardType: TextInputType.visiblePassword,
                                  textDirection: TextDirection.ltr,
                                  showCursor: true,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isHidden
                                            ? Icons.remove_red_eye_rounded
                                            : Icons.remove_red_eye_outlined,
                                        color: const Color(0Xff2BC3BB),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isHidden = !isHidden;
                                        });
                                      },
                                    ),
                                    hintText: 'Password',
                                    border: const OutlineInputBorder(
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
                                    disabledBorder: const OutlineInputBorder(
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
                                    enabledBorder: const OutlineInputBorder(
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
                                    errorBorder: const OutlineInputBorder(
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
                                    focusedBorder: const OutlineInputBorder(
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
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              elevation: 3,
                              fixedSize: Size(
                                widgetSize.getWidth(180, context),
                                widgetSize.getHeight(50, context),
                              ),
                              primary: const Color(
                                0Xff2BC3BB,
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                final provider = Provider.of<AppProvider>(
                                    context,
                                    listen: false);
                                final navigator = Navigator.of(context);
                                if (await provider.checkInternet()) {
                                  var response = await provider.login(
                                      _emailController.text,
                                      _passwordController.text);

                                  if (response.status == Status.LOADING) {
                                    EasyLoading.showToast(
                                      'Loading...',
                                      duration: Duration(
                                        milliseconds: 300,
                                      ),
                                    );
                                  }
                                  if (response.status == Status.ERROR) {
                                    EasyLoading.showError(response.message!,
                                        dismissOnTap: true);
                                  }
                                  if (response.status == Status.COMPLETED) {
                                    if (response.data != null &&
                                        response.data!.status!) {
                                      EasyLoading.showSuccess(
                                          response.data!.message!,
                                          dismissOnTap: true);
                                      provider.setToken(response
                                          .data!.data![0].token!
                                          .toString());
                                      navigator.pushReplacementNamed('/main');
                                    }
                                  }
                                } else {}
                              }
                            },
                            child: const Text(
                              'Log In',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
