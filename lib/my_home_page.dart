import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Widget _button(String label, String col){
    return Container(
      height: 36,
      width: 100,
      decoration: BoxDecoration(
        color: col == 'dep' ? const Color.fromARGB(255, 57, 219, 143) : const Color.fromARGB(255, 6, 12, 52),
        borderRadius: BorderRadius.circular(10),
        border: col != 'dep' ? Border.all(color: Colors.white) : null
      ),
      child: Center(
        child: InkWell(
          child: Text(label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w800
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardText(String label, String type){
    return Text(
      label,
      style: type == 'title'
        ? const TextStyle(
            color: Color.fromARGB(255, 6, 12, 52),
            fontWeight: FontWeight.bold,
            fontSize: 18
          )
        : type == 'normal' 
          ? const TextStyle(
              color: Colors.grey,
              fontSize: 16
            )
          : const TextStyle(
              color: Color.fromARGB(255, 57, 219, 143),
              fontWeight: FontWeight.w600,
              fontSize: 16
            )
    );
  }

  Widget _customBox(int index) {
    return Container(
      height: 200,
      width: 270,
      margin: const EdgeInsets.only(left: 10),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: (){},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.2), child: const Icon(Icons.gif_box, color: Color.fromARGB(255, 6, 12, 52))),
                        const SizedBox(width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _cardText("ADB", "title"),
                            _cardText("Adobe Inc", "normal"),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.arrow_upward_rounded, color: Color.fromARGB(255, 57, 219, 143), size: 14),
                            _cardText("5.49%", "green")
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("33.49",
                              style: TextStyle(
                                color: Color.fromARGB(255, 6, 12, 52),
                                fontSize: 26,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            _cardText("\$643.58", "normal")
                          ],
                        ),
                        SizedBox(
                          width: 150,
                          height: 100,
                          child: LineChart(
                            LineChartData(
                              titlesData: FlTitlesData(show: false),
                              borderData: FlBorderData(show: false),
                              gridData: FlGridData(show: false),
                              lineTouchData: LineTouchData(enabled: false),
                              lineBarsData: [
                                LineChartBarData(
                                  dotData: FlDotData(show: false),
                                  isCurved: true,
                                  color: Colors.black,
                                  spots: [
                                    const FlSpot(0, 1),
                                    const FlSpot(1, 10),
                                    const FlSpot(4, 8),
                                    const FlSpot(5, 19),
                                    const FlSpot(7, 14),
                                    const FlSpot(8, 26)
                                  ]
                                )
                              ]
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            children: const [
              Icon(Icons.cameraswitch_outlined, color: Color.fromARGB(255, 57, 219, 143)),
              SizedBox(width: 8),
              Text("Alex Julia", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)),
              Spacer(),
              Icon(Icons.search, color: Colors.black, size: 30),
               SizedBox(width: 8),
              Icon(Icons.notifications_none_sharp, color: Colors.black, size: 30)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.indigo[900],
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {},
        items: const [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.pie_chart),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.swap_horizontal_circle_rounded, color: Color.fromARGB(255, 57, 219, 143), size: 50),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.bar_chart),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(12, 12, 0, 0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(right: 12),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  SizedBox(
                    height: 200,
                    width: 800,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: const Color.fromARGB(255, 6, 12, 52),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Portfolio value", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400)),
                            const SizedBox(height: 12),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("\$15,136.32 ", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                                Row(
                                  children: const [
                                    Text(" 2.11%", style: TextStyle(color: Colors.green, fontSize: 12)),
                                    Icon(Icons.arrow_upward_rounded, color: Colors.green, size: 14)
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 36),
                            Row(
                              children: [
                                _button("Deposit", "dep"),
                                const SizedBox(width: 10),
                                _button("Withdraw", "wit")
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    child: Container(
                      margin: const EdgeInsets.only(right:30),
                      padding: const EdgeInsets.only(top: 10),
                      height: 180,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4.0,
                        ),]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.2), child: const Icon(Icons.apple, color: Color.fromARGB(255, 6, 12, 52))),
                          CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.2), child: const Icon(Icons.paypal, color:Color.fromARGB(255, 6, 12, 52))),
                          CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.2), child: const Icon(Icons.line_axis_outlined, color: Color.fromARGB(255, 6, 12, 52))),
                          InkWell(
                            onTap: (){},
                            child: const Icon(Icons.arrow_drop_down, color: Colors.grey, size: 30)
                          )
                        ]
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 30, 20, 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Watchlist", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 6, 12, 52))),
                  Text("See All", style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 57, 219, 143)))
                ],
              ),
            ),

            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: List.generate(2, (index) {
                      return _customBox(index);
                    }),
                  ),
                ],
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: const Text("Stocks Activity", 
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 18, 
                  color: Color.fromARGB(255, 6, 12, 52)
                )
              )
            ),

            Container(
              height: 90,
              width: 800,
              margin: const EdgeInsets.only(right: 12),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            const SizedBox(width: 12),
                            CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.2), child: const Icon(Icons.gesture, color: Color.fromARGB(255, 6, 12, 52))),
                            const SizedBox(width: 16),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _cardText("NVDA", "title"),
                                _cardText("Nvidia", "normal"),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _cardText("25.94", "green"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.arrow_upward_rounded, color: Color.fromARGB(255, 57, 219, 143), size: 14),
                                _cardText("0.14%", "green")
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _cardText("\$227.26", "title"),
                            _cardText("10 shares", "normal"),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}