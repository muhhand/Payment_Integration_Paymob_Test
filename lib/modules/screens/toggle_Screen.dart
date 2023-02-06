import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration_paymob_test/controller/cubit/payment_cubit_cubit.dart';
import 'package:payment_integration_paymob_test/modules/screens/visa_Screen.dart';

import '../../core/network/constant.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubitCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Toggle Screen'),
          ),
          body: BlocConsumer<PaymentCubitCubit, PaymentCubitState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = PaymentCubitCubit.get(context);
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VisaScreen()));
                      },
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: Colors.black, width: 2.0)),
                        child: Image.network(AppImages.visaImage),
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
