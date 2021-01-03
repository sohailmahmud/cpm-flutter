import 'package:dio/dio.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/widgets.dart';
import 'package:pro_health/ui/utilities/Constant.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';

class Prescription extends StatefulWidget {
  static String tag = 'Prescription';
  Prescription({Key key, this.title}) : super(key: key);

  final String title;

  @override
  PrescriptionState createState() => PrescriptionState();
}

class PrescriptionState extends State<Prescription> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardE = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardF = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardG = new GlobalKey();
  final _formKey = GlobalKey<FormState>();

  bool before = false;
  bool after = false;

  final brand = <Brand>[Brand('Fenuc Plus', ''), Brand('Mycin', ''), Brand('5-Fluril', ''), Brand('A-Clox', ''), Brand('Geocef', '')];
  Brand selectedBrand;

  final newPatient = <NewPatient>[NewPatient('Sohail', '12345'), NewPatient('Mahmud', '12345'), NewPatient('Sami', '12345'), NewPatient('Rony', '12345'), NewPatient('Alamin', '12345')];
  NewPatient selectedNewPatient;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  bool autovalidate = false;


  @override
  Widget build(BuildContext context) {
    final patientInfo = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            ExpansionTileCard(
              baseColor: kBackgroundColor,
              key: cardA,
              leading: CircleAvatar(child: Icon(Icons.wheelchair_pickup, color: Colors.white)),
              title: Text('Patient Information', style: TextStyle(fontFamily: 'Segoe', color: kBaseColor, fontSize: 16, fontWeight: FontWeight.w700),),
              children: <Widget>[
                SizedBox(height: 15,),
                ListTile(
                  title: Container(
                    child:
                    SimpleAutocompleteFormField<NewPatient>(
                      decoration: InputDecoration(
                        hintText: "Type Patient Name",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                      ),
                      suggestionsHeight: 80.0,
                      itemBuilder: (context, newPatient) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(newPatient.name,
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(newPatient.phone)
                            ]),
                      ),
                      onSearch: (search) async => newPatient
                          .where((newPatient) =>
                      newPatient.name
                          .toLowerCase()
                          .contains(search.toLowerCase()) ||
                          newPatient.phone
                              .toLowerCase()
                              .contains(search.toLowerCase()))
                          .toList(),
                      itemFromString: (string) => newPatient.singleWhere(
                              (newPatient) => newPatient.name.toLowerCase() == string.toLowerCase(),
                          orElse: () => null),
                      onChanged: (value) => setState(() => selectedNewPatient = value),
                      onSaved: (value) => setState(() => selectedNewPatient = value),
                      validator: (person) => person == null ? 'Invalid Patient.' : null,
                    ),
                  ),
                ),
                ListTile(
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: "Mobile Number",
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
                ListTile(
                  title: new DropdownButtonFormField(
                    decoration: new InputDecoration(
                      hintText: "Select Gender",
                      contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                    ),
                    items: <DropdownMenuItem>[
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text("Male"),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text("Female"),
                      ),
                    ],
                    onChanged: (val) => print(val),
                    onSaved: (val) => print(val),
                  ),
                ),
                ListTile(
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: "Age Number",
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
                /*CustomDropdown(
                        valueIndex: genderValue,
                        hint: "Select Gender",
                        items: [
                          CustomDropdownItem(text: "Male"),
                          CustomDropdownItem(text: "Female"),
                        ],
                        onChanged: (newValue) {
                          setState(() => genderValue = newValue);
                        },
                      ),*/
                /*DropdownButton(
                          items: _dropdownValues
                              .map((value) => DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          ))
                              .toList(),
                          onChanged: (String value) {},
                          isExpanded: false,
                          value: _dropdownValues.first,
                        contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                      ),*/
                SizedBox(height: 2,),
                Text('Address', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600), textAlign: TextAlign.left,),
                const Divider(
                  height: 4.0,
                  color: kTextLightColor,
                ),
                ListTile(
                  title: new DropdownButtonFormField(
                    decoration: new InputDecoration(
                      hintText: "Select District",
                      contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                    ),
                    items: <DropdownMenuItem>[
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text("Dhaka"),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text("Chittagong"),
                      ),
                    ],
                    onChanged: (val) => print(val),
                    onSaved: (val) => print(val),
                  ),
                ),
                ListTile(

                  title: new DropdownButtonFormField(
                    decoration: new InputDecoration(
                      hintText: "Select Thana",
                      contentPadding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                    ),
                    items: <DropdownMenuItem>[
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text("Panchlaish"),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text("Double Mooring"),
                      ),
                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text("Bayezid Bostami"),
                      ),
                    ],
                    onChanged: (val) => print(val),
                    onSaved: (val) => print(val),
                  ),
                ),
                ListTile(

                  title: new DropdownButtonFormField(
                    decoration: new InputDecoration(
                      hintText: "Select Post Code",
                      contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                    ),
                    items: <DropdownMenuItem>[
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text("Bayezid-1234"),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text("Technical More-5678"),
                      ),
                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text("Panchlaish-1011"),
                      ),
                      DropdownMenuItem<int>(
                        value: 4,
                        child: Text("Chittagong Sadar-4000"),
                      ),
                    ],
                    onChanged: (val) => print(val),
                    onSaved: (val) => print(val),
                  ),
                ),
                const Divider(
                  height: 10.0,
                ),
                ListTile(
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: "Email Address",
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
                new ListTile(
                  title: new TextField(
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Current Date",
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
                ListTile(
                  title: new DropdownButtonFormField(
                    decoration: new InputDecoration(
                    hintText: "Referred By",
                    contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                    items: <DropdownMenuItem>[
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text("Doctors-D001"),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text("Doctors-D002"),
                      ),
                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text("Doctors-D003"),
                      ),
                    ],
                    onChanged: (val) => print(val),
                    onSaved: (val) => print(val),
                  ),
                ),
                SizedBox(height: 20,),
                /*new ListTile(
                        title: const Text("Referred By"),
                        trailing: const Icon(Icons.check_circle, color: Colors.green,),
                      ),*/
              ],
            ),
          ],
        ),
      ),
    );

    final diseaseCondition = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ExpansionTileCard(
        baseColor: kBackgroundColor,
        key: cardB,
        leading: CircleAvatar(child: Icon(Icons.saved_search, color: Colors.white)),
        title: Text('Disease Condition', style: TextStyle(fontFamily: 'Segoe', color: kBaseColor, fontSize: 16, fontWeight: FontWeight.w700),),
        children: <Widget>[
          ListTile(
            title: new TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "Type/Search & Add",
                suffixIcon: IconButton(
                  onPressed: addDiseaseCondition,
                  icon: Icon(Icons.add),
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          /*TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    autofocus: true,
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontStyle: FontStyle.italic),

                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'What are you looking for?',
                        *//*
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                        *//*
                    ),

                  ),
                  suggestionsCallback: (pattern) async {
                    return await BackendService.getSuggestions(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      leading: Icon(Icons.person_add),
                      title: Text(suggestion['name']),
                      subtitle: Text('\$${suggestion['mobile']}'),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PatientPage(patient: suggestion)));
                  },
                ),*/
        ],
      ),
    );
    final chiefComplaint = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ExpansionTileCard(
        baseColor: kBackgroundColor,
        key: cardC,
        leading: CircleAvatar(child: Icon(Icons.dashboard_customize, color: Colors.white)),
        title: Text('C/C', style: TextStyle(fontFamily: 'Segoe', color: kBaseColor, fontSize: 16, fontWeight: FontWeight.w700),),
        children: <Widget>[

          ListTile(
            title: new TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "Type/Search & Add",
                suffixIcon: IconButton(
                  onPressed: addChiefComplaint,
                  icon: Icon(Icons.add),
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
        ],
      ),
    );

    final oE = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ExpansionTileCard(
        baseColor: kBackgroundColor,
        key: cardD,
        leading: CircleAvatar(child: Icon(Icons.ac_unit, color: Colors.white)),
        title: Text('O/E', style: TextStyle(fontFamily: 'Segoe', color: kBaseColor, fontSize: 16, fontWeight: FontWeight.w700),),
        children: <Widget>[
          ListTile(
            title: new TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "BP",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          ListTile(
            title: new TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "Height",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          ListTile(
            title: new TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "Weight",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          ListTile(
            title: new TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "BMI",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          ListTile(
            title: new TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "EDD",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          ListTile(
            title: new TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "P.Dose",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          ListTile(
            title: new TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "Pulse",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          ListTile(
            title: new TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "SPO2",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          ListTile(
            title: new TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "R/R",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          ExpansionTileCard(
            baseColor: kBackgroundColor,
            title: Text('Allergy (Select Type)', style: TextStyle(fontFamily: 'Segoe', color: kBaseColor, fontWeight: FontWeight.w700),),
            contentPadding: EdgeInsets.fromLTRB(28.0, 10.0, 20.0, 10.0),
            borderRadius: BorderRadius.circular(50.0),
            children: [
              ListTile(
                title: new DropdownButtonFormField(
                  decoration: new InputDecoration(
                    hintText: "Drug",
                    contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                  items: <DropdownMenuItem>[
                    DropdownMenuItem<int>(
                      value: 1,
                      child: Text("Unknown"),
                    ),
                    DropdownMenuItem<int>(
                      value: 2,
                      child: Text("Known"),
                    ),
                  ],
                  onChanged: (val) => print(val),
                  onSaved: (val) => print(val),
                ),
              ),
              ListTile(
                title: new DropdownButtonFormField(
                  decoration: new InputDecoration(
                    hintText: "Food",
                    contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                  items: <DropdownMenuItem>[
                    DropdownMenuItem<int>(
                      value: 1,
                      child: Text("Unknown"),
                    ),
                    DropdownMenuItem<int>(
                      value: 2,
                      child: Text("Known"),
                    ),
                  ],
                  onChanged: (val) => print(val),
                  onSaved: (val) => print(val),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    final history = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ExpansionTileCard(
        baseColor: kBackgroundColor,
        key: cardE,
        leading: CircleAvatar(child: Icon(Icons.history, color: Colors.white)),
        title: Text('History', style: TextStyle(fontFamily: 'Segoe', color: kBaseColor, fontSize: 16, fontWeight: FontWeight.w700),),
        children: <Widget>[
          ListTile(
            title: new DropdownButtonFormField(
              decoration: new InputDecoration(
                hintText: "Drug",
                contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
              items: <DropdownMenuItem>[
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text("Unknown"),
                ),
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text("Known"),
                ),
              ],
              onChanged: (val) => print(val),
              onSaved: (val) => print(val),
            ),
          ),
          ListTile(
            title: new DropdownButtonFormField(
              decoration: new InputDecoration(
                hintText: "Family",
                contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
              items: <DropdownMenuItem>[
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text("Yes"),
                ),
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text("No"),
                ),
              ],
              onChanged: (val) => print(val),
              onSaved: (val) => print(val),
            ),
          ),
          ListTile(
            title: new DropdownButtonFormField(
              decoration: new InputDecoration(
                hintText: "Medical",
                contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
              items: <DropdownMenuItem>[
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text("Yes"),
                ),
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text("No"),
                ),
              ],
              onChanged: (val) => print(val),
              onSaved: (val) => print(val),
            ),
          ),
        ],
      ),
    );

    final medicine = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ExpansionTileCard(
        baseColor: kBackgroundColor,
        key: cardF,
        leading: CircleAvatar(child: Icon(Icons.api_rounded, color: Colors.white)),
        title: Text('Medication', style: TextStyle(fontFamily: 'Segoe', color: kBaseColor, fontSize: 16, fontWeight: FontWeight.w700),),
        children: <Widget>[
          ListTile(
            title: Container(
              child:
              SimpleAutocompleteFormField<Brand>(
                decoration: InputDecoration(
                  hintText: "Type Brand Name",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
                suggestionsHeight: 80.0,
                itemBuilder: (context, person) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(person.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(person.address)
                      ]),
                ),
                onSearch: (search) async => brand
                    .where((person) =>
                person.name
                    .toLowerCase()
                    .contains(search.toLowerCase()) ||
                    person.address
                        .toLowerCase()
                        .contains(search.toLowerCase()))
                    .toList(),
                itemFromString: (string) => brand.singleWhere(
                        (person) => person.name.toLowerCase() == string.toLowerCase(),
                    orElse: () => null),
                onChanged: (value) => setState(() => selectedBrand = value),
                onSaved: (value) => setState(() => selectedBrand = value),
                validator: (person) => person == null ? 'Invalid person.' : null,
              ),
            ),
          ),
          SizedBox(height: 10,),
          ListTile(
            title: Container(
              child:
              SimpleAutocompleteFormField<Brand>(
                decoration: InputDecoration(
                  hintText: "Type Dose",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
                suggestionsHeight: 80.0,
                itemBuilder: (context, person) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(person.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(person.address)
                      ]),
                ),
                onSearch: (search) async => brand
                    .where((person) =>
                person.name
                    .toLowerCase()
                    .contains(search.toLowerCase()) ||
                    person.address
                        .toLowerCase()
                        .contains(search.toLowerCase()))
                    .toList(),
                itemFromString: (string) => brand.singleWhere(
                        (person) => person.name.toLowerCase() == string.toLowerCase(),
                    orElse: () => null),
                onChanged: (value) => setState(() => selectedBrand = value),
                onSaved: (value) => setState(() => selectedBrand = value),
                validator: (person) => person == null ? 'Invalid dose.' : null,
              ),
            ),
          ),
          SizedBox(height: 10,),
          ListTile(
            title: Container(
              child:
              SimpleAutocompleteFormField<Brand>(
                decoration: InputDecoration(
                  hintText: "Duration",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
                suggestionsHeight: 80.0,
                itemBuilder: (context, person) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(person.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(person.address)
                      ]),
                ),
                onSearch: (search) async => brand
                    .where((person) =>
                person.name
                    .toLowerCase()
                    .contains(search.toLowerCase()) ||
                    person.address
                        .toLowerCase()
                        .contains(search.toLowerCase()))
                    .toList(),
                itemFromString: (string) => brand.singleWhere(
                        (person) => person.name.toLowerCase() == string.toLowerCase(),
                    orElse: () => null),
                onChanged: (value) => setState(() => selectedBrand = value),
                onSaved: (value) => setState(() => selectedBrand = value),
                validator: (person) => person == null ? 'Invalid person.' : null,
              ),
            ),
          ),
          ListTile(
            title:
            Text('Taking Medicine', style: TextStyle(fontFamily: 'Segoe', fontSize: 16, fontWeight: FontWeight.w600), textAlign: TextAlign.left,),
          ),
          Row(
            children: [
              Container(
                width: 160,
                height: 40,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          before = !before;
                        });
                      },
                      child: before
                          ? Icon(
                        Icons.check_box,
                        color: kBaseColor,
                        size: 20,
                      )
                          : Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.black54,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text("Before Eating"),
                  ],
                ),
              ),
              Container(
                width: 150,
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          after = !after;
                        });
                      },
                      child: after
                          ? Icon(
                        Icons.check_box,
                        color: kBaseColor,
                        size: 20,
                      )
                          : Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.black54,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 2),
                    Text("After Eating"),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          ListTile(
            title: Text('Previous entered field data show as a label text. Entered all field data show as a label text.',
              style: TextStyle(fontFamily: 'Segoe', fontSize: 18, fontWeight: FontWeight.w600), textAlign: TextAlign.left,),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 120),
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('');
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.only(left: 6, top: 6, right: 6, bottom: 6),
                color: kDashBoxColor,
                child: Text('Add', style: TextStyle(fontFamily: 'Segoe', fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700)),
              ),
            ),
          ),
          ListTile(
            title: new TextFormField(
              keyboardType: TextInputType.multiline,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "Insert text here....",
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              ),
              maxLines: 25,
              minLines: 6,
              scrollPadding: const EdgeInsets.all(20),
            ),
          ),
          ListTile(
            title: new TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "Next Visit",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                suffixText: 'Month/Day',
                suffixStyle: TextStyle(color: kBodyTextColor),
              ),
            ),
          ),
          ListTile(
            title: new TextField(
              keyboardType: TextInputType.numberWithOptions(),
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "Paid (TK)",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          ListTile(
            title: new TextField(
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "Visit No.",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          ListTile(
            title: new TextField(
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "Last Visit",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                suffixText: 'days ago',
                suffixStyle: TextStyle(color: kBodyTextColor)
              ),
            ),
          ),
        ],
      ),
    );
    final advises = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ExpansionTileCard(
        baseColor: kBackgroundColor,
        key: cardG,
        leading: CircleAvatar(child: Icon(Icons.domain, color: Colors.white)),
        title: Text('Advises', style: TextStyle(fontFamily: 'Segoe', color: kBaseColor, fontSize: 16, fontWeight: FontWeight.w700),),
        children: <Widget>[
          ListTile(
            title: new TextField(
              //controller: _controller,
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "Diagnosis Advise",
                suffixIcon: IconButton(
                  onPressed: addDiagnosisAdvise,
                  icon: Icon(Icons.add),
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          ListTile(
            title: new TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "General Advise",
                suffixIcon: IconButton(
                  onPressed: addGeneralAdvise,
                  icon: Icon(Icons.add),
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
        ],
      ),
    );

    final preview = Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 90),
      child: MaterialButton(
        onPressed: () {
          Navigator.of(context).pushNamed('');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
        color: kDashBoxColor,
        child: Text('Preview', style: TextStyle(fontFamily: "Segoe", fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700)),
      ),
    );

    final saveAndPrint = Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 90),
      child: MaterialButton(
        onPressed: () {
          Navigator.of(context).pushNamed('');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
        color: kDashBoxColor,
        child: Text('Save and Print', style: TextStyle(fontFamily: "Segoe", fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700)),
      ),
    );

    final teleMedicine = Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 90),
      child: MaterialButton(
        onPressed: () {
          Navigator.of(context).pushNamed('');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
        color: kDashBoxColor,
        child: Text('Telemedicine', style: TextStyle(fontFamily: "Segoe", fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700)),
      ),
    );

    //Old Patient

    final oldPatientSearch = Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: new FindDropdown<UserModel>(
        label: 'Patient Search/Select',
        labelStyle: TextStyle(fontFamily: 'Segoe', fontSize: 18, fontWeight: FontWeight.w600,),
        showSearchBox: true,
        searchBoxDecoration: InputDecoration(
          hintText: 'By Name or Phone Number',
          contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
          prefixIcon: Icon(Icons.search)
        ),
        onFind: (String filter) => getData(filter),
        onChanged: (UserModel data) {
          print(data);
        },
      dropdownBuilder: (BuildContext context, UserModel item) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
          ),
          child: (item?.avatar == null)
              ? ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 40.0,
              child: Icon(Icons.wheelchair_pickup_outlined, size: 35,),
              //Image.asset('assets/apatient.png'),
            ),
            title: Text("No patient selected"),
          )
              : ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(item.avatar),
            ),
            title: Text(item.name),
            subtitle: Text(item.createdAt.toString()),
          ),
        );
      },
      dropdownItemBuilder:
          (BuildContext context, UserModel item, bool isSelected) {
        return Container(
          decoration: !isSelected
              ? null
              : BoxDecoration(
            border:
            Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: ListTile(
            selected: isSelected,
            title: Text(item.name),
            subtitle: Text(item.createdAt.toString()),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(item.avatar),
              ),
            ),
          );
        },
      ),
    );

    final editPrescription = Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 90),
      child: MaterialButton(
        onPressed: () {
          Navigator.of(context).pushNamed('');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
        color: kDashBoxColor,
        child: Text('Edit Prescription', style: TextStyle(fontFamily: "Segoe", fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700)),
      ),
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar
          (
          title: Text('Prescription', style: TextStyle(fontFamily: 'Segoe', color: kBaseColor, fontWeight: FontWeight.w700, fontSize: 28.0)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: kBackgroundColor,
          toolbarHeight: 110,
          elevation: 0.0,
          bottom: TabBar(
              unselectedLabelColor: kBaseColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [kDashBoxColor, kDashBoxColor]),
                  borderRadius: BorderRadius.circular(50),
                  color: kDashBoxColor),
              tabs: [
                Tab(
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: kDashBoxColor, width: 1.2)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Follow-Up Patient", style: TextStyle(fontFamily: 'Segoe', fontSize: 18, fontWeight: FontWeight.w700),),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: kDashBoxColor, width: 1.2)),

                    child: Align(
                      alignment: Alignment.center,
                      child: Text("New Patient", style: TextStyle(fontFamily: 'Segoe', fontSize: 18, fontWeight: FontWeight.w700),),
                    ),
                  ),
                ),
              ]),
        ),

        body: TabBarView(
            children: <Widget>[
              Container(
                color: kBackgroundColor,
                child: ListView(
                  padding: EdgeInsets.all(4),
                  children: [
                    SizedBox(height: 30,),
                    oldPatientSearch,
                    SizedBox(height: 0,),
                    editPrescription
                  ],
                ),
              ),
              Container(
                color: kBackgroundColor,
                child: ListView(
                  children: [
                    SizedBox(height: 20,),
                    patientInfo,

                    diseaseCondition,

                    chiefComplaint,

                    oE,

                    history,

                    medicine,

                    advises,

                    preview,

                    saveAndPrint,

                    teleMedicine,
                    SizedBox(height: 50,),
                  ],
                ),
                //color: kBackgroundColor,
              ),
              //Icon(Icons.movie),
            ]
        ),
      ),
    );
  }

  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "http://5d85ccfb1e61af001471bf60.mockapi.io/user",
      queryParameters: {"filter": filter},
    );

    var models = UserModel.fromJsonList(response.data);
    return models;
  }
  addDiseaseCondition() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text("Add New Disease Condition"),
          content: new Text("Hey! Are you sure? You want to add new Disease Condition!"),
          actions: <Widget>[
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              padding: EdgeInsets.all(10),
              color: kDashBoxColor,
              child: Text('Cancel', style: TextStyle(fontFamily: "Poppins-Bold", fontSize: 14, color: Colors.white)),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              padding: EdgeInsets.all(10),
              color: kDashBoxColor,
              child: Text('Add', style: TextStyle(fontFamily: "Poppins-Bold", fontSize: 14, color: Colors.white)),
            ),
          ],
        ));
  }
  addChiefComplaint() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text("Add New Chief Complaint"),
          content: new Text("Hey! I'm from Chief Complaint!"),
          actions: <Widget>[
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              padding: EdgeInsets.all(10),
              color: kDashBoxColor,
              child: Text('Cancel', style: TextStyle(fontFamily: "Poppins-Bold", fontSize: 14, color: Colors.white)),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              padding: EdgeInsets.all(10),
              color: kDashBoxColor,
              child: Text('Add', style: TextStyle(fontFamily: "Poppins-Bold", fontSize: 14, color: Colors.white)),
            ),
          ],
        ));
  }
  addGeneralAdvise() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text("Add New General Advise"),
          content: new Text("Hey! I'm from General Advises!"),
          actions: <Widget>[

            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              padding: EdgeInsets.all(10),
              color: kDashBoxColor,
              child: Text('Cancel', style: TextStyle(fontFamily: "Poppins-Bold", fontSize: 14, color: Colors.white)),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              padding: EdgeInsets.all(10),
              color: kDashBoxColor,
              child: Text('Add', style: TextStyle(fontFamily: "Poppins-Bold", fontSize: 14, color: Colors.white)),
            ),
          ],
        ));
  }
  addDiagnosisAdvise() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text("Add New Diagnosis Advise"),
          content: new Text("Hey! I'm from Diagnosis Advises!"),
          actions: <Widget>[

            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              padding: EdgeInsets.all(10),
              color: kDashBoxColor,
              child: Text('Cancel', style: TextStyle(fontFamily: "Poppins-Bold", fontSize: 14, color: Colors.white)),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              padding: EdgeInsets.all(10),
              color: kDashBoxColor,
              child: Text('Add', style: TextStyle(fontFamily: "Poppins-Bold", fontSize: 14, color: Colors.white)),
            ),
          ],
        ),
    );
  }
}

class Brand {
  Brand(this.name, this.address);
  final String name, address;
  @override
  String toString() => name;
}

class NewPatient {
  NewPatient(this.name, this.phone);
  final String name, phone;
  @override
  String toString() => name;
}


class UserModel {
  final String id;
  final DateTime createdAt;
  final String name;
  final String avatar;

  UserModel({this.id, this.createdAt, this.name, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return UserModel(
      id: json["id"],
      createdAt: json["createdAt"] == null ? null : DateTime.parse(
          json["createdAt"]),
      name: json["name"],
      avatar: json["avatar"],
    );
  }

  static List<UserModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => UserModel.fromJson(item)).toList();
  }
}