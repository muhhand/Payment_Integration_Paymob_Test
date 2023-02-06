import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration_paymob_test/controller/cubit/payment_cubit_cubit.dart';
import 'package:payment_integration_paymob_test/modules/screens/toggle_Screen.dart';
import 'package:payment_integration_paymob_test/modules/widgets/default_button.dart';
import '../widgets/defualt_textFormField.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubitCubit()..getAuthToken(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Payment Integration'),
        ),
        body: BlocConsumer<PaymentCubitCubit, PaymentCubitState>(
          listener: (context, state) {
            if (state is PayymentgetPaymentRequestSuccessState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ToggleScreen()));
            }
          },
          builder: (context, state) {
            var cubit = PaymentCubitCubit.get(context);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Image.asset('assets/images/Delivery2.png')),
                    Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: DefaultTextFormFiled(
                                      type: TextInputType.text,
                                      prefix: Icons.person,
                                      hintText: 'first name',
                                      controller: firstnameController,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return "Please Enter The First Name";
                                        }
                                        return null;
                                      }),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: DefaultTextFormFiled(
                                      type: TextInputType.text,
                                      prefix: Icons.person,
                                      hintText: 'last name',
                                      controller: lastnameController,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return "Please Enter The Last Name";
                                        }
                                        return null;
                                      }),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DefaultTextFormFiled(
                                type: TextInputType.emailAddress,
                                prefix: Icons.email,
                                hintText: 'email',
                                controller: emailnameController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter The Email";
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            DefaultTextFormFiled(
                                type: TextInputType.phone,
                                prefix: Icons.phone,
                                hintText: 'phone',
                                controller: phoneController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter The Phone";
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            DefaultTextFormFiled(
                                type: TextInputType.number,
                                prefix: Icons.money,
                                hintText: 'price',
                                controller: priceController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter The price";
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 25,
                            ),
                            DefaultButton(
                                backgroundColor: Colors.red,
                                radius: 10,
                                buttonWidget: const Text(
                                  'Confirm Order',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      letterSpacing: 1.7),
                                ),
                                function: () {
                                  if (formkey.currentState!.validate()) {
                                    cubit.getOrderIdRegisterationId(
                                        firstname: firstnameController.text,
                                        lastname: lastnameController.text,
                                        email: emailnameController.text,
                                        phone: phoneController.text,
                                        price: priceController.text);
                                    print('Success');
                                  }
                                })
                          ],
                        )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
