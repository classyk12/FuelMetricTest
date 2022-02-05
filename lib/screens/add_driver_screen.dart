import 'package:flutter/material.dart';
import 'package:fuelmetrics_flutter_project/controllers/add-driver-controller.dart';
import 'package:fuelmetrics_flutter_project/utils.dart/validator.dart';
import 'package:fuelmetrics_flutter_project/widgets/large_button.dart';
import 'package:fuelmetrics_flutter_project/widgets/text-input.dart';
import 'package:get/get.dart';

class AddDriverScreen extends StatelessWidget {
  //inject controller here
  final AddDriverController _controller = Get.put(AddDriverController());
  AddDriverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green[900],
            title: Text('Add Driver'),
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
                          validator: (value) =>
                              Validator.validateDefault(value!),
                          controller: _controller.name,
                          keyboardType: TextInputType.emailAddress,
                          isPassword: false,
                          hintText: 'name',
                          textColor: Colors.black,
                          labelTextColor: Colors.green),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8.0, left: 12.0, bottom: 20.0),
                      child: TextInput(
                          validator: (value) =>
                              Validator.validateDefault(value!),
                          controller: _controller.phone,
                          keyboardType: TextInputType.phone,
                          isPassword: false,
                          hintText: 'phone',
                          textColor: Colors.black,
                          labelTextColor: Colors.green),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8.0, left: 12.0, bottom: 20.0),
                      child: TextInput(
                          validator: (value) => Validator.validateEmail(value!),
                          controller: _controller.email,
                          keyboardType: TextInputType.emailAddress,
                          isPassword: false,
                          hintText: 'email',
                          textColor: Colors.black,
                          labelTextColor: Colors.green),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8.0, left: 12.0, bottom: 20.0),
                      child: TextInput(
                          validator: (value) =>
                              Validator.validateDefault(value!),
                          controller: _controller.address,
                          keyboardType: TextInputType.text,
                          isPassword: false,
                          hintText: 'address',
                          textColor: Colors.black,
                          labelTextColor: Colors.green),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8.0, left: 12.0, bottom: 20.0),
                      child: TextInput(
                          validator: (value) =>
                              Validator.validateDefault(value!),
                          controller: _controller.state,
                          keyboardType: TextInputType.text,
                          isPassword: false,
                          hintText: 'state',
                          textColor: Colors.black,
                          labelTextColor: Colors.green),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8.0, left: 12.0, bottom: 20.0),
                      child: TextInput(
                          validator: (value) =>
                              Validator.validateDefault(value!),
                          controller: _controller.city,
                          keyboardType: TextInputType.text,
                          isPassword: false,
                          hintText: 'city',
                          textColor: Colors.black,
                          labelTextColor: Colors.green),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Button(
                          title: _controller.driver != null
                              ? 'Update Driver'
                              : 'Add Driver',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _controller.driver == null
                                  ? _controller.addDriver()
                                  : _controller.editDriver();
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
