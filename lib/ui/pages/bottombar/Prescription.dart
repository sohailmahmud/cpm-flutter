import 'dart:async';
import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dio/dio.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pro_health/ui/pages/bottombar/PreviewPrescription.dart';
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

  final nextVisit = <NextVisit>[NextVisit('After Day 1', ''), NextVisit('After Day 2', ''), NextVisit('After Day 3', ''), NextVisit('After Day 4', ''), NextVisit('After Day 5', '')];
  NextVisit selectedNextVisit;

  final paidTK = <PaidTK>[PaidTK('100', ''), PaidTK('200', ''), PaidTK('300', ''), PaidTK('After Day 4', ''), PaidTK('After Day 5', '')];
  PaidTK selectedPaidTK;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  final format = DateFormat("dd-MM-yyyy");


  String generatedPdfFilePath;

  @override
  void initState() {
    super.initState();
    generateExampleDocument();
  }

  Future<void> generateExampleDocument() async {
    var htmlContent =""" <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="" xml:lang="">
<head>
<title>Page 1</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<style type="text/css">
p {margin: 0; padding: 0;}	.ft00{font-size:15px;font-family:YRCDEU+TimesNewRomanPS;color:#231f20;}
	.ft01{font-size:16px;font-family:ATIWHL+Arial;color:#231f20;}
	.ft02{font-size:19px;font-family:LXYIRL+Arial;color:#231f20;}
	.ft03{font-size:13px;font-family:RNEEJL+TimesNewRomanPSMT;color:#231f20;}
	.ft04{font-size:15px;font-family:RNEEJL+TimesNewRomanPSMT;color:#231f20;}
	.ft05{font-size:22px;font-family:YRCDEU+TimesNewRomanPS;color:#231f20;}
	.ft06{font-size:16px;font-family:AEUPQB+TimesNewRomanPS;color:#231f20;}
	.ft07{font-size:25px;font-family:LXYIRL+Arial;color:#231f20;}
	.ft08{font-size:18px;font-family:ATIWHL+Arial;color:#231f20;}
	.ft09{font-size:61px;font-family:JJMDCS+Arial;color:#231f20;}
	.ft010{font-size:35px;font-family:JJMDCS+Arial;color:#231f20;}
	.ft011{font-size:12px;font-family:RNEEJL+TimesNewRomanPSMT;color:#231f20;}
	.ft012{font-size:16px;font-family:LXYIRL+Arial;color:#231f20;}
	.ft013{font-size:16px;font-family:YRCDEU+TimesNewRomanPS;color:#231f20;}
	.ft014{font-size:13px;line-height:17px;font-family:RNEEJL+TimesNewRomanPSMT;color:#231f20;}
	.ft015{font-size:16px;line-height:18px;font-family:AEUPQB+TimesNewRomanPS;color:#231f20;}
</style>
</head>
<body bgcolor="#E8E8E8" vlink="blue" link="blue">
<div id="page1-div" style="position:relative;width:891px;height:1267px;">
<!-- <img width="891" height="1267" src="7a01194ea3dc1f1f9d183f4c3593fb75001.png" alt="background image"/> -->
<p style="position:absolute;top:475px;left:477px;white-space:nowrap" class="ft00"><b>TAB. ROZITH (500 mg)</b></p>
<p style="position:absolute;top:495px;left:477px;white-space:nowrap" class="ft01"><i>০+১+০ (খাওয়ার পর)- ৫ দিন</i></p>
<p style="position:absolute;top:530px;left:477px;white-space:nowrap" class="ft00"><b>TAB. SERGEL (20 mg)</b></p>
<p style="position:absolute;top:550px;left:477px;white-space:nowrap" class="ft01"><i>১+১+০ (খাওয়ার ৩০ মিনিট আগে)- ১৫ দিন</i></p>
<p style="position:absolute;top:587px;left:477px;white-space:nowrap" class="ft00"><b>TAB. AZITH(500 mg)</b></p>
<p style="position:absolute;top:607px;left:477px;white-space:nowrap" class="ft01"><i>১+১+০ (খাওয়ার ৩০ মিনিট আগে)- ১৫ দিন</i></p>
<p style="position:absolute;top:642px;left:477px;white-space:nowrap" class="ft00"><b>CAP. LYRIC (150 mg)</b></p>
<p style="position:absolute;top:662px;left:477px;white-space:nowrap" class="ft01"><i>০+১+০ (খাওয়ার পর)- ৫ দিন</i></p>
<p style="position:absolute;top:693px;left:477px;white-space:nowrap" class="ft00"><b>TAB. NEURO (150 mg)</b></p>
<p style="position:absolute;top:713px;left:477px;white-space:nowrap" class="ft01"><i>১+০+১ (খাওয়ার ৩০ মিনিট আগে)- ১৫ দিন</i></p>

<p style="position:absolute;top:1119px;left:624px;white-space:nowrap" class="ft00"><b>Signature</b></p>
<p style="position:absolute;top:992px;left:175px;white-space:nowrap" class="ft01">বেশি করে পানি খাবেন</p>
<p style="position:absolute;top:1041px;left:175px;white-space:nowrap" class="ft01">ধুমপান বর্জন করুন</p>
<p style="position:absolute;top:1068px;left:175px;white-space:nowrap" class="ft01">নিয়মিত ব্যায়াম করুন</p>
<p style="position:absolute;top:1015px;left:175px;white-space:nowrap" class="ft01">পর্যাপ্ত ঘুমাবেন</p>
<p style="position:absolute;top:1028px;left:82px;white-space:nowrap" class="ft02"><i><b>উপদেশ</b></i></p>
<p style="position:absolute;top:333px;left:81px;white-space:nowrap" class="ft00"><b>C/C</b></p>
<p style="position:absolute;top:355px;left:114px;white-space:nowrap" class="ft014">Fever for 3 days<br/>Back Pain</p>
<p style="position:absolute;top:586px;left:81px;white-space:nowrap" class="ft00"><b>Investigation</b></p>
<p style="position:absolute;top:608px;left:114px;white-space:nowrap" class="ft014">CBC<br/>X-Ray</p>
<p style="position:absolute;top:440px;left:81px;white-space:nowrap" class="ft00"><b>O/E</b></p>
<p style="position:absolute;top:462px;left:114px;white-space:nowrap" class="ft014">BP: 120/90&#160;<br/>Pulse: 80</p>
<p style="position:absolute;top:494px;left:114px;white-space:nowrap" class="ft014">Wt. : 80 Kg<br/>D.&#160;Allergy : Unknown</p>
<p style="position:absolute;top:215px;left:143px;white-space:nowrap" class="ft00"><b>Thana:&#160;</b></p>
<p style="position:absolute;top:215px;left:197px;white-space:nowrap" class="ft04">Pekua</p>
<p style="position:absolute;top:215px;left:609px;white-space:nowrap" class="ft00"><b>Mob:</b></p>
<p style="position:absolute;top:215px;left:651px;white-space:nowrap" class="ft04">01559-135203</p>
<p style="position:absolute;top:215px;left:401px;white-space:nowrap" class="ft00"><b>Dis:</b></p>
<p style="position:absolute;top:215px;left:434px;white-space:nowrap" class="ft04">Cox's Bazar</p>
<p style="position:absolute;top:194px;left:143px;white-space:nowrap" class="ft00"><b>Name:</b></p>
<p style="position:absolute;top:194px;left:193px;white-space:nowrap" class="ft04">Md. Sohail Mahmud</p>
<p style="position:absolute;top:194px;left:609px;white-space:nowrap" class="ft00"><b>Sex:</b></p>
<p style="position:absolute;top:194px;left:640px;white-space:nowrap" class="ft04">M</p>
<p style="position:absolute;top:194px;left:400px;white-space:nowrap" class="ft00"><b>Age:</b></p>
<p style="position:absolute;top:194px;left:438px;white-space:nowrap" class="ft04">22&#160;Yrs.</p>
<p style="position:absolute;top:239px;left:143px;white-space:nowrap" class="ft00"><b>Date:&#160;</b></p>
<p style="position:absolute;top:239px;left:186px;white-space:nowrap" class="ft04">25-10-2020</p>
<p style="position:absolute;top:239px;left:401px;white-space:nowrap" class="ft00"><b>ID:&#160;</b></p>
<p style="position:absolute;top:239px;left:430px;white-space:nowrap" class="ft04">000/1</p>
<p style="position:absolute;top:239px;left:607px;white-space:nowrap" class="ft00"><b>Referred By:&#160;</b></p>
<p style="position:absolute;top:239px;left:694px;white-space:nowrap" class="ft04">Dr. XYZ</p>
<p style="position:absolute;top:21px;left:690px;white-space:nowrap" class="ft05"><b>Dr. Umme Salma</b></p>
<p style="position:absolute;top:47px;left:710px;white-space:nowrap" class="ft015"><i>MBBS, BCS (Health)<br/>FCPS (Obs &amp; Gynae)</i></p>
<p style="position:absolute;top:85px;left:563px;white-space:nowrap" class="ft06"><i>Consultant (Gynae &amp; High Risk Pregnancy)</i></p>
<p style="position:absolute;top:123px;left:500px;white-space:nowrap" class="ft06"><i>Bangabondhu Sheikh Mujib Medical University (PG)</i></p>
<p style="position:absolute;top:103px;left:602px;white-space:nowrap" class="ft06"><i>Consultant: Gynae &amp; Obs Department</i></p>
<p style="position:absolute;top:22px;left:21px;white-space:nowrap" class="ft07"><b>ডা: উম্মে সালমা</b></p>
<p style="position:absolute;top:50px;left:19px;white-space:nowrap" class="ft08"><i>এম বি বি এস, বিসিএস (স্বাস্থ্য)</i></p>
<p style="position:absolute;top:67px;left:19px;white-space:nowrap" class="ft08"><i>এফ সি পি এস (গাইনি এন্ড অবস্)</i></p>
<p style="position:absolute;top:84px;left:20px;white-space:nowrap" class="ft08"><i>কনসালটেন্ট (গাইনি ও হাই রিস্ক প্রেগনেন্সি)</i></p> 
<p style="position:absolute;top:102px;left:20px;white-space:nowrap" class="ft08"><i>কনসালটেন্ট (গাইনি ও অবস্ বিভাগ)</i></p>
<p style="position:absolute;top:118px;left:20px;white-space:nowrap" class="ft08"><i>বঙ্গবন্ধু শেখ মুজিব মেডিকেল বিশ্ববিদ্যালয় (পিজি)</i></p> 
<p style="position:absolute;top:329px;left:410px;white-space:nowrap" class="ft09"><b>R</b></p>
<p style="position:absolute;top:372px;left:447px;white-space:nowrap" class="ft010"><b>x</b></p>
<p style="position:absolute;top:131px;left:379px;white-space:nowrap" class="ft011">0&#160;A&#160;2 X 8 3 0</p>
<p style="position:absolute;top:993px;left:538px;white-space:nowrap" class="ft012"><i><b>৭ দিন পর আবার আসবেন/অপারেশন</b></i></p>
<p style="position:absolute;top:993px;left:451px;white-space:nowrap" class="ft013"><b>Next Plan:&#160;</b></p>
<p style="position:absolute;top:1195px;left:192px;white-space:nowrap" class="ft012"><i><b>চেম্বারঃ </b></i></p>
<p style="position:absolute;top:1195px;left:232px;white-space:nowrap" class="ft01"><i>&emsp;ইবনে সিনা ডি ল্যাব এন্ড কনসাল্টেশন সেন্টার, ধানমন্ডি, রোড নং ১৫, বাড়ি নং ৩৬, ঢাকা-১২০৯</i></p>
<p style="position:absolute;top:1239px;left:330px;white-space:nowrap" class="ft012"><i><b>রোগী দেখার সময়ঃ</b></i></p>
<p style="position:absolute;top:1239px;left:429px;white-space:nowrap" class="ft01"><i>&emsp;&emsp;বিকাল ৫টা থেকে রাত ৯টা পর্যন্ত</i></p>
<p style="position:absolute;top:1217px;left:330px;white-space:nowrap" class="ft012"><i><b>রোগী দেখার দিনঃ</b></i></p>
<p style="position:absolute;top:1217px;left:424px;white-space:nowrap" class="ft01"><i>&emsp;&emsp;শনিবার থেকে বুধবার</i></p>
<p style="position:absolute;top:1159px;left:285px;white-space:nowrap" class="ft012"><i><b>ডাক্তারের পরামর্শ ব্যতীত কোন ঔষধ পরিবর্তন বা বন্ধ করবেন না।</b></i></p>
</div>
</body>
</html> """;
    Directory appDocDir = await getApplicationDocumentsDirectory();
    var targetPath = appDocDir.path;
    var targetFileName = "example-pdf";

    var generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlContent, targetPath, targetFileName);
    generatedPdfFilePath = generatedPdfFile.path;
  }

  // Write pdf and save

  final pdf = pw.Document();

  writeOnPdf(){

    pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(32),

          build: (pw.Context context){
            return <pw.Widget>  [
              pw.Header(
                  level: 0,
                  child: pw.Text("Easy Approach Document", style: pw.TextStyle(fontSize: 40))
              ),

              pw.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),

              pw.Paragraph(
                  text: "Lorem ipsum dolor sit a1met, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),

              pw.Header(
                  level: 1,
                  child: pw.Text("Second Heading")
              ),

              pw.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),

              pw.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),

              pw.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),
            ];
          },


        )
    );
  }

  Future savePdf() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/example.pdf");

    file.writeAsBytesSync(pdf.save());
  }


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
                ListTile(
                  title: DateTimeField(
                      format: format,
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                      },
                    decoration: InputDecoration(
                      hintText: "Select Current Date",
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

    final medication = Padding(
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
              decoration: new InputDecoration(
                hintText: "",
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
            title: Container(
              child:
              SimpleAutocompleteFormField<NextVisit>(
                decoration: InputDecoration(
                  hintText: "Next Visit",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
                suggestionsHeight: 80.0,
                itemBuilder: (context, nextVisit) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(nextVisit.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(nextVisit.address)
                      ]),
                ),
                onSearch: (search) async => nextVisit
                    .where((nextVisit) =>
                nextVisit.name
                    .toLowerCase()
                    .contains(search.toLowerCase()) ||
                    nextVisit.address
                        .toLowerCase()
                        .contains(search.toLowerCase()))
                    .toList(),
                itemFromString: (string) => nextVisit.singleWhere(
                        (nextVisit) => nextVisit.name.toLowerCase() == string.toLowerCase(),
                    orElse: () => null),
                onChanged: (value) => setState(() => selectedNextVisit = value),
                onSaved: (value) => setState(() => selectedNextVisit = value),
                validator: (nextVisit) => nextVisit == null ? 'Invalid person.' : null,
              ),
            ),
          ),
          ListTile(
            title: Container(
              child:
              SimpleAutocompleteFormField<PaidTK>(
                decoration: InputDecoration(
                  hintText: "Paid (TK)",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
                suggestionsHeight: 80.0,
                itemBuilder: (context, paidTK) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(paidTK.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(paidTK.address)
                      ]),
                ),
                onSearch: (search) async => paidTK
                    .where((paidTK) =>
                paidTK.name
                    .toLowerCase()
                    .contains(search.toLowerCase()) ||
                    paidTK.address
                        .toLowerCase()
                        .contains(search.toLowerCase()))
                    .toList(),
                itemFromString: (string) => paidTK.singleWhere(
                        (paidTK) => paidTK.name.toLowerCase() == string.toLowerCase(),
                    orElse: () => null),
                onChanged: (value) => setState(() => selectedPaidTK = value),
                onSaved: (value) => setState(() => selectedPaidTK = value),
                validator: (paidTK) => paidTK == null ? 'Invalid person.' : null,
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
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PDFViewerScaffold(
                  appBar: AppBar(title: Text("Prescription Preview")),
                  path: generatedPdfFilePath)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
        color: kWhiteShadow,
        child: Text('Preview', style: TextStyle(fontFamily: "Segoe", fontSize: 15, color: kBaseColor, fontWeight: FontWeight.w700)),
      ),
    );

    final saveAndPrint = Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 90),
      child: MaterialButton(

        onPressed: ()async{
          writeOnPdf();
          await savePdf();

          Directory documentDirectory = await getApplicationDocumentsDirectory();

          String documentPath = documentDirectory.path;

          String fullPath = "$documentPath/example.pdf";

          Navigator.push(context, MaterialPageRoute(
              builder: (context) => PdfPreviewScreen(
                path: fullPath,
              )
          ));

        },

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
        color: kWhiteShadow,
        child: Text('Save and Print', style: TextStyle(fontFamily: "Segoe", fontSize: 15, color: kBaseColor, fontWeight: FontWeight.w700)),
      ),
    );

    final teleMedicine = Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 90),
      child: MaterialButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => PreviewPrescription()));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
        color: kWhiteShadow,
        child: Text('Telemedicine', style: TextStyle(fontFamily: "Segoe", fontSize: 15, color: kBaseColor, fontWeight: FontWeight.w700)),
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
        color: kWhiteShadow,
        child: Text('Edit Prescription', style: TextStyle(fontFamily: "Segoe", fontSize: 15, color: kBaseColor, fontWeight: FontWeight.w700)),
      ),
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Prescription', style: TextStyle(fontFamily: 'Segoe', color: kBaseColor, fontWeight: FontWeight.w700, fontSize: 28.0)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: kWhiteShade,
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
                      child: Text("Follow-Up Patient", style: TextStyle(fontFamily: 'Segoe', fontSize: 16, fontWeight: FontWeight.w700),),
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
                      child: Text("New Patient", style: TextStyle(fontFamily: 'Segoe', fontSize: 16, fontWeight: FontWeight.w700),),
                    ),
                  ),
                ),
              ]),
        ),
        body: TabBarView(
            children: <Widget>[
              Container(
                color: kWhiteShade,
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
                color: kWhiteShade,
                child: ListView(
                  children: [
                    SizedBox(height: 20,),
                    patientInfo,
                    diseaseCondition,
                    chiefComplaint,
                    oE,
                    history,
                    medication,
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

class PdfPreviewScreen extends StatelessWidget {
  final String path;

  PdfPreviewScreen({this.path,  appBarAppBar, AppBar appBar});

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
          title: Text("Generated PDF Document")
      ),
      path: path,
    );
  }
}


class PaidTK {
  PaidTK(this.name, this.address);
  final String name, address;
  @override
  String toString() => name;
}

class NextVisit {
  NextVisit(this.name, this.address);
  final String name, address;
  @override
  String toString() => name;
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