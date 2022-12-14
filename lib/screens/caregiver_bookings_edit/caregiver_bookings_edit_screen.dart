import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';
import '../caregiver_booking_request/widgets/boarding_pet.dart';

class CaregiverBookingsEditScreen extends StatelessWidget {
  final int userId;
  final String service;

  const CaregiverBookingsEditScreen(
      {super.key, required this.userId, required this.service});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: CustomAppBar(
            onBackButtonPressed: () => Navigator.pop(context),
            title: "Editar reserva - $service",
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          "Paseo - {Mascota}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                              "Fecha de inicio:"),
                          SizedBox(
                            height: 20,
                            width: 70,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(10),
                                hintText: '14/09/2022',
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
                          Icon(Icons.calendar_month),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                              "Fecha de fin:"),
                          SizedBox(
                            height: 20,
                            width: 92,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(10),
                                hintText: '14/10/2022',
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
                          Icon(Icons.calendar_month),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //const BoardingPet(),
                      /* a flutter checkbox */
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (bool? value) {},
                          ),
                          const Text("Incluir recojo"),
                        ],
                      ),
                      /* A flutter text with the icon of ubication */
                      Row(
                        children: const [
                          Icon(Icons.location_on),
                          Text(
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              "La Paz, Plaza Murrillo"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(10),
                            helperText: 'Notas del due??o',
                            hintText: 'Fido es inquieto al salir a la calle',
                            isDense: true,
                            hintStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            isCollapsed: false,
                          ),
                          maxLines: 5,
                          readOnly: true,
                        ),
                      ),
                      const Text(
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                          "Resumen de la reserva"),
                      const SizedBox(
                        height: 10,
                      ),
                      /* a column text with three rows and a line separator on the last */
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    "Bs. 25 x 1 paseo:"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    "Bs. 25"),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    "Recojo:"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    "Bs. 5"),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    "Total:"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    "Bs. 30"),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            /* two botons in a row */
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, "/caregiver/home");
                                    },
                                    child: const Text("Cancelar reservas")),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, "/caregiver/home");
                                    },
                                    child:
                                        const Text("Marcar como completada")),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
