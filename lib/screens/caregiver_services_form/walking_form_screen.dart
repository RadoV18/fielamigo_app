import 'package:fielamigo_app/screens/caregiver_services_form/widgets/slider.dart';
import 'package:fielamigo_app/screens/caregiver_services_form/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WalkingForm extends StatelessWidget {
  WalkingForm({super.key});
  final _nightFeeController = TextEditingController();
  final _pickupFeeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top+20,
          bottom: MediaQuery.of(context).padding.bottom,
          left: 5.w,
          right: 5.w,
        ),
        child: Center(
          child: Column(
            children: [
              const Text(
                "Paseo",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              EmailInputFb1(inputController: _nightFeeController, hintText: 'Ingresa el monto en Bs.', title: '¿Cuánto quieres cobrar por hora?',),
              const SizedBox(
                height: 30,
              ),
              SliderFb1(min:0, max:10, divisions: 10, onChange:(v){}, title: 'Introduce un máximo de horas', helperText: 'horas'),
              const SizedBox(
                height: 30,
              ),
              SliderFb1(min:0, max:20, divisions: 20, onChange:(v){}, title: 'Introduce el numero máximo de perros', helperText: 'perros'),
              const SizedBox(
                height: 30,
              ),
              Text('En donde haces los paseos'), // TODO add map
              const SizedBox(
                height: 30,
              ),
              DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff01bf8f), 
                  ),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          alignment: Alignment.center,
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(
                                  right: 75, left: 75, top: 15, bottom: 15)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          )),
                      onPressed: () {},
                      child: const Text(
                        "Guardar",
                        style:TextStyle(color: Color(0xffffffff), fontSize: 16),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}