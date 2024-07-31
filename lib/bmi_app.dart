import 'package:flutter/material.dart';
import 'package:bmi_calculator/main.dart';

class BMI extends StatefulWidget{
  const BMI({super.key});


  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();

  var result = "";
  var bgColor = Colors.purple.shade50;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("BMI App",style: TextStyle(color: Colors.white),),
          ],
        ),
        backgroundColor: Colors.purple,
      ),
      body:

      //BMI = weight/height^2
      //unit: kg/m^2
      //healthy people bmi range: 18-25

      Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text("BMI",style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700
                ),),

                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text("Enter Your Weight(in kg)"),
                    prefixIcon: Icon(Icons.line_weight,color: Colors.indigo,),
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 10,),

                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                      label: Text("Enter Your Height(in fits)"),
                      prefixIcon: Icon(Icons.height,color: Colors.indigo,)
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 10,),

                TextField(
                  controller: inchController,
                  decoration: const InputDecoration(
                      label: Text("Enter Your Height(in inches)"),
                      prefixIcon: Icon(Icons.height,color: Colors.indigo,)
                  ),
                  keyboardType: TextInputType.number,
                ),


                const SizedBox(height: 10,),

                ElevatedButton(
                  child: Text("Calculate"),
                  onPressed: (){
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inchController.text.toString();

                    if(wt !="" && ft != "" && inch != ""){
                      var Wt = int.parse(wt);
                      var Ft = int.parse(ft);
                      var Inch = int.parse(inch);

                      var totalInch = (Ft*12) + Inch;
                      var totalCm = totalInch*2.54;
                      var totalM = totalCm/100;

                      var bmi = Wt/(totalM*totalM);

                      var msg ="";

                      if(bmi>25){
                        msg = "You are Owerweight!!";
                        bgColor = Colors.red.shade200;
                      }else if(bmi<18){
                        msg = "You are Underweight!!";
                        bgColor = Colors.red.shade200;
                      }else{
                        msg = "You are healthy!!";
                        bgColor = Colors.green.shade100;
                      }

                      setState(() {
                        result = "$msg \n Your BMI is : ${bmi.toStringAsFixed(2)} kg/m^2";
                      });

                    }else{
                      setState(() {
                        result = "Please fill all the require blanks!";
                      });
                    }


                  },
                ),
                const SizedBox(height: 10,),

                Text(result,style: TextStyle(fontSize: 20),)

              ],
            ),
          ),
        ),
      )
      ,
    );
  }
}