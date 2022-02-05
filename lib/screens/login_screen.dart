import 'package:flutter/material.dart';
import 'package:fuelmetrics_flutter_project/controllers/login-controller.dart';
import 'package:fuelmetrics_flutter_project/utils.dart/validator.dart';
import 'package:fuelmetrics_flutter_project/widgets/large_button.dart';
import 'package:fuelmetrics_flutter_project/widgets/text-input.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  //inject controller here
  final LoginController _loginController = Get.put(LoginController());
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green[900],
            title: Text('Login'),
            elevation: 0),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8.0, left: 12.0, bottom: 20.0),
                      child: TextInput(
                          validator: (value) => Validator.validateEmail(value!),
                          controller: _loginController.email,
                          keyboardType: TextInputType.emailAddress,
                          isPassword: false,
                          hintText: 'email...',
                          textColor: Colors.black,
                          labelTextColor: Colors.green),
                    ),
                    Obx(() => Padding(
                          padding:
                              const EdgeInsets.only(right: 8.0, left: 12.0),
                          child: TextInput(
                              validator: (value) =>
                                  Validator.validateDefault(value),
                              icon: Icons.remove_red_eye_sharp,
                              controller: _loginController.password,
                              // labelText: 'password..',
                              hintText: 'password...',
                              // borderColor: ,
                              keyboardType: TextInputType.emailAddress,
                              isPassword: _loginController.isPassword.value,
                              textColor: Colors.black,
                              iconAction: () => _loginController.isPassword
                                  .value = !_loginController.isPassword.value,
                              labelTextColor: Colors.green),
                        )),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Button(
                          title: 'Login',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _loginController.login();
                            }
                          }),
                    ),
                    SizedBox(height: 20),
                  ],
                )),
          ),
        ));
  }
}
