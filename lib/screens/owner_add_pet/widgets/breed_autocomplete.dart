import 'package:fielamigo_app/bloc/add_pet_cubit/add_pet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/catalog_dto.dart';

class BreedAutocomplete extends StatelessWidget {
  const BreedAutocomplete({super.key});

  static List<CatalogDto> kBreeds = <CatalogDto>[
    CatalogDto(id: 7, name: "Affenpinscher"),
    CatalogDto(id: 8, name: "Airedale Terrier"),
    CatalogDto(id: 9, name: "Akita Americano"),
    CatalogDto(id: 10, name: "Akita Inu"),
    CatalogDto(id: 11, name: "Alaskan Malamute"),
    CatalogDto(id: 12, name: "American Staffordshire Terrier"),
    CatalogDto(id: 13, name: "Antiguo perro de muestra danés"),
    CatalogDto(id: 14, name: "Azawakh"),
    CatalogDto(id: 15, name: "Azul de Gascuña"),
    CatalogDto(id: 16, name: "Basenji"),
    CatalogDto(id: 17, name: "Basset artesiano de Normandía"),
    CatalogDto(id: 18, name: "Basset de los Alpes"),
    CatalogDto(id: 19, name: "Basset Hound"),
    CatalogDto(id: 20, name: "Basset leonado de Bretaña"),
    CatalogDto(id: 21, name: "Beagle"),
    CatalogDto(id: 22, name: "Beagle-Harrier"),
    CatalogDto(id: 23, name: "Beauceron"),
    CatalogDto(id: 24, name: "Bedlington Terrier"),
    CatalogDto(id: 25, name: "Bergamasco"),
    CatalogDto(id: 26, name: "Bichón boloñés"),
    CatalogDto(id: 27, name: "Bichón frisé"),
    CatalogDto(id: 28, name: "Bichón Habanero"),
    CatalogDto(id: 29, name: "Bichón maltés"),
    CatalogDto(id: 30, name: "Billy"),
    CatalogDto(id: 31, name: "Black and Tan Coonhound"),
    CatalogDto(id: 32, name: "Bobtail"),
    CatalogDto(id: 33, name: "Boerboel"),
    CatalogDto(id: 34, name: "Border collie"),
    CatalogDto(id: 35, name: "Border Terrier"),
    CatalogDto(id: 36, name: "Borzoi"),
    CatalogDto(id: 37, name: "Boston terrier"),
    CatalogDto(id: 38, name: "Bóxer"),
    CatalogDto(id: 39, name: "Boyero de Appenzell"),
    CatalogDto(id: 40, name: "Boyero de Berna"),
    CatalogDto(id: 41, name: "Boyero de Entlebuch"),
    CatalogDto(id: 42, name: "Boyero de Flandes"),
    CatalogDto(id: 43, name: "Boyero de las Ardenas"),
    CatalogDto(id: 44, name: "Braco alemán"),
    CatalogDto(id: 45, name: "Braco alemán de pelo corto"),
    CatalogDto(id: 46, name: "Braco Alemán de Pelo Duro"),
    CatalogDto(id: 47, name: "Braco austriaco negro y fuego"),
    CatalogDto(id: 48, name: "Braco de Ariège"),
    CatalogDto(id: 49, name: "Braco de Auvernia"),
    CatalogDto(id: 50, name: "Braco de Borbón"),
    CatalogDto(id: 51, name: "Braco de Weimar"),
    CatalogDto(id: 52, name: "Braco eslovaco de pelo duro"),
    CatalogDto(id: 53, name: "Braco francés"),
    CatalogDto(id: 54, name: "Braco húngaro"),
    CatalogDto(id: 55, name: "Braco Italiano"),
    CatalogDto(id: 56, name: "Braco Saint-Germain"),
    CatalogDto(id: 57, name: "Briquet grifón vendeano"),
    CatalogDto(id: 58, name: "Broholmer"),
    CatalogDto(id: 59, name: "Buhund noruego"),
    CatalogDto(id: 60, name: "Bull Terrier"),
    CatalogDto(id: 61, name: "Bulldog Americano"),
    CatalogDto(id: 62, name: "Bulldog francés"),
    CatalogDto(id: 63, name: "Bulldog inglés"),
    CatalogDto(id: 64, name: "Bullmastiff"),
    CatalogDto(id: 65, name: "Cairn Terrier"),
    CatalogDto(id: 66, name: "Cane Corso"),
    CatalogDto(id: 67, name: "Caniche"),
    CatalogDto(id: 68, name: "Cavalier King Charles Spaniel"),
    CatalogDto(id: 69, name: "Cazador de alces noruego"),
    CatalogDto(id: 70, name: "Chihuahua"),
    CatalogDto(id: 71, name: "Chow Chow"),
    CatalogDto(id: 72, name: "Cirneco del Etna"),
    CatalogDto(id: 73, name: "Clumber Spaniel"),
    CatalogDto(id: 74, name: "Cobrador de pelo liso"),
    CatalogDto(id: 75, name: "Cobrador de pelo rizado"),
    CatalogDto(id: 76, name: "Cocker Spaniel americano"),
    CatalogDto(id: 77, name: "Cocker Spaniel inglés"),
    CatalogDto(id: 78, name: "Collie barbudo"),
    CatalogDto(id: 79, name: "Collie de pelo corto"),
    CatalogDto(id: 80, name: "Collie de pelo largo"),
    CatalogDto(id: 81, name: "Corgi galés de Pembroke"),
    CatalogDto(id: 82, name: "Cotón de Tulear"),
    CatalogDto(id: 83, name: "Crestado chino"),
    CatalogDto(id: 84, name: "Crestado rodesiano"),
    CatalogDto(id: 85, name: "Cursinu"),
    CatalogDto(id: 86, name: "Dálmata"),
    CatalogDto(id: 87, name: "Dandie Dinmont"),
    CatalogDto(id: 88, name: "Dóberman"),
    CatalogDto(id: 89, name: "Dogo argentino"),
    CatalogDto(id: 90, name: "Dogo de Burdeos"),
    CatalogDto(id: 91, name: "Dogo del Tíbet"),
    CatalogDto(id: 92, name: "Dogo mallorquín"),
    CatalogDto(id: 93, name: "Drever"),
    CatalogDto(id: 94, name: "Eurasier"),
    CatalogDto(id: 95, name: "Field Spaniel"),
    CatalogDto(id: 96, name: "Fila Brasileiro"),
    CatalogDto(id: 97, name: "Fila de San Miguel"),
    CatalogDto(id: 98, name: "Fox Terrier"),
    CatalogDto(id: 99, name: "Foxhound americano"),
    CatalogDto(id: 100, name: "Foxhound inglés"),
    CatalogDto(id: 101, name: "Galgo afgano"),
    CatalogDto(id: 102, name: "Galgo español"),
    CatalogDto(id: 103, name: "Galgo inglés"),
    CatalogDto(id: 104, name: "Galgo italiano"),
    CatalogDto(id: 105, name: "Galgo polaco"),
    CatalogDto(id: 106, name: "Gascon saintongeois"),
    CatalogDto(id: 107, name: "Golden Retriever"),
    CatalogDto(id: 108, name: "Gordon Setter"),
    CatalogDto(id: 109, name: "Gran basset grifón vendeano"),
    CatalogDto(id: 110, name: "Gran boyero suizo"),
    CatalogDto(id: 111, name: "Gran danés"),
    CatalogDto(id: 112, name: "Gran grifón vendeano"),
    CatalogDto(id: 113, name: "Gran Munsterlander"),
    CatalogDto(id: 114, name: "Gran sabueso anglo-francés blanco y naranja"),
    CatalogDto(id: 115, name: "Gran sabueso anglo-francés blanco y negro"),
    CatalogDto(id: 116, name: "Gran sabueso anglo-francés tricolor"),
    CatalogDto(id: 117, name: "Grifón de Bruselas"),
    CatalogDto(id: 118, name: "Grifón de muestra bohemio de pelo duro"),
    CatalogDto(id: 119, name: "Grifón de muestra de pelo duro"),
    CatalogDto(id: 120, name: "Grifón leonado de Bretaña"),
    CatalogDto(id: 121, name: "Grifón Nivernais"),
    CatalogDto(id: 122, name: "Harrier"),
    CatalogDto(id: 123, name: "Hokkaido"),
    CatalogDto(id: 124, name: "Hovawart"),
    CatalogDto(id: 125, name: "Husky siberiano"),
    CatalogDto(id: 126, name: "Jack Russell Terrier"),
    CatalogDto(id: 127, name: "Jamthund"),
    CatalogDto(id: 128, name: "Kai"),
    CatalogDto(id: 129, name: "Kelpie australiano"),
    CatalogDto(id: 130, name: "Kerry Blue Terrier"),
    CatalogDto(id: 131, name: "King Charles Spaniel"),
    CatalogDto(id: 132, name: "Kishu"),
    CatalogDto(id: 133, name: "Komondor"),
    CatalogDto(id: 134, name: "Kromfohrlander"),
    CatalogDto(id: 135, name: "Kuvasz"),
    CatalogDto(id: 136, name: "Labrador Retriever"),
    CatalogDto(id: 137, name: "Lagotto Romagnolo"),
    CatalogDto(id: 138, name: "Laika de Siberia occidental"),
    CatalogDto(id: 139, name: "Laika de Siberia oriental"),
    CatalogDto(id: 140, name: "Laika ruso europeo"),
    CatalogDto(id: 141, name: "Lakeland Terrier"),
    CatalogDto(id: 142, name: "Landseer"),
    CatalogDto(id: 143, name: "Lebrel escocés"),
    CatalogDto(id: 144, name: "Lebrel húngaro"),
    CatalogDto(id: 145, name: "Lebrel irlandés"),
    CatalogDto(id: 146, name: "Leonberger"),
    CatalogDto(id: 147, name: "Lhasa Apso"),
    CatalogDto(id: 148, name: "Lundehund"),
    CatalogDto(id: 149, name: "Manchester Terrier"),
    CatalogDto(id: 150, name: "Mastín del Pirineo"),
    CatalogDto(id: 151, name: "Mastín español"),
    CatalogDto(id: 152, name: "Mastín inglés"),
    CatalogDto(id: 153, name: "Mastín napolitano"),
    CatalogDto(id: 154, name: "Mudi"),
    CatalogDto(id: 155, name: "Munsterlander pequeño"),
    CatalogDto(id: 156, name: "Otterhound"),
    CatalogDto(id: 157, name: "Papillón"),
    CatalogDto(id: 158, name: "Parson Russell Terrier"),
    CatalogDto(id: 159, name: "Pastor alemán"),
    CatalogDto(id: 160, name: "Pastor belga"),
    CatalogDto(id: 161, name: "Pastor Blanco Suizo"),
    CatalogDto(id: 162, name: "Pastor de Anatolia"),
    CatalogDto(id: 163, name: "Pastor de Bosnia-Herzegovina y Croacia"),
    CatalogDto(id: 164, name: "Pastor de Brie"),
    CatalogDto(id: 165, name: "Pastor de Karst"),
    CatalogDto(id: 166, name: "Pastor de las islas Shetland"),
    CatalogDto(id: 167, name: "Pastor de los Pirineos"),
    CatalogDto(id: 168, name: "Pastor de Maremma"),
    CatalogDto(id: 169, name: "Pastor de Picardía"),
    CatalogDto(id: 170, name: "Pastor de Tatra"),
    CatalogDto(id: 171, name: "Pastor del Cáucaso"),
    CatalogDto(id: 172, name: "Pastor eslovaco"),
    CatalogDto(id: 173, name: "Pastor finlandés de Laponia"),
    CatalogDto(id: 174, name: "Pastor ganadero australiano"),
    CatalogDto(id: 175, name: "Pastor holandés"),
    CatalogDto(id: 176, name: "Pastor islandés"),
    CatalogDto(id: 177, name: "Pastor lapón de Suecia"),
    CatalogDto(id: 178, name: "Pastor mallorquín"),
    CatalogDto(id: 179, name: "Pastor ovejero australiano"),
    CatalogDto(id: 180, name: "Pastor polaco de las llanuras"),
    CatalogDto(id: 181, name: "Pastor rumano de Mioritza"),
    CatalogDto(id: 182, name: "Pastor ucraniano"),
    CatalogDto(id: 183, name: "Pastor Yugoslavo"),
    CatalogDto(id: 184, name: "Pekinés"),
    CatalogDto(id: 185, name: "Pequeño Basset Grifón vendeano"),
    CatalogDto(id: 186, name: "Pequeño Brabantino"),
    CatalogDto(id: 187, name: "Pequeño perro león"),
    CatalogDto(id: 188, name: "Pequeño perro ruso"),
    CatalogDto(id: 189, name: "Pequeño sabueso de Suiza"),
    CatalogDto(id: 190, name: "Perdiguero alemán"),
    CatalogDto(id: 191, name: "Perdiguero de Burgos"),
    CatalogDto(id: 192, name: "Perdiguero de Drente"),
    CatalogDto(id: 193, name: "Perdiguero frisón"),
    CatalogDto(id: 194, name: "Perdiguero portugués"),
    CatalogDto(id: 195, name: "Perro de agua americano"),
    CatalogDto(id: 196, name: "Perro de agua español"),
    CatalogDto(id: 197, name: "Perro de agua francés"),
    CatalogDto(id: 198, name: "Perro de agua frisón"),
    CatalogDto(id: 199, name: "Perro de agua irlandés"),
    CatalogDto(id: 200, name: "Perro de agua portugués"),
    CatalogDto(id: 201, name: "Perro de Canaán"),
    CatalogDto(id: 202, name: "Perro de Castro Laboreiro"),
    CatalogDto(id: 203, name: "Perro de caza polaco"),
    CatalogDto(id: 204, name: "Perro de Chindo"),
    CatalogDto(id: 205, name: "Perro de Groenlandia"),
    CatalogDto(id: 206, name: "Perro de la Sierra de la Estrela"),
    CatalogDto(id: 207, name: "Perro de montaña de Formosa"),
    CatalogDto(id: 208, name: "Perro de montaña de los Pirineos"),
    CatalogDto(id: 209, name: "Perro de Montaña del Atlas"),
    CatalogDto(id: 210, name: "Perro de muestra alemán de pelo cerdoso"),
    CatalogDto(id: 211, name: "Perro de muestra alemán de pelo duro"),
    CatalogDto(id: 212, name: "Perro de osos de Carelia"),
    CatalogDto(id: 213, name: "Perro de San Huberto"),
    CatalogDto(id: 214, name: "Perro esquimal canadiense"),
    CatalogDto(id: 215, name: "Perro Finlandés de Laponia"),
    CatalogDto(id: 216, name: "Perro lobo checoslovaco"),
    CatalogDto(id: 217, name: "Perro lobo de Saarloos"),
    CatalogDto(id: 218, name: "Perro pastor catalán"),
    CatalogDto(id: 219, name: "Perro pastor croata"),
    CatalogDto(id: 220, name: "Perro pastor de Asia central"),
    CatalogDto(id: 221, name: "Perro pastor portugués"),
    CatalogDto(id: 222, name: "Perro sin pelo del Perú"),
    CatalogDto(id: 223, name: "Perro tejonero de Westfalia"),
    CatalogDto(id: 224, name: "Pharaoh Hound"),
    CatalogDto(id: 225, name: "Pinscher"),
    CatalogDto(id: 226, name: "Pinscher austríaco"),
    CatalogDto(id: 227, name: "Podenco canario"),
    CatalogDto(id: 228, name: "Podenco ibicenco"),
    CatalogDto(id: 229, name: "Podenco portugués"),
    CatalogDto(id: 230, name: "Pointer inglés"),
    CatalogDto(id: 231, name: "Poitevino"),
    CatalogDto(id: 232, name: "Pomerania"),
    CatalogDto(id: 233, name: "Porcelana"),
    CatalogDto(id: 234, name: "Presa Canario"),
    CatalogDto(id: 235, name: "Pudelpointer"),
    CatalogDto(id: 236, name: "Pug"),
    CatalogDto(id: 237, name: "Puli"),
    CatalogDto(id: 238, name: "Pumi"),
    CatalogDto(id: 239, name: "Rafeiro do Alentejo"),
    CatalogDto(id: 240, name: "Ratonero holandés"),
    CatalogDto(id: 241, name: "Retriever de Chesapeake"),
    CatalogDto(id: 242, name: "Retriever de Nueva Escocia"),
    CatalogDto(id: 243, name: "Ridgeback tailandés"),
    CatalogDto(id: 244, name: "Rottweiler"),
    CatalogDto(id: 245, name: "Sabueso anglo-francés de tamaño mediano"),
    CatalogDto(id: 246, name: "Sabueso artesiano"),
    CatalogDto(id: 247, name: "Sabueso bávaro de montaña"),
    CatalogDto(id: 248, name: "Sabueso de Bosnia de pelo cerdoso"),
    CatalogDto(id: 249, name: "Sabueso de Hamilton"),
    CatalogDto(id: 250, name: "Sabueso de Hannover"),
    CatalogDto(id: 251, name: "Sabueso de Hygen"),
    CatalogDto(id: 252, name: "Sabueso de Istria de pelo corto"),
    CatalogDto(id: 253, name: "Sabueso de Istria de pelo duro"),
    CatalogDto(id: 254, name: "Sabueso de montaña de Montenegro"),
    CatalogDto(id: 255, name: "Sabueso de Schiller"),
    CatalogDto(id: 256, name: "Sabueso de Småland"),
    CatalogDto(id: 257, name: "Sabueso del Ariège"),
    CatalogDto(id: 258, name: "Sabueso del Tirol"),
    CatalogDto(id: 259, name: "Sabueso del Valle de Save"),
    CatalogDto(id: 260, name: "Sabueso eslovaco"),
    CatalogDto(id: 261, name: "Sabueso español"),
    CatalogDto(id: 262, name: "Sabueso estirio de pelo áspero"),
    CatalogDto(id: 263, name: "Sabueso finlandés"),
    CatalogDto(id: 264, name: "Sabueso francés blanco y naranja"),
    CatalogDto(id: 265, name: "Sabueso francés blanco y negro"),
    CatalogDto(id: 266, name: "Sabueso francés tricolor"),
    CatalogDto(id: 267, name: "Sabueso Halden"),
    CatalogDto(id: 268, name: "Sabueso helénico"),
    CatalogDto(id: 269, name: "Sabueso italiano"),
    CatalogDto(id: 270, name: "Sabueso noruego"),
    CatalogDto(id: 271, name: "Sabueso polaco"),
    CatalogDto(id: 272, name: "Sabueso serbio"),
    CatalogDto(id: 273, name: "Sabueso suizo"),
    CatalogDto(id: 274, name: "Sabueso tricolor serbio"),
    CatalogDto(id: 275, name: "Saluki"),
    CatalogDto(id: 276, name: "Samoyedo"),
    CatalogDto(id: 277, name: "San Bernardo"),
    CatalogDto(id: 278, name: "Schapendoes neerlandés"),
    CatalogDto(id: 279, name: "Schipperke"),
    CatalogDto(id: 280, name: "Schnauzer"),
    CatalogDto(id: 281, name: "Sealyham terrier"),
    CatalogDto(id: 282, name: "Setter inglés"),
    CatalogDto(id: 283, name: "Setter irlandés"),
    CatalogDto(id: 284, name: "Setter irlandés rojo y blanco"),
    CatalogDto(id: 285, name: "Shar Pei"),
    CatalogDto(id: 286, name: "Shiba Inu"),
    CatalogDto(id: 287, name: "Shih Tzu"),
    CatalogDto(id: 288, name: "Shikoku Inu"),
    CatalogDto(id: 289, name: "Skye Terrier"),
    CatalogDto(id: 290, name: "Sloughi"),
    CatalogDto(id: 291, name: "Spaniel azul de Picardía"),
    CatalogDto(id: 292, name: "Spaniel bretón"),
    CatalogDto(id: 293, name: "Spaniel de Pont-Audemer"),
    CatalogDto(id: 294, name: "Spaniel francés"),
    CatalogDto(id: 295, name: "Spaniel holandés"),
    CatalogDto(id: 296, name: "Spaniel japonés"),
    CatalogDto(id: 297, name: "Spaniel picardo"),
    CatalogDto(id: 298, name: "Spaniel tibetano"),
    CatalogDto(id: 299, name: "Spinone italiano"),
    CatalogDto(id: 300, name: "Spitz de Norrbotten"),
    CatalogDto(id: 301, name: "Spitz finlandés"),
    CatalogDto(id: 302, name: "Spitz japonés"),
    CatalogDto(id: 303, name: "Springer spaniel galés"),
    CatalogDto(id: 304, name: "Springer Spaniel inglés"),
    CatalogDto(id: 305, name: "Staffordshire bull terrier"),
    CatalogDto(id: 306, name: "Sussex Spaniel"),
    CatalogDto(id: 307, name: "Teckel"),
    CatalogDto(id: 308, name: "Terranova"),
    CatalogDto(id: 309, name: "Terrier alemán"),
    CatalogDto(id: 310, name: "Terrier australiano"),
    CatalogDto(id: 311, name: "Terrier brasileño"),
    CatalogDto(id: 312, name: "Terrier checo"),
    CatalogDto(id: 313, name: "Terrier de Norfolk y Terrier de Norwich"),
    CatalogDto(id: 314, name: "Terrier escocés"),
    CatalogDto(id: 315, name: "Terrier galés"),
    CatalogDto(id: 316, name: "Terrier Glen de Imaal irlandés"),
    CatalogDto(id: 317, name: "Terrier inglés miniatura"),
    CatalogDto(id: 318, name: "Terrier irlandés"),
    CatalogDto(id: 319, name: "Terrier irlandés de pelo suave"),
    CatalogDto(id: 320, name: "Terrier japonés"),
    CatalogDto(id: 321, name: "Terrier ruso negro"),
    CatalogDto(id: 322, name: "Terrier tibetano"),
    CatalogDto(id: 323, name: "Tosa Inu"),
    CatalogDto(id: 324, name: "Vallhund sueco"),
    CatalogDto(id: 325, name: "Vizsla"),
    CatalogDto(id: 326, name: "Volpino italiano"),
    CatalogDto(id: 327, name: "Westie"),
    CatalogDto(id: 328, name: "Whippet"),
    CatalogDto(id: 329, name: "Xoloitzcuintle"),
    CatalogDto(id: 330, name: "Yorkshire Terrier"),
    CatalogDto(id: 331, name: "Otro"),
  ];

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return kBreeds
            .where((CatalogDto option) {
              return option.name
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            })
            .map((CatalogDto option) => option.name);
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: const InputDecoration(
            hintText: "Raza",
          ),
          onFieldSubmitted: (String value) {
            onFieldSubmitted();
          },
        );
      },
      onSelected: (option) => context.read<AddPetCubit>().setBreed(option),
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: SizedBox(
              height: 200.0,
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final String option = options.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                      context.read<AddPetCubit>().setBreedId(
                        kBreeds.where((element) => element.name == option).first.id,
                      );
                    },
                    child: ListTile(
                      title: Text(option),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
