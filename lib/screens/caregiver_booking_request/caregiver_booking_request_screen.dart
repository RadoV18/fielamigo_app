import 'package:fielamigo_app/screens/caregiver_booking_request/widgets/boarding_pet.dart';
import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/boarding_cubit/boarding_cubit.dart';
import '../../data/models/dog_res_dto.dart';

class CaregiverBookingRequestScreen extends StatefulWidget {
  final String? title;
  final String? detailName;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<DogResDto>? dogs;
  final String? notes;
  final int? nightCount;
  final double? price;
  final String? city;
  final String? zone;
  final double? pickupRate;
  final bool isCaregiver;

  const CaregiverBookingRequestScreen({
    super.key,
    this.title,
    this.detailName,
    this.startDate,
    this.endDate,
    this.dogs,
    this.notes,
    this.nightCount,
    this.price,
    this.city,
    this.zone,
    this.pickupRate,
    this.isCaregiver = true
  });

  static final TextEditingController startController = TextEditingController();
  static final TextEditingController endController = TextEditingController();

  @override
  State<CaregiverBookingRequestScreen> createState() => _CaregiverBookingRequestScreenState();
}

class _CaregiverBookingRequestScreenState extends State<CaregiverBookingRequestScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    CaregiverBookingRequestScreen.startController.text = "${widget.startDate!.day}/${widget.startDate!.month}/${widget.startDate!.year}";
    CaregiverBookingRequestScreen.endController.text = "${widget.endDate!.day}/${widget.endDate!.month}/${widget.endDate!.year}";
    return Scaffold(
      resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          title: widget.title!,
          onBackButtonPressed: () => Navigator.pop(context),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                      "Alojamiento - ${widget.detailName}"),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                          "Fecha de inicio:"
                        ),
                      ),
                      const Icon(Icons.calendar_month),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: CaregiverBookingRequestScreen.startController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(10),
                            isDense: true,
                            hintStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            isCollapsed: false,
                          ),
                          readOnly: true,
                        ),
                      ),
                      
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                          "Fecha de Salida:"
                        ),
                      ),
                      const Icon(Icons.calendar_month),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: CaregiverBookingRequestScreen.endController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(10),
                            isDense: true,
                            hintStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            isCollapsed: false,
                          ),
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BoardingPet(
                    dogs: widget.dogs!
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            if(value != null) {
                              context.read<BoardingCubit>().setPickup(value);
                              isSelected = value;
                            }
                          });
                        },
                      ),
                      const Text("Incluir recojo"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      Text(
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        "${widget.city!}, ${widget.zone!}"
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: "Notas",
                      hintText: "Agrega algún detalle que el cuidador debería saber.",
                    ),
                    onChanged: (value) {
                      context.read<BoardingCubit>().setNotes(value);
                    }
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                    "Resumen de la reserva"
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            "Bs.${widget.dogs!.length * widget.price!} x ${widget.nightCount} noche(s):"
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            "Bs.${(widget.price! * widget.nightCount!)}"
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              "Recojo:"),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              "Bs.${isSelected ? (widget.pickupRate! * widget.dogs!.length) : 0}"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              "Total:"),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              "Bs.${widget.nightCount! * (widget.dogs!.length * widget.price!) + (isSelected ? (widget.pickupRate! * widget.dogs!.length) : 0)}"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      /* two botons in a row */
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                        children: widget.isCaregiver ? [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Rechazar"),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Aceptar"),
                          ),
                        ] : [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/select-payment-method");
                            },
                            child: const Text("Confirmar"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
        ));
  }
}
