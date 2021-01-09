import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final Color backgroundColor = Color(0xFF2d2d39);

class TransactionDetails {
  final String item;
  final String companyName;
  final int ammount;
  final bool income;
  final IconData icon;

  TransactionDetails({
    @required this.item,
    @required this.ammount,
    @required this.companyName,
    @required this.income,
    @required this.icon,
  });
}

class ReportSeen1 extends StatefulWidget {
  static String tag = 'ReportSeen1';
  @override
  ReportSeen1State createState() => ReportSeen1State();
}

class ReportSeen1State extends State<ReportSeen1>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 200);
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  double mainBorderRadius = 0;
  Brightness statusIconColor = Brightness.dark;

  List<TransactionDetails> todayTransactionsList = [
    new TransactionDetails(
      item: 'Sohail Mahmud',
      companyName: 'Apple',
      ammount: 2499,
      income: false,
      icon: Icons.person,
    ),
    new TransactionDetails(
      item: 'Jahidul Hasan',
      companyName: 'Upwork',
      ammount: 499,
      income: true,
      icon: Icons.person,
    ),
  ];

  List<TransactionDetails> yesterdayTransactionsList = [
    new TransactionDetails(
      item: 'Beats Headphone 2th Gen',
      companyName: 'Apple',
      ammount: 199,
      income: false,
      icon: Icons.headset,
    ),
    new TransactionDetails(
      item: 'Cake',
      companyName: 'StarBucks',
      ammount: 19,
      income: false,
      icon: Icons.cake,
    ),
    new TransactionDetails(
      item: 'Cake',
      companyName: 'StarBucks',
      ammount: 19,
      income: false,
      icon: Icons.cake,
    ),
    new TransactionDetails(
      item: 'Cake',
      companyName: 'StarBucks',
      ammount: 19,
      income: false,
      icon: Icons.cake,
    ),
    new TransactionDetails(
      item: 'Cake',
      companyName: 'StarBucks',
      ammount: 19,
      income: false,
      icon: Icons.cake,
    ),
    new TransactionDetails(
      item: 'Cake',
      companyName: 'StarBucks',
      ammount: 19,
      income: false,
      icon: Icons.cake,
    ),
    new TransactionDetails(
      item: 'Money Transfer',
      companyName: 'eSewa',
      ammount: 499,
      income: true,
      icon: Icons.transit_enterexit,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget transactionList(
      List<TransactionDetails> transactionList,
      String strDate, {
        bool lastElement: false,
      }) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Container(
          child: Text(
            '$strDate',
            style: TextStyle(
              color: Color(0xffadb2be),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListView.builder(
          padding: EdgeInsets.fromLTRB(5, 10, 5, (lastElement) ? 40 : 5),
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            TransactionDetails _transaction = transactionList[index];
            return Container(
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                  )
                ],
              ),
              // padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      _transaction.icon,
                    ),
                  ],
                ),
                title: Text(
                  "${_transaction.item}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  "${_transaction.companyName}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Text(
                  (_transaction.income)
                      ? "+${_transaction.ammount} \$"
                      : " -${_transaction.ammount} \$",
                  style: TextStyle(
                    fontSize: 18,
                    color: (_transaction.income) ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
          itemCount: transactionList.length,
        ),
      ],
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.5 * screenWidth,
      width: screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          borderRadius: BorderRadius.circular(mainBorderRadius),
          animationDuration: duration,
          color: Color(0xfff4faff),
          child: SafeArea(
              child: Stack(
                children: <Widget>[
                  ListView(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ListView(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          children: <Widget>[
                            SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.only(
                                bottom: 16,
                                left: 16,
                                right: 16,
                              ),
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                shrinkWrap: true,
                                children: <Widget>[
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Report Seen History",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.settings,
                                          color: Color(0xffa4a6b8),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  transactionList(todayTransactionsList, 'Today'),
                                  transactionList(
                                      yesterdayTransactionsList, 'Yesterday',
                                      lastElement: true),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: statusIconColor,
      ),
    );
    return Scaffold(
      backgroundColor: Color(0xff343442),
      body: Stack(
        children: <Widget>[
          dashboard(context),
        ],
      ),
    );
  }
}