// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import '../../contants/constants.dart';
// import 'package:fastaagent/global_widget/form_field.dart';

// class DRegisterScreen extends StatefulWidget {
//   final String phoneNum;
//   const DRegisterScreen({super.key, required this.phoneNum});

//   @override
//   State<DRegisterScreen> createState() => _DRegisterScreenState();
// }

// class _DRegisterScreenState extends State<DRegisterScreen> {
//   DriverController driverController = Get.put(DriverController());
//   TextEditingController fullNameCon = TextEditingController();
//   TextEditingController acountNumCon = TextEditingController();
//   TextEditingController acountNameCon = TextEditingController();
//   TextEditingController bankNameCon = TextEditingController();
//   bool isComplete = false;
//   String dropDownvalue = "Monthly";
//   @override
//   void initState() {
//     DStorage.driverlogOut();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.mainColor,
//       body: driverController.state
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 70),
//                     Text("Please enter correct information in the box",
//                         style: AppTextStyle.heading2()),
//                     const SizedBox(height: 30),
//                     Text("Enter your full name", style: AppTextStyle.capton()),
//                     Formfied(
//                       emailController: fullNameCon,
//                       hintText: 'Full Name',
//                     ),
//                     const SizedBox(height: 30),
//                     Text("Bank Name", style: AppTextStyle.capton()),
//                     Formfied(
//                         emailController: bankNameCon,
//                         hintText: "Bank Name",
//                         keyboardType: TextInputType.name),
//                     const SizedBox(height: 30),
//                     Text("Account Number", style: AppTextStyle.capton()),
//                     Formfied(
//                       emailController: acountNumCon,
//                       hintText: "Account Number",
//                       keyboardType: TextInputType.number,
//                     ),
//                     const SizedBox(height: 30),
//                     Text("Account Name", style: AppTextStyle.capton()),
//                     Formfied(
//                       emailController: acountNameCon,
//                       hintText: 'Account Name',
//                     ),
//                     const SizedBox(height: 30),
//                     Align(
//                       alignment: Alignment.bottomLeft,
//                       child: Container(
//                         padding: const EdgeInsets.only(left: 20),
//                         margin: const EdgeInsets.symmetric(horizontal: 5)
//                             .copyWith(right: 15),
//                         decoration: BoxDecoration(
//                           border:
//                               Border.all(color: AppColor.backgroundsecondary),
//                           color: AppColor.mainColor,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: DropdownButtonFormField(
//                             borderRadius: BorderRadius.circular(20),
//                             alignment: Alignment.center,
//                             value: dropDownvalue,
//                             decoration:
//                                 const InputDecoration(border: InputBorder.none),
//                             icon: const Icon(Icons.arrow_drop_down_outlined),
//                             dropdownColor: AppColor.mainSecondryColor,
//                             items: [
//                               DropdownMenuItem(
//                                 value: "Weekly",
//                                 child: Center(
//                                   child: Text("Weekly",
//                                       style: AppTextStyle.body()),
//                                 ),
//                               ),
//                               DropdownMenuItem(
//                                 value: "Monthly",
//                                 child: Center(
//                                   child: Text(
//                                     "Monthly",
//                                     style: AppTextStyle.capton(),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                             onChanged: (v) {
//                               setState(() {
//                                 v = dropDownvalue;
//                               });
//                               if (acountNameCon.text == "" ||
//                                   acountNumCon.text == '' ||
//                                   bankNameCon.text == '' ||
//                                   fullNameCon.text == '') {
//                                 setState(() {
//                                   isComplete = false;
//                                 });
//                                 Get.snackbar("Notice", "All Feild Are Required",
//                                     snackPosition: SnackPosition.BOTTOM);
//                               } else {
//                                 setState(() {
//                                   isComplete = true;
//                                 });
//                               }
//                             }),
//                       ),
//                     ),
//                     const SizedBox(height: 100),
//                     isComplete
//                         ? ButtonComp(
//                             onPressed: () async {
//                               setState(() {
//                                 driverController.state = true;
//                               });

//                               final data = await driverController.updateName(
//                                   name: fullNameCon.text,
//                                   phoneNumber: widget.phoneNum,
//                                   driverAccName: acountNameCon.text,
//                                   driverAccNum: acountNumCon.text,
//                                   driverBank: bankNameCon.text,
//                                   paymentOption: dropDownvalue);

//                               setState(() {
//                                 driverController.state = false;
//                               });
//                               if (data["name"] != null &&
//                                   data["accountNumber"] != null) {
//                                 Get.to(
//                                     () => DriverForm(name: fullNameCon.text));
//                               }
//                             },
//                             value: "Complete")
//                         : const InActiveButtonComp(value: "Complete"),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }
