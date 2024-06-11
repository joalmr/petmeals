import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:petmeals/src/features/pet/domain/entities/pet.dart';
import 'package:petmeals/src/features/pet/presentation/views/detail/modal/actions/food.dart';
import 'package:petmeals/src/features/pet/presentation/views/detail/modal/actions/leash.dart';
import 'package:petmeals/src/features/pet/presentation/views/detail/modal/actions/litter.dart';
import 'package:petmeals/src/features/pet/presentation/views/detail/modal/attentions/deworming.dart';
import 'package:petmeals/src/features/pet/presentation/views/detail/modal/attentions/grooming.dart';
import 'package:petmeals/src/features/pet/presentation/views/detail/modal/attentions/vaccine.dart';
import 'package:petmeals/src/features/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/src/core/app/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmeals/src/features/pet/presentation/widgets/edit.pet.dart';
import 'package:petmeals/src/shared/shared.dart';
import 'package:provider/provider.dart';

class PetDetailPage extends StatefulWidget {
  const PetDetailPage({super.key, required this.myPet});
  final PetEntity myPet;

  @override
  State<PetDetailPage> createState() => _PetDetailPageState();
}

class _PetDetailPageState extends State<PetDetailPage> {
  late ValueNotifier<PetEntity> myPetEdited =
      ValueNotifier<PetEntity>(widget.myPet);

  @override
  void initState() {
    super.initState();
    final petProvider = context.read<PetProvider>();
    Future.microtask(() => petProvider.getAttentions(myPetEdited.value.id!));

    myPetEdited.addListener(() {
      Logger().w('cambio: ${myPetEdited.value.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final petProvider = context.read<PetProvider>();
    final petWatch = context.watch<PetProvider>();
    final f = DateFormat('dd/MM/yyyy');

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const SizedBox(height: 270),
                SizedBox(
                  height: 220,
                  width: double.maxFinite,
                  child: Image(
                    image: CachedNetworkImageProvider(myPetEdited.value.photo!),
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 16,
                  left: 10,
                  child: BackBtn(),
                ),
                Positioned(
                  top: 16,
                  right: 10,
                  child: EditPetWidget(myPet: widget.myPet),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.10,
                  right: MediaQuery.of(context).size.width * 0.10,
                  bottom: 0,
                  child: ClipRect(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 25,
                          sigmaY: 25,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          height: 100,
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    myPetEdited.value.name!,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${myPetEdited.value.age!} ${myPetEdited.value.age == 1 ? 'año' : 'años'}',
                                    style: const TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    myPetEdited.value.sterillized!
                                        ? 'Estirilizado'
                                        : 'No esterilizado',
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              myPetEdited.value.sex!
                                  ? Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF52B5E9),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.male,
                                          color: kTextColorContrast,
                                          size: 32,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFF87C9A),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.female,
                                          color: kTextColorContrast,
                                          size: 32,
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: kBackgroundColor,
                        showDragHandle: true,
                        builder: (ctx) {
                          return FoodPetPage(myPet: myPetEdited);
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: kPrimaryColor,
                            ),
                            color: kBackgroundColor,
                          ),
                          height: 64,
                          width: 64,
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'assets/images/icons/pet-food.svg',
                                height: 40,
                                width: 40,
                              ),
                              const Text(
                                'Alimentos',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Visibility(
                    visible: myPetEdited.value.specie! != 2,
                    child: GestureDetector(
                      onTap: () {
                        if (myPetEdited.value.specie == 0) {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: kBackgroundColor,
                            showDragHandle: true,
                            builder: (ctx) {
                              return LitterPetPage(myPet: myPetEdited);
                            },
                          );
                        } else {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: kBackgroundColor,
                            showDragHandle: true,
                            builder: (ctx) {
                              return LeashPetPage(myPet: myPetEdited);
                            },
                          );
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: kPrimaryColor,
                              ),
                              color: kBackgroundColor,
                            ),
                            height: 64,
                            width: 64,
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  myPetEdited.value.specie! == 0
                                      ? 'assets/images/icons/cat-litter.svg'
                                      : 'assets/images/icons/leash.svg',
                                  height: 40,
                                  width: 40,
                                ),
                                Text(
                                  myPetEdited.value.specie! == 0
                                      ? 'Arena'
                                      : 'Paseos',
                                  style: const TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 24,
              ),
              child: Text(
                'Atenciones realizadas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: petProvider.attentions.isEmpty
                  ? const Center(
                      child: Text('No tiene atenciones registradas'),
                    )
                  : ListView.builder(
                      itemCount: petWatch.attentions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          key: UniqueKey(),
                          background: Container(
                            color: negativeColor,
                          ),
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (direction) {
                            return showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                  'Eliminar',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: const Text(
                                    'Seguro que desea eliminar la atención?'),
                                actions: [
                                  ButtonSecondary(
                                    text: 'Eliminar',
                                    onPressed: () {
                                      petProvider.deleteAttention(
                                        petProvider.attentions[index].id!,
                                        myPetEdited.value.id!,
                                      );
                                      petProvider.notAttention(index);
                                      context.pop();
                                    },
                                    color: negativeColor,
                                  ),
                                  ButtonSecondary(
                                    text: 'Cancelar',
                                    onPressed: () => context.pop(),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 12,
                            ),
                            width: double.maxFinite,
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset(
                                        'assets/images/icons_att/${petWatch.attentions[index].type}.png',
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 4,
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                    width: double.maxFinite,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          petWatch.attentions[index].product!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          f.format(petProvider
                                              .attentions[index].date!),
                                          style: const TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Flexible(
                                  flex: 1,
                                  child: Icon(
                                    Icons.check_circle_rounded,
                                    color: Color(0xFF54D517),
                                    size: 32,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Align(
              alignment: FractionalOffset.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SizedBox(
                  width: 192,
                  child: ButtonPrimary(
                    child: const Text('Agregar Atención'),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: kBackgroundColor,
                        showDragHandle: true,
                        builder: (BuildContext context) {
                          int service = 0;
                          return StatefulBuilder(
                              builder: (BuildContext context, setState) {
                            return Scaffold(
                              backgroundColor: Colors.transparent,
                              appBar: const PreferredSize(
                                preferredSize: Size.fromHeight(60),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Seleccionar Atención',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              body: Column(
                                children: [
                                  const SizedBox(height: 42),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            service = 1;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: kPrimaryColor),
                                            color: service == 1
                                                ? kPrimaryColor
                                                : kBackgroundColor,
                                          ),
                                          width: 90,
                                          height: 100,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 4, 8, 2),
                                                child: Image.asset(
                                                  'assets/images/icons_att/deworming.png',
                                                  color: service == 1
                                                      ? kBackgroundColor
                                                      : kPrimaryColor,
                                                ),
                                              ),
                                              Text(
                                                'Desparasitación',
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  color: service == 1
                                                      ? kBackgroundColor
                                                      : kPrimaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            service = 2;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: kPrimaryColor),
                                            color: service == 2
                                                ? kPrimaryColor
                                                : kBackgroundColor,
                                          ),
                                          width: 90,
                                          height: 100,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 4, 8, 2),
                                                child: Image.asset(
                                                  'assets/images/icons_att/grooming.png',
                                                  color: service == 2
                                                      ? kBackgroundColor
                                                      : kPrimaryColor,
                                                ),
                                              ),
                                              Text(
                                                'Baño',
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  color: service == 2
                                                      ? kBackgroundColor
                                                      : kPrimaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            service = 3;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: kPrimaryColor),
                                            color: service == 3
                                                ? kPrimaryColor
                                                : kBackgroundColor,
                                          ),
                                          width: 90,
                                          height: 100,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 4, 8, 2),
                                                child: Image.asset(
                                                  'assets/images/icons_att/vaccine.png',
                                                  color: service == 3
                                                      ? kBackgroundColor
                                                      : kPrimaryColor,
                                                ),
                                              ),
                                              Text(
                                                'Vacuna',
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  color: service == 3
                                                      ? kBackgroundColor
                                                      : kPrimaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 72),
                                  Container(
                                    margin: const EdgeInsets.all(32),
                                    width: double.maxFinite,
                                    child: ButtonPrimary(
                                      child: const Text('Continuar'),
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          backgroundColor: kBackgroundColor,
                                          showDragHandle: true,
                                          isScrollControlled: true,
                                          builder: (ctx) {
                                            return Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.6,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: service == 1
                                                  ? const DewormingPage()
                                                  : (service == 2)
                                                      ? const GroomingPage()
                                                      : const VaccinePage(),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
