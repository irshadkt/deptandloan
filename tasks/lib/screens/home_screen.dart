import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Home",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500)),
          centerTitle: true,
          leading: const Padding(
              padding: EdgeInsets.all(13.0),
              child: CircleAvatar(
                //radius: 13,
                // backgroundImage: AssetImage(""),
                backgroundColor: Colors.white,
              )),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black45,
                //  size: 20,
              ),
            )
          ],
          backgroundColor: Colors.blue[100],
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.blue,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      topContainer(context,Colors.red),
                      topContainer(context,Colors.green),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 4.3,
                  //top: 20,
                  //bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height / 1.8,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          // border: Border.all(
                          //   color: Colors.grey[400]!,
                          // ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                            //bottomRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.width / 6,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("My debts",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                    Text("See All",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black38,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: RefreshIndicator
                                  (
                                  onRefresh: ()async{},
                                  backgroundColor: Colors.black,
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: 8,
                                    itemBuilder: (context, index) {
                                      return listItem(context);
                                      //return TextMonials(state.services[index]);
                                    },
                                  ),
                                ),
                              ),
                              // listItem(context),
                              // listItem(context),
                              // listItem(context),
                              // listItem(context)
                            ],
                          ),
                        )),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 5.5,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      circleButton("NEW", Icons.add),
                      circleButton("PAY OFF", Icons.arrow_forward_rounded),
                      circleButton("LEND", Icons.arrow_back),
                      circleButton("MORE", Icons.grid_3x3),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Padding listItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
        child: ListTile(
          // minLeadingWidth: MediaQuery.of(context).size.width / 4,
          leading: Container(
            height: MediaQuery.of(context).size.width / 8,
            width: MediaQuery.of(context).size.width / 8,
            decoration: BoxDecoration(
                color: Colors.yellow, borderRadius: BorderRadius.circular(5.0)),
          ),
          title: Text("Jhon",
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.w500)),
          subtitle: Text("Until 20/03/22",
              style: TextStyle(
                  fontSize: 11,
                  color: Colors.black38,
                  fontWeight: FontWeight.w500)),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("# 100",
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.red,
                      fontWeight: FontWeight.w500)),
              Text("out of # 300",
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.black38,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }

  Column circleButton(String title, IconData icon) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white54,
              // color: Colors.transparent,
              shape: BoxShape.circle),
          height: MediaQuery.of(context).size.width / 4.8,
          width: MediaQuery.of(context).size.width / 4.8,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: Icon(
              icon,
              color: Colors.yellow,
              size: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(title,
              style: TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                  fontWeight: FontWeight.w800)),
        ),
      ],
    );
  }
  //String symbol="$";

  Padding topContainer(
    BuildContext context, Color color
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
      child: Container(
        // height: MediaQuery.of(context).size.height / 4.3,
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
            color: color,
            // border: Border.all(
            //   color: Colors.grey[400]!,
            // ),
            borderRadius: BorderRadius.circular(15.0)),
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Owe me',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500)),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white70,
                  size: 50,
                ),
              ],
            ),
            Text('1123',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white70,
                    fontWeight: FontWeight.w700)),
            SizedBox(
              height: 5,
            ),
            Text('2 debit',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
