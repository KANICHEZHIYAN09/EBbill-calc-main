import 'package:flutter/material.dart';
 void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EB BILL CALC',
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        accentColor: Colors.redAccent,
      ),
      home:HomeScreen() ,
    )
  );
  
class HomeScreen extends StatefulWidget {

  @override
  HomeScreenState createState() => HomeScreenState();
}

 class HomeScreenState extends State<HomeScreen> {
  
  
  String _eResult ="";

  
  final TextEditingController _currentreadingvalue = TextEditingController();
  

  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EB BILL CALCULATOR'),
        centerTitle: true,
        elevation: 0.0
      ),
      body: Center(
        child: Container(
          child: Column(
            children:<Widget> [
              Container(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: _currentreadingvalue,
                  decoration: const InputDecoration(
                    labelText: "Enter current reading",fillColor: Colors.red
                  ),
                  keyboardType: TextInputType.number,
                )
        ),
        
    Flexible(
      fit: FlexFit.loose,
      child: FlatButton(
        onPressed: _handleCalculation,
        child: const Text('Calculate'),
        color: Colors.redAccent,
        textColor: Colors.white,
        padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 24.0,right:24.0),
      )
    ),
    resultsWidget(_eResult)
            ],
          )
        )
      )
    );
  }
  void _handleCalculation() {
    var sum=0;
    var a;
    var b;
    var c;
    int f =int.parse(_currentreadingvalue.text);
      if(f>500) {
        a=(f-500)*6.6;
        b=300*4.6;
        c=100*3.5;
        sum=a+b+c+50;
         } else if (f > 200) {
      a = (f - 200) * 3;
      b = 100 * 2;
      sum= a + b + 30;
    } else if (f > 100) {
      a = (f - 100) * 1.5;
      sum= a + 20;
  }
  _eResult= sum.toStringAsFixed(2);
  setState(() {});
  }
    Widget resultsWidget(Result) {
      bool canShow =false;
      String _eResult =Result;
      return Container(
      margin: const EdgeInsets.only(top: 40.0),
      child: Column(
        children:[
        const Text("Your EB Bill is",
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold)
        ),
        Text(_eResult,
        style: const TextStyle(
           fontSize: 50.0,
        fontWeight: FontWeight.bold
        ))
        ]
      )
      );
    } 
  }
