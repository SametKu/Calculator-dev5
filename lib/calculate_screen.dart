import 'package:flutter/material.dart';
import 'package:hesap_makinesi/buton_degerleri.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  String userInput='';
  String userInput2='';
  String islem='';
  final Color wColor=Colors.white;
  

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return  Scaffold(
          backgroundColor:const Color(0xFF1d2630),
          appBar: AppBar(title:  Text('Hesaplama', style: TextStyle(color: wColor ),),),
          body:  Column(
            children: [
              Column(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsetsDirectional.all(15),
                      alignment: Alignment.bottomRight,
                      child:  Text('$userInput$islem$userInput2'.isEmpty ? '0' :'$userInput$islem$userInput2' , style: TextStyle(color: wColor,fontSize: 48),),
                    ),
                  ),
                  const Divider(),
                  Wrap(
                    children: 
                      Btn.btnVls.map((value) => SizedBox(
                        width:value==Btn.equal ? screenSize.width/1.5 : screenSize.width/3,
                        height: screenSize.height/7,
                        child: buildButton(value))).toList(),
                    
                  )
                  
                
                ],
              ),
            ],
          ),
         
          ); 
                
  }

Widget buildButton(value){
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Material(
      color: Colors.amber,
      clipBehavior: Clip.hardEdge,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      child: InkWell(
        onTap: () => onBtnTap(value),
        child: Center(
          child: Text(value,style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),))),
    ),
  );
}

void onBtnTap(String value){
  if (value == Btn.ac) {
      ac();
      return;
      }
  if (value == Btn.equal) {
      islemtoplama();
  return;
    }
 eksfonk(value);
}
  
  void eksfonk(value){
    if(value!=Btn.equal && int.tryParse(value)==null){
    if(islem.isNotEmpty && userInput2.isNotEmpty){

    }
    islem=value;
  }else if(userInput.isEmpty||islem.isEmpty){
    if(value==Btn.equal && userInput.contains(Btn.equal)) return;
     if(value==Btn.equal && userInput.isEmpty || userInput==Btn.equal){
      value='0';
     }
      userInput+=value;
  }
  else if(userInput2.isEmpty||islem.isNotEmpty){
    if(value==Btn.equal && userInput2.contains(Btn.equal)) return;
     if(value==Btn.equal && userInput2.isEmpty || userInput2==Btn.equal){
      value='0';
     }
      userInput2+=value;
  }
   setState(() {
   
   });
  }
  void ac() {
    setState(() {
      userInput = "";
      userInput2 = "";
      islem = "";
    });
  }
  void islemtoplama() {
    
     if (userInput.isEmpty) return;
    if (islem.isEmpty) return;
    if (userInput2.isEmpty) return;

    final double num1 = double.parse(userInput);
    final double num2 = double.parse(userInput2);

    double sonuc = 0;
    switch (islem) {
      case Btn.add:
        sonuc = num1 + num2;
        break;
}
setState(() {
  userInput='$sonuc';
   islem = "";
  userInput2 = "";
});
}
}