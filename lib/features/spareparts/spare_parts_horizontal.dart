// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nmmcrevise/api_services/spare_parts_api_services.dart';
import 'package:nmmcrevise/features/product/product_preview.dart';


class SparePartsHorizontal extends StatefulWidget {
  const SparePartsHorizontal({Key? key}) : super(key: key);

  @override
  State<SparePartsHorizontal> createState() => _SparePartsHorizontal();
}

class _SparePartsHorizontal extends State<SparePartsHorizontal> {
  late Future<List<dynamic>> dyna;

  late Future<dynamic> dynna;
  String stauts = "The Hottest Picks";
  double textHeaderSize = 25;

  bool switchSearchName = false;
  bool switchSearchTag = false;
  bool switchSearchType = false;
  late String status = "Search your Items Here";

  @override
  initState() {
    super.initState();
    dyna = SparePartsAPI().fetchParts();
    dynna = SparePartsAPI().fetchPartsByFrequencyAsc();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    TextEditingController controller = TextEditingController();


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Wrap(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.motorcycle,
                          color: Color.fromARGB(255, 38, 110, 177),
                          size: 60,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "NMMC",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 38, 110, 177),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 70),
                    FutureBuilder<List<dynamic>>(
                      future: dyna,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Wrap(
                            children: [
                              SizedBox(height: 200),
                              HottestPicks(),
                              SizedBox(height: w * 0.35),
                              TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: status,
                                  suffixIcon: Icon(Icons.search),
                                  counter: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(width: 10),
                                      Text(
                                        "Filter the Search through:",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black45,
                                        ),
                                      ),
                                      SizedBox(width: 10, height: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            switchSearchName = true;
                                            switchSearchTag = false;
                                            switchSearchType = false;
                                            status = "Search parts by Name";
                                            dyna =  SparePartsAPI().fetchParts();
                                          });
                                        },
                                        child: Text(
                                          "Name",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            switchSearchName = false;
                                            switchSearchTag = true;
                                            switchSearchType = false;
                                            status = "Search parts by Tag";
                                            dyna = SparePartsAPI().fetchParts();
                                            controller.clear();
                                          });
                                        },
                                        child: Text(
                                          "Tags",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            switchSearchName = false;
                                            switchSearchType = true;
                                            switchSearchTag = false;
                                            status = "Search parts by Type";
                                            dyna = SparePartsAPI().fetchParts();
                                            controller.clear();
                                          });
                                        },
                                        child: Text(
                                          "Type",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            switchSearchName = false;
                                            switchSearchType = false;
                                            switchSearchTag = false;
                                            status =
                                                "Input Desired Search Item Here";
                                            dyna =  SparePartsAPI().fetchParts();
                                            controller.clear();
                                          });
                                        },
                                        child: Text(
                                          "All",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 20,
                                  ),
                                ),
                                autofocus: true,
                                onChanged: (text) {
                                  setState(() {
                                    if (switchSearchName == true &&
                                        switchSearchTag == false &&
                                        switchSearchType == false) {
                                      dyna =
                                          SparePartsAPI().fetchPartsName(text);
                                    } else if (switchSearchName == false &&
                                        switchSearchTag == true &&
                                        switchSearchType == false) {
                                      dyna =
                                          SparePartsAPI().fetchPartsTag(text);
                                    } else if (switchSearchName == false &&
                                        switchSearchTag == false &&
                                        switchSearchType == true) {
                                      dyna =
                                          SparePartsAPI().fetchPartsTag(text);
                                    } else {
                                      dyna =
                                          SparePartsAPI().fetchPartsMix(text);
                                    }
                                  });
                                },
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Filter by",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    FilterBars(),
                                    GridView.builder(
                                      primary: false,
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Wrap(
                                              children: [
                                                Container(
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Container(
                                                      child: SizedBox(
                                                        width: 350,
                                                        height: 206,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        ProdPreview(
                                                                  name: snapshot
                                                                      .data![
                                                                          index]
                                                                      .name,
                                                                  warehouse: snapshot
                                                                      .data![
                                                                          index]
                                                                      .brand,
                                                                  quantity: snapshot
                                                                      .data![
                                                                          index]
                                                                      .quantity,
                                                                  id: snapshot
                                                                      .data![
                                                                          index]
                                                                      .id,
                                                                  brand: snapshot
                                                                      .data![
                                                                          index]
                                                                      .brand,
                                                                  Tag: snapshot
                                                                      .data![
                                                                          index]
                                                                      .tag,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Card(
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            child: Column(
                                                              children: [
                                                                Image.network(
                                                                  "data:image/jpeg;base64,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",
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width: 500,
                                                                  height: 100,
                                                                ),
                                                                ListTile(
                                                                  leading: Icon(
                                                                      Icons
                                                                          .shopping_cart),
                                                                  title: Text(
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .name,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                  subtitle:
                                                                      Text(
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .brand,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.6),
                                                                      fontSize:
                                                                          15,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Text(
                                                                      snapshot
                                                                          .data![
                                                                              index]
                                                                          .status,
                                                                      style: GoogleFonts
                                                                          .roboto(
                                                                        textStyle:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              38,
                                                                              110,
                                                                              177),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 1.0,
                                        crossAxisSpacing: 2.0,
                                        mainAxisSpacing: 10,
                                        mainAxisExtent: 250,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return SizedBox(
                            width: 350,
                            height: 206,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                        ProdPreview(
                                          name: "Parts",
                                          warehouse: "Some Warehouse",
                                          quantity: 200,
                                          id: "1",
                                          brand: "Dunlop",
                                          Tag: "solol",
                                        ),
                                  ),
                                );
                              },
                              child: Card(
                                clipBehavior:
                                Clip.antiAlias,
                                child: Column(
                                  children: [
                                    Image.network(
                                      "data:image/jpeg;base64,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",
                                      fit: BoxFit
                                          .cover,
                                      width: 500,
                                      height: 100,
                                    ),
                                    ListTile(
                                      leading: Icon(
                                          Icons
                                              .shopping_cart),
                                      title: Text(
                                        "Some Name",
                                        style:
                                        TextStyle(
                                          fontSize:
                                          18,
                                        ),
                                      ),
                                      subtitle:
                                      Text(
                                        "Dunlop",
                                        style:
                                        TextStyle(
                                          color: Colors
                                              .black
                                              .withOpacity(
                                              0.6),
                                          fontSize:
                                          15,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceAround,
                                      children: [
                                        Text(
                                          "Active",
                                          style: GoogleFonts
                                              .roboto(
                                            textStyle:
                                            TextStyle(
                                              fontSize:
                                              20,
                                              color: Color.fromARGB(
                                                  255,
                                                  38,
                                                  110,
                                                  177),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget FilterBars() {
    String valName = "Name";
    String valBrand = "Brand";
    String valTag = "Tags";
    String valQuant = "Quantity";
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return FutureBuilder<List<dynamic>>(
      future: dyna,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
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
                            dyna =  SparePartsAPI().fetchPartsInStock();
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
                            dyna =  SparePartsAPI().fetchPartsOutofStock();
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
                          NameDropDownButton(),
                          SizedBox(
                            width: 15,
                          ),
                          QuantityDropdown(),
                          SizedBox(
                            width: 15,
                          ),
                          TagsDropdown(),
                          SizedBox(
                            width: 15,
                          ),
                          BrandDropdown(),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error.toString()}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget NameDropDownButton() {
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
                              dyna =  SparePartsAPI().fetchParts();
                            });
                          } else {
                            setState(() {
                              dyna =  SparePartsAPI()
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

  Widget TagsDropdown() {
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
                              dyna =  SparePartsAPI().fetchParts();
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

  Widget BrandDropdown() {
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
                              dyna =  SparePartsAPI().fetchParts();
                            });
                          } else {
                            setState(() {
                              dyna =  SparePartsAPI()
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

  Widget QuantityDropdown() {
    final List<String> items = [
      '',
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
                              fontSize: 1,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                    if (value == 'Max') {
                      setState(() {
                        dyna =  SparePartsAPI().fetchPartsByQuantity(100, 450);
                      });
                    } else if (value == 'Min') {
                      setState(() {
                        dyna =  SparePartsAPI().fetchPartsByQuantityAlt(0, 10);
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
                            dyna =  SparePartsAPI().fetchPartsByQuantity(
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

  //Carousel
  Widget HottestPicks() {
    var w = MediaQuery.of(context).size.width;

    return Container(
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            stauts = "The Hottest picks";
                            dynna =  SparePartsAPI().fetchPartsByFrequencyAsc();
                          });
                        },
                        child: Text(
                          "Hottest",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            stauts = "The Newest picks";
                            dynna =  SparePartsAPI().fetchPartsByFrequencyDesc();
                          });
                        },
                        child: Text(
                          "Newest",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  stauts,
                  style: TextStyle(
                    color: Color.fromARGB(255, 38, 110, 177),
                    fontSize: textHeaderSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: w,
                  height: 250, //inside box
                  child: FutureBuilder<dynamic>(
                    future: dynna,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 240,
                                    height: 150,
                                    child: Column(
                                      children: [
                                        Image.network(
                                          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/pile-of-tires-on-white-background-royalty-free-image-672151801-1561751929.jpg?crop=1.00xw:0.629xh;0,0.318xh&resize=480:*',
                                          width: 200,
                                          height: 150,
                                        ),
                                        Row(
                                          children: [
                                            Center(
                                              child: Row(
                                                children: [
                                                  SizedBox(width: w / 20),
                                                  Text(
                                                    snapshot.data![index].name,
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                      color: Color.fromARGB(
                                                          255, 38, 110, 177),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error.toString()}');
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
