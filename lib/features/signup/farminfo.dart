// import 'package:flutter/material.dart';
// import 'package:jobapp/shared/custombutton.dart';
// import 'package:jobapp/shared/textfield.dart';
// import 'package:jobapp/shared/titletext.dart';
//
// class farm_info extends StatefulWidget {
//   const farm_info({super.key});
//
//   @override
//   State<farm_info> createState() => _farm_infoState();
// }
//
// class _farm_infoState extends State<farm_info> {
//   @override
//   Widget build(BuildContext context) {
//     String? dropdwonValue;
//     final items = ['item1','item2','item3','item4'];
//     return Scaffold(
//       body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//         child:
//         Column(
//           children: [
//             Customtext(title: 'Farm Info',uptext: 'Signup 2 of 4',),
//               SizedBox(height: 15,),
//               CustomField(isPassword: false,prefixIcon: Icons.local_offer_outlined,hintText: 'Business Name',),
//               SizedBox(height: 24,),
//             CustomField(isPassword: false,prefixIcon: Icons.sentiment_satisfied_alt_outlined,hintText: 'Informal Name',),
//             SizedBox(height: 24,),
//             CustomField(isPassword: false,prefixIcon: Icons.home_outlined,hintText: 'Informal Name',),
//             SizedBox(height: 24,),
//             CustomField(isPassword: false,prefixIcon: Icons.location_on_outlined,hintText: 'Informal Name',),
//             SizedBox(height: 24,),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     height: 60,
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFE4E4E4),
//                       borderRadius: BorderRadius.circular(12)
//                     ),
//                     child: DropdownButtonHideUnderline(
//                       child: DropdownButton<String>(
//                           value: dropdwonValue,
//                           hint: Text('State',style: TextStyle(color: Colors.grey),),
//                           icon: Icon(Icons.arrow_drop_down,color: Colors.black,size: 40),
//                         items: items.map((String items){
//                             return DropdownMenuItem(child: Text(items),
//                       value: items,
//                       );
//                       }).toList(),
//                         onChanged: (String? newvalue){
//                             setState(() {
//                               dropdwonValue = newvalue!;
//                             });
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 15,),
//                 Expanded(flex:3,child: CustomField(isPassword: false,hintText: 'Enter pincode',))
//               ],
//             ),
//             SizedBox(
//               height: 120,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 20.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.black,size: 40,))),Spacer(),
//                   SizedBox(width: 50,),
//                   Expanded(flex: 3,   child: Custom_button(btName: 'Continue'))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//

import 'package:flutter/material.dart';
import 'package:loginapp/features/auth/data/models/registermodel.dart';

import '../../shared/widgets/custombutton.dart';
import '../../shared/widgets/textfield.dart';
import '../../shared/widgets/titletext.dart';
import '../auth/application/buttonfunctoin.dart';
import 'verification.dart';

class farm_info extends StatefulWidget {
  final RegisterModel model;
  const farm_info({
    super.key,
    required this.model,
  });

  @override
  State<farm_info> createState() => _farm_infoState();
}

class _farm_infoState extends State<farm_info> {
  // Persistence variables
  String? dropdwonValue;
  final businessController = TextEditingController();
  final InformalController = TextEditingController();
  // final StateController = TextEditingController();
  final AddressConroller = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();
  final states = ['Delhi', 'Haryana', 'UttarPradesh', 'Bihar'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double h = size.height;
    final double w = size.width;

    void dispose() {
      businessController.dispose();
      InformalController.dispose();
      AddressConroller.dispose();
      cityController.dispose();
      pincodeController.dispose();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.07),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Reduced top spacing to stop it from looking "too long"
                      SizedBox(height: h * 0.05),

                      const Customtext(
                          title: 'Farm Info', uptext: 'Signup 2 of 4'),

                      // Proportional gaps between fields
                      SizedBox(height: h * 0.025),
                      CustomField(
                          controller: businessController,
                          isPassword: false,
                          prefixIcon: Icons.local_offer_outlined,
                          hintText: 'Business Name'),

                      SizedBox(height: h * 0.015),
                      CustomField(
                          controller: InformalController,
                          isPassword: false,
                          prefixIcon: Icons.sentiment_satisfied_alt_outlined,
                          hintText: 'Informal Name'),

                      SizedBox(height: h * 0.015),
                      CustomField(
                          controller: AddressConroller,
                          isPassword: false,
                          prefixIcon: Icons.home_outlined,
                          hintText: 'Street Address'),

                      SizedBox(height: h * 0.015),
                      CustomField(
                          controller: cityController,
                          isPassword: false,
                          prefixIcon: Icons.location_on_outlined,
                          hintText: 'City'),

                      SizedBox(height: h * 0.015),

                      // State & Pincode Row
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              height: 55,
                              // Fixed height for input fields is safer for "start" alignment
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF1F1F1),
                                  borderRadius: BorderRadius.circular(12)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: dropdwonValue,
                                  isExpanded: true,
                                  hint: const Text('State',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14)),
                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.black, size: 28),
                                  items: states
                                      .map((val) => DropdownMenuItem(
                                          value: val, child: Text(val)))
                                      .toList(),
                                  onChanged: (val) =>
                                      setState(() => dropdwonValue = val),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: w * 0.04),
                          Expanded(
                              flex: 6,
                              child: CustomField(
                                  controller: pincodeController,
                                  isPassword: false,
                                  hintText: 'Enter pincode'))
                        ],
                      ),

                      // This pushes everything above to the top and everything below to the bottom
                      const Spacer(),

                      Padding(
                        padding: EdgeInsets.only(bottom: h * 0.03, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_back,
                                    color: Colors.black, size: 28)),
                            SizedBox(
                              width: w * 0.55,
                              height: 52,
                              // Fixed height for buttons ensures they don't look "fat"
                              child: Custom_button(
                                btName: 'Continue',
                                onTap: () {
                                  widget.model.businessName =
                                      businessController.text.trim();
                                  widget.model.informalName =
                                      InformalController.text.trim();
                                  widget.model.address =
                                      AddressConroller.text.trim();
                                  widget.model.city =
                                      cityController.text.trim();
                                  widget.model.state = dropdwonValue;
                                  widget.model.zipCode = int.tryParse(
                                      pincodeController.text.trim());
                                  FromHandler.ValidateAndeNext(
                                    context: context,
                                    model: widget.model,
                                    currentPageData: {
                                      "businessName": widget.model.businessName,
                                      "InformalName": widget.model.informalName,
                                      "address": widget.model.address,
                                      "city": widget.model.city,
                                      "state": widget.model.state,
                                      "zip": widget.model.zipCode,
                                    },
                                    NextScreen:
                                        Verification(model: widget.model),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
