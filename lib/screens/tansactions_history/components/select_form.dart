import 'package:flutter/material.dart';
import 'package:flutter_test_task/const/constants.dart';
import 'package:flutter_test_task/const/size_config.dart';
import 'package:flutter_test_task/screens/tansactions_history/components/date_picker_button.dart';
import 'package:flutter_test_task/screens/tansactions_history/components/list_picker.dart';

class SelectForm extends StatefulWidget {
  const SelectForm({Key? key}) : super(key: key);

  @override
  State<SelectForm> createState() => _SelectRouteFormState();
}

class _SelectRouteFormState extends State<SelectForm> {
  final listPickerField1 = ListPickerField(
    label: "Сurrency",
    items: const [
      "USD",
      "EUR",
      "JPY",
      "GBP",
      "AUD",
      "CAD",
      "CHF",
    ],
  );

  final listPickerField2 = ListPickerField(
    label: "Сompany",
    items: const [
      "All",
      "Pret A Manager",
      "Darren Hodgkin",
      "Mc Donalds",
      "Sturbacks",
      "Dave Winklevoss",
      "Virgin Megastore",
      "Nike",
      "Louis Vuitton",
      "Carrefour",
    ],
  );

  final datePickerField = DatePickerField(
    label: "Date",
  );

  bool isAllFieldsFilledIn = false;

  List days = [
    {
      "day": "Yesterday",
      "dayInfo": [
        {
          "logo": "assets/images/pret_a_manager.png",
          "name": "Pret A Manager",
          "time": "12:23",
          "currency": "USD",
          "delta": "-55.31"
        },
        {
          "logo": "assets/images/darren_hodgkin.png",
          "name": "Darren Hodgkin",
          "time": "12:23",
          "currency": "USD",
          "delta": "+130.31"
        },
        {
          "logo": "assets/images/mc_donalds.png",
          "name": "Mc Donalds",
          "time": "12:23",
          "currency": "USD",
          "delta": "-55.31"
        },
      ]
    },
    {
      "day": "Sat, Dec 11",
      "dayInfo": [
        {
          "logo": "assets/images/dave_winklevoss.png",
          "name": "Dave Winklevoss",
          "time": "12:23",
          "currency": "USD",
          "delta": "-300.00"
        },
        {
          "logo": "assets/images/virgin_megastore.png",
          "name": "Virgin Megastore",
          "time": "12:23",
          "currency": "USD",
          "delta": "-500.31"
        },
        {
          "logo": "assets/images/sturbacks.png",
          "name": "Sturbacks",
          "time": "12:23",
          "currency": "USD",
          "delta": "-55.31"
        },
        {
          "logo": "assets/images/nike.png",
          "name": "Nike",
          "time": "12:23",
          "currency": "USD",
          "delta": "-500.31"
        }
      ]
    },
    {
      "day": "Thurs, Dec 9",
      "dayInfo": [
        {
          "logo": "assets/images/louis_vuitton.png",
          "name": "Louis Vuitton",
          "time": "12:23",
          "currency": "USD",
          "delta": "-500.31"
        },
        {
          "logo": "assets/images/nike.png",
          "name": "Nike",
          "time": "12:23",
          "currency": "USD",
          "delta": "-500.31"
        },
        {
          "logo": "assets/images/carrefour.png",
          "name": "Carrefour",
          "time": "12:23",
          "currency": "USD",
          "delta": "-500.31"
        }
      ]
    }
  ];

  void checkFieldsFilled() {
    if (listPickerField1.value.isNotEmpty &&
        listPickerField2.value.isNotEmpty &&
        datePickerField.value.isNotEmpty) {
      setState(() {
        isAllFieldsFilledIn = true;
      });
    } else {
      setState(() {
        isAllFieldsFilledIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        listPickerField1,
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Row(
          children: [
            Expanded(
              child: listPickerField2,
              flex: 6,
            ),
            SizedBox(
              width: getProportionateScreenWidth(15),
            ),
            Expanded(
              child: datePickerField,
              flex: 1,
            ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        TextButton(
          style: TextButton.styleFrom(side: BorderSide(color: kTextColor)),
          onPressed: () {
            checkFieldsFilled();
          },
          child: Text(
            'Search',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
                color: kSecondaryTextColor),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        (isAllFieldsFilledIn)
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: days.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 1),
                    color: kGreyTextColor,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${days[index]["day"]}",
                              style: TextStyle(
                                  color: kDarkTextColor,
                                  fontSize: getProportionateScreenWidth(20)),
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index2) {
                            return Container(
                              margin: EdgeInsets.only(top: 1),
                              padding: EdgeInsets.all(10),
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      days[index]["dayInfo"][index2]["logo"],
                                      fit: BoxFit.fill,
                                    ),
                                    radius: 20,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(10),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "${days[index]["dayInfo"][index2]["name"]}\n${days[index]["dayInfo"][index2]["time"]}",
                                              style: TextStyle(
                                                color: kDarkTextColor,
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        15),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "${days[index]["dayInfo"][index2]["delta"]} ${days[index]["dayInfo"][index2]["currency"]}",
                                              style: TextStyle(
                                                color: kDarkTextColor,
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        15),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              )
            : SizedBox(),
      ],
    );
  }
}
