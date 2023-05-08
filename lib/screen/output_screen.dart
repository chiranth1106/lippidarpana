import 'package:flutter/material.dart';
import 'package:project/controller/output_controller.dart';
import 'package:get/get.dart';

// class OutputScreen extends StatefulWidget {
//   const OutputScreen({Key? key}) : super(key: key);
//
//   @override
//   State<OutputScreen> createState() => _OutputScreenState();
// }
//
// class _OutputScreenState extends State<OutputScreen> {
//   @override
//   Widget build(BuildContext context) {
//     OutputController outputController = Get.find();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("OUTPUT"),
//         centerTitle: true,
//       ),
//       body: Obx(
//         () => ListView.separated(
//             itemBuilder: (BuildContext context, int index) {
//               return  ClipRRect(
//                 child: SizedBox(
//                   height: 200,
//                   width: 200,
//                   child: FadeInImage(
//                       placeholder: const AssetImage("assets/LipiDarpana.png"),
//                       image: NetworkImage(outputController.Output[index]),),
//                 ),
//               );
//             },
//             separatorBuilder: (BuildContext context, int index) {
//               return const SizedBox(
//                 height: 20,
//               );
//             },
//             itemCount: outputController.Output.length),
//       ),
//     );
//   }
// }

class OutputScreen extends GetView<OutputController> {
  const OutputScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("OUTPUT"),
      centerTitle: true,
    ), 
      body: Column(
        children: [
          // Container(child: ElevatedButton(child: Text('hello'),onPressed: () => {controller.test()},)),
          Image.network("https://firebasestorage.googleapis.com/v0/b/final-project-auth-8da0e.appspot.com/o/Output%2Foutput.png?alt=media&token=ae19e9e5-e921-47a6-b212-731b7e9a25c2",
          width: 100,
          height: 100,)
        ],
      ),
    );
  }
}
