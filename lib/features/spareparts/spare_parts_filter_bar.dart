// ignore_for_file: prefer_const_constructors

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:nmmcrevise/api_services/spare_parts_api_services.dart';


///WIP relocation of filter bar widgets
///
class spareFilterBar extends StatefulWidget {
  const spareFilterBar({Key? key}) : super(key: key);

  @override
  State<spareFilterBar> createState() => _spareFilterBarState();
}

class _spareFilterBarState extends State<spareFilterBar> {
  Widget FilterBars(Future<List<dynamic>> dyna) {
    var w = MediaQuery.of(context).size.width;

    return Container(
      child: FutureBuilder<List<dynamic>>(
        future: dyna,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                dyna = SparePartsAPI().fetchPartsInStock();
                              });
                            },
                            child: Text(
                              "Available",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                dyna = SparePartsAPI().fetchPartsOutofStock();
                              });
                            },
                            child: Text(
                              "Unavailable",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(width: w / 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: w * 0.25,
                              ),
                              NameDropDownButton(dyna),
                              SizedBox(
                                width: 15,
                              ),
                              QuantityDropdown(dyna),
                              SizedBox(
                                width: 15,
                              ),
                              TagsDropdown(dyna),
                              SizedBox(
                                width: 15,
                              ),
                              BrandDropdown(dyna),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error.toString()}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget NameDropDownButton(Future<List<dynamic>> dyna) {
    String? selectedValue;
    String name;

    return Container(
      child: FutureBuilder<List<dynamic>>(
        future: dyna,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Column(
                children: [
                  Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Text(
                          'Select Name',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: <String>[
                          'Name',
                          for (var i = 0; i < snapshot.data!.length; i++)
                            snapshot.data![i].name,
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          );
                        }).toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          if (value == 'Name') {
                            setState(() {
                              dyna = SparePartsAPI().fetchParts();
                            });
                          } else {
                            setState(() {
                              dyna = SparePartsAPI()
                                  .fetchPartsName(value.toString());
                            });
                          }
                        },
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        buttonHeight: 40,
                        buttonWidth: 120,
                        itemHeight: 40,
                        dropdownMaxHeight: 200,
                        searchInnerWidget: Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 4,
                            right: 8,
                            left: 8,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error.toString()}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget TagsDropdown(Future<List<dynamic>> dyna) {
    String? selectedValue;

    return Container(
      child: FutureBuilder<List<dynamic>>(
        future: dyna,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Column(
                children: [
                  Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Text(
                          'Select Tags',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: <String>[
                          'Tags',
                          for (var i = 0; i < snapshot.data!.length; i++)
                            snapshot.data![i].tag,
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          );
                        }).toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          if (value == 'Tags') {
                            setState(() {
                              dyna = SparePartsAPI().fetchParts();
                            });
                          } else {
                            setState(() {
                              dyna = SparePartsAPI()
                                  .fetchPartsTag(value.toString());
                            });
                          }
                        },
                        buttonHeight: 40,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        buttonWidth: 120,
                        itemHeight: 40,
                        dropdownMaxHeight: 200,
                        searchInnerWidget: Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 4,
                            right: 8,
                            left: 8,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error.toString()}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget BrandDropdown(Future<List<dynamic>> dyna) {
    String? selectedValue;

    return Container(
      child: FutureBuilder<List<dynamic>>(
        future: dyna,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Column(
                children: [
                  Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Text(
                          'Select Brand',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: <String>[
                          'Brand',
                          for (var i = 0; i < snapshot.data!.length; i++)
                            snapshot.data![i].brand,
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          );
                        }).toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          if (value == 'Brand') {
                            setState(() {
                              dyna =SparePartsAPI().fetchParts();
                            });
                          } else {
                            setState(() {
                              dyna =SparePartsAPI()
                                  .fetchPartsByBrand(value.toString());
                            });
                          }
                        },
                        buttonDecoration: BoxDecoration(),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        buttonHeight: 40,
                        buttonWidth: 120,
                        itemHeight: 40,
                        dropdownMaxHeight: 200,
                        searchInnerWidget: Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 4,
                            right: 8,
                            left: 8,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error.toString()}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget QuantityDropdown(Future<List<dynamic>> dyna) {
    final List<String> items = [
      'Max',
      'Min',
    ];

    String? selectedValue;
    final TextEditingController textEditingController = TextEditingController();
    final TextEditingController textEditingController2 =
        TextEditingController();

    return Container(
      child: Column(
        children: [
          Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Text(
                  'Select Quantity',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  int min = int.parse(textEditingController.text);
                  int max = int.parse(textEditingController2.text);

                  setState(() {
                    selectedValue = value as String;
                    if (value == 'Max') {
                      setState(() {
                        dyna = SparePartsAPI().fetchPartsByQuantity(100, 450);
                      });
                    } else if (value == 'Min') {
                      setState(() {
                        dyna = SparePartsAPI().fetchPartsByQuantity(0, 10);
                      });
                    }
                  });
                },
                buttonHeight: 40,
                buttonWidth: 200,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                itemHeight: 40,
                dropdownMaxHeight: 200,
                searchInnerWidget: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          hintText: 'Minimum range',
                          hintStyle: const TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: textEditingController2,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          hintText: 'Maximum Range',
                          hintStyle: const TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            dyna = SparePartsAPI().fetchPartsByQuantity(
                                int.parse(textEditingController.text),
                                int.parse(textEditingController2.text));
                          });
                        },
                        child: Text(
                          "Set Custom Range",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
