import 'package:flutter/material.dart';

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

class ReportSeen extends StatefulWidget {
  static String tag = 'ReportSeen';
  @override
  ReportSeenState createState() => new ReportSeenState();
}

class ReportSeenState extends State<ReportSeen> with SingleTickerProviderStateMixin {


  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 200);
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  double mainBorderRadius = 0;
  Brightness statusIconColor = Brightness.dark;

  List<TransactionDetails> todayTransactionsList = [
    TransactionDetails(
      item: 'Sohail Mahmud',
      companyName: '+8801234567890',
      ammount: 2499,
      income: true,
      icon: Icons.pets,
    ),
    TransactionDetails(
      item: 'Jahidul Hasan',
      companyName: '+8801234567890',
      ammount: 499,
      income: true,
      icon: Icons.person,
    ),
  ];

  List<TransactionDetails> yesterdayTransactionsList = [
    TransactionDetails(
      item: 'Sohail Mahmud',
      companyName: '+8801234567890',
      ammount: 2499,
      income: true,
      icon: Icons.pets,
    ),
    TransactionDetails(
      item: 'Jahidul Hasan',
      companyName: '+8801234567890',
      ammount: 499,
      income: true,
      icon: Icons.person,
    ),
    TransactionDetails(
      item: 'Kamrul Islam',
      companyName: '+8801234567890',
      ammount: 2499,
      income: true,
      icon: Icons.pets,
    ),
    TransactionDetails(
      item: 'Abdur Rahim',
      companyName: '+8801234567890',
      ammount: 499,
      income: true,
      icon: Icons.person,
    ),
    TransactionDetails(
      item: 'Sohail Mahmud',
      companyName: '+8801234567890',
      ammount: 2499,
      income: true,
      icon: Icons.pets,
    ),
    TransactionDetails(
      item: 'Jahidul Hasan',
      companyName: '+8801234567890',
      ammount: 499,
      income: true,
      icon: Icons.person,
    ),
    new TransactionDetails(
      item: 'Kabir Ahmed',
      companyName: '+880123456789',
      ammount: 499,
      income: true,
      icon: Icons.group,
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
                    color: Colors.black38,
                    blurRadius: 1,
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
                      ? "+${_transaction.ammount} \৳"
                      : " -${_transaction.ammount} \৳",
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
                      SizedBox(height: 25,),
                      Container(
                        width: 100.00,
                        height: 80.00,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: ExactAssetImage('assets/reportseen.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
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
                                        "Recent Patients Report Seen",
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
    return Scaffold (
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        shadowColor: Colors.teal,
        leading: IconButton(
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text('Report Seen', style: TextStyle(fontFamily:'Segoe', color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0),),
      ),
      body: Center(
        child: Container(
          child: dashboard(context),
        ),
      ),
    );
  }

}