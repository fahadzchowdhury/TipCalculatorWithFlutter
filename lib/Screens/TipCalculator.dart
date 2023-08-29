import 'package:flutter/material.dart';
import 'package:tip_calculator/Widgets/SimpleInputField.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final formkey = GlobalKey<FormState>();
  final totalBillController = TextEditingController();
  final totalTipController = TextEditingController();
  final totalPeopleController = TextEditingController();

  static const Color containerColor = Color(0xffF5F8FB);
  static const Color textBlack = Color(0xff232323);
  static const Color textLightBlack = Color(0xff717171);
  static const Color clearButtonColor = Color(0xffFF7511);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tip Calculator", style: TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.w700)),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.black54,
        elevation: 3,
      ),

      body:
      Padding(
        padding: const EdgeInsets.all(10),
        child: Form(  
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //top section

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(5)
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text("Total Bill", style: TextStyle(color: textLightBlack),),
                    Text("\$ ${totalBillController.text}", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: textBlack), ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total Persons", style: TextStyle(color: textLightBlack),),
                        const Text("Tip Amount", style: TextStyle(color: textLightBlack),),

                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("05", style: TextStyle(fontSize: 14,color: textBlack, fontWeight: FontWeight.w500)),
                        Text("\$ 20.0", style: TextStyle(color: textBlack, fontSize: 14, fontWeight: FontWeight.w500),),

                      ],
                    ),
                  ],
                ),
              ),
              //gap
              const SizedBox(height: 10,),

              //per person Amount Section
              Container(
                // margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(5)
                ),
                padding: const EdgeInsets.all(15),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Amount Per Person", style: TextStyle(color: textLightBlack, fontSize: 16, fontWeight: FontWeight.w300)),
                    Text("\$ ${totalBillController.text}", style: TextStyle(color: textBlack, fontWeight: FontWeight.w700, fontSize: 24),)
                  ],
                ),
              ),

              const Spacer(),

              // const Text("Total Bill", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: textBlack)),

              //

              SimpleInputField(
                  controller: totalBillController, title: "Total Bill", hinttext: "Please enter the total bill amount", iconData: Icons.attach_money,),

              SimpleInputField(
                  controller: totalTipController, title: "Tip percentage", hinttext: "Please enter tip percentage", iconData: Icons.percent,),

              SimpleInputField(
                  controller: totalPeopleController, title: "Number of people", hinttext: "Please enter number of people"),


              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        formkey.currentState!.validate();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        alignment: Alignment.center,
                        child: Text("Calculate", style: TextStyle(
                          color: Colors.white
                        ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10,),

                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                      decoration: BoxDecoration(
                          color: clearButtonColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text("Clear", style: TextStyle(
                          color: Colors.white
                      ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


// TextFormField(
//   controller: totalBillController,
//   keyboardType: TextInputType.number,
//   decoration: InputDecoration(
//     hintText: "Please enter total bill amount",
//     hintStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: textLightBlack),
//     suffixIcon: const Icon(Icons.attach_money),
//     filled: true,
//     fillColor: containerColor,
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(5),
//       borderSide: const BorderSide(width: 0, color: Colors.transparent)
//     ),
//     enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(5),
//         borderSide: const BorderSide(width: 0, color: Colors.transparent)
//     ),
//     focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(5),
//         borderSide: const BorderSide(width: 0, color: Colors.transparent)
//     )
//
//   ),
//   onFieldSubmitted: (value){
//     if(value.isEmpty)
//       {
//         totalBillController.text = "0.00";
//       }
//     totalBillController.text = value.toString();
//     // formkey.currentState!.save();
//     setState(() {});
//   },
// )