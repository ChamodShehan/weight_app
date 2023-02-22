import 'package:flutter/material.dart';
import 'package:weight_app/widgets/left_bar.dart';
import 'package:weight_app/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _heightController=TextEditingController();
  TextEditingController _weghtController=TextEditingController();
  double _bmiResult=0;
  String _textResult="";
  @override
  Widget build(BuildContext context) {
     final screen= MediaQuery.of(context).size;
    return Scaffold(
    backgroundColor:Colors.black26,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor:Colors.transparent,
        title:Text("BMI Weight",style:TextStyle(
          color:Colors.amber,
          fontWeight:FontWeight.w300,
          fontSize:42
        )
        )
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  
                  Container(
                    height:130,
                    width:screen.width/2,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                        
                        fontSize: 42,fontWeight:FontWeight.w300,color: Colors.amber,),
                      keyboardType:TextInputType.number,
                      decoration:InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(fontSize:42,fontWeight:FontWeight.w300,
                        color: Colors.amber.withOpacity(.8))
                      ) ,
                    ),
                  ),
                   Container(
                    height:130,
                    alignment: Alignment.center,
                    width:screen.width/2,
                    child: TextField(
                      controller: _weghtController,
                      style: TextStyle(fontSize: 42,fontWeight:FontWeight.w300,color: Colors.amber,),
                      keyboardType:TextInputType.number,
                      decoration:InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(fontSize:42,fontWeight:FontWeight.w300,
                        color: Colors.amber.withOpacity(.8))
                      ) ,
                    ),
                  )
                ]
              ),
              GestureDetector(
                onTap: (){
                  double _h=double.parse(_heightController.text);
                  double _w=double.parse(_weghtController.text);

                  setState((){
                    _bmiResult=_w/(_h*_h);

                    if(_bmiResult>25){
                      _textResult="You are over weight";
                      if(_bmiResult>18.5){
                      _textResult="You are normal weight";
                    }
                    }else{
                      _textResult="You are under weight";
                    }
                  });
                },
                child: Container(
                  child: Text("Calculator",
                  style: TextStyle(fontSize: 42,fontWeight:FontWeight.bold,color: Colors.amber.withOpacity(.8))
                  ),
                ),
              ),
              Container(
                child: Text(_bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90,fontWeight:FontWeight.bold,color: Colors.amber.withOpacity(.8))
                ),
              ),
              Visibility(
                visible:_textResult.isNotEmpty,
                child: Container(
                  child: Text(_textResult,
                  style: TextStyle(fontSize: 32,fontWeight:FontWeight.bold,color: Colors.amber.withOpacity(.8))
                  ),
                ),
              ),
              SizedBox(height:10),
              LeftBar(batWidh: 40,),
              SizedBox(height:20),
              LeftBar(batWidh: 70,),
              SizedBox(height:20),
              LeftBar(batWidh: 40,),
              SizedBox(height:20),
              RightBar(batWidh: 70),
               SizedBox(height:20),
              RightBar(batWidh: 70)
            ],
          ),
        )
        )
    );
  }
}