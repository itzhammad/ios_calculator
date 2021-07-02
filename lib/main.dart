import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calculator(),
    );
  }
}

class calculator extends StatefulWidget {
  const calculator({ Key? key }) : super(key: key);

  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  var result = '';

  Widget btn (var txt,Color txtclr, Color btnclr){
    return Flexible(
      child: Container(
        child: ElevatedButton(onPressed: (){
          setState(() {
            result=  result + txt;
          });
        }, child: Text(txt,style: TextStyle(fontSize: 25,color: txtclr),overflow: TextOverflow.ellipsis,),style: ElevatedButton.styleFrom(primary: btnclr,shape: CircleBorder(),fixedSize: Size(70, 70))),
      ),
    );
  }
  
  calculate(){
    
      Parser p = new Parser();
      Expression exp = p.parse(result);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

clear(){
  setState(() {
    result='';
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(result.toString(),style: TextStyle(fontSize: 70,color: Colors.white),textAlign: TextAlign.right,),
                  )
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // btn('AC',Colors.black,Colors.grey),
                ElevatedButton(onPressed: clear, child: Text('AC',style: TextStyle(fontSize: 25,color: Colors.black),),style: ElevatedButton.styleFrom(shape: CircleBorder(),fixedSize: Size(70, 70),primary: Colors.grey)),
                btn('+/-',Colors.black,Colors.grey),
                btn('%',Colors.black,Colors.grey),
                btn('/',Colors.white,Colors.orange),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn('7',Colors.white,Colors.grey.shade900),
                btn('8',Colors.white,Colors.grey.shade900),
                btn('9',Colors.white,Colors.grey.shade900),
                btn('*',Colors.white,Colors.orange),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn('4',Colors.white,Colors.grey.shade900),
                btn('5',Colors.white,Colors.grey.shade900),
                btn('6',Colors.white,Colors.grey.shade900),
                btn('-',Colors.white,Colors.orange),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn('1',Colors.white,Colors.grey.shade900),
                btn('2',Colors.white,Colors.grey.shade900),
                btn('3',Colors.white,Colors.grey.shade900),
                btn('+',Colors.white,Colors.orange),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    result = result+'0';
                  });
                }, child: Text('0',style: TextStyle(fontSize: 25),textAlign: TextAlign.left,),style: ElevatedButton.styleFrom(padding: EdgeInsets.fromLTRB(30, 20, 110, 20),shape: StadiumBorder(),primary: Colors.grey.shade900),),
                btn('.',Colors.white,Colors.grey.shade900),
                ElevatedButton(onPressed: calculate, child: Text("=",style: TextStyle(fontSize: 25,color: Colors.white),),style: ElevatedButton.styleFrom(fixedSize: Size(70, 70),primary: Colors.grey.shade900,shape: CircleBorder()),)
              ],
            ),
            SizedBox(height: 10,),

          ],
        ),
      ),
      
    );
  }
}