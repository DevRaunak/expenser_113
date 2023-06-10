import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatsGraphPage extends StatefulWidget {
  const StatsGraphPage({Key? key}) : super(key: key);

  @override
  State<StatsGraphPage> createState() => _StatsGraphPageState();
}

class _StatsGraphPageState extends State<StatsGraphPage>{
  var maxValue = 0;

  List<Map<String,dynamic>> graphData = [
    {
      "month" : "Jan",
      "amt": 5000.0
    },

    {
      "month" : "June",
      "amt": 20000.0
    },

    {
      "month" : "Feb",
      "amt": 40000.0
    },

    {
      "month" : "March",
      "amt": 7000.0
    },

    {
      "month" : "April",
      "amt": 10000.0
    },

    {
      "month" : "May",
      "amt": 14000.0
    }
  ];

  @override
  void initState() {
    super.initState();
    graphData.forEach((element) {
      if(element["amt"] > maxValue){
        maxValue = element["amt"];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 20000, interval: 1000),
          series: <ChartSeries<Map<String, dynamic>, String>>[
            ColumnSeries(
                dataSource: graphData,
                xValueMapper: (Map<String, dynamic> data, _) => data["month"],
                yValueMapper: (Map<String, dynamic> data, _) => data["amt"])
          ],
        ),
      ),
    );
  }

}

/*
class _StatsGraphPageState extends State<StatsGraphPage> with SingleTickerProviderStateMixin{
  var maxValue = 0;
  late AnimationController _controller;

  List<Map<String,dynamic>> graphData = [
    {
      "month" : "Jan",
      "amt": 5000
    },

    {
      "month" : "June",
      "amt": 20000
    },

    {
      "month" : "Feb",
      "amt": 40000
    },

    {
      "month" : "March",
      "amt": 7000
    },

    {
      "month" : "April",
      "amt": 10000
    },

    {
      "month" : "May",
      "amt": 14000
    }
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..forward()..addListener(() {
      setState(() {

      });
    });

  }

  @override
  Widget build(BuildContext context) {
   graphData.forEach((element) {
      if(element["amt"] > maxValue){
        maxValue = element["amt"];
    }
    });

   var heightRatio = MediaQuery.of(context).size.height*0.5/(maxValue+1000);

   print(maxValue);
    return Scaffold(
      body: Container(
        color: Colors.brown.shade100,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.6,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: graphData.map((item) =>  Padding(
               padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.04,
                        height: MediaQuery.of(context).size.height*0.5,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(5))
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.04,
                        height: (heightRatio*item['amt'])*_controller.value,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(5))
                        ),
                      ),
                    )
                  ],
                ),
              )).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/
