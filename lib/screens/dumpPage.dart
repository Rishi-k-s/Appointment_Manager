// import 'package:animated_list/animated_list.dart';
// import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
// import 'package:implicitly_animated_reorderable_list/transitions.dart';

// class ReorderableListScreen extends StatefulWidget {
//   const ReorderableListScreen({super.key});

//   @override
//   _ReorderableListScreenState createState() => _ReorderableListScreenState();
// }

// class _ReorderableListScreenState extends State<ReorderableListScreen> {
//   late String valForList;
//   List<String> items = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reorderable List'),
//       ),
//       body: Column(
//         children: [
          
//           SizedBox(
//             height: 300,
//             child: ReorderableListView(
//               buildDefaultDragHandles: true,
//               keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//               padding: const EdgeInsets.symmetric(vertical: 16.0),
//               children: List.generate(
//                 items.length,
//                 (index) => ListTile(
//                   key: ValueKey(items[index]),
//                   title: Text(items[index]),
//                 ),
//               ),
//               onReorder: (oldIndex, newIndex) {
//                 setState(() {
//                   if (newIndex > oldIndex) newIndex -= 1;
//                   final item = items.removeAt(oldIndex);
//                   items.insert(newIndex, item);
//                 });
//               },
//             ),
            
//           ),
//           const SizedBox(height: 30.0,),
//           const Text("Add Item"),
//           TextField(onChanged: (value){
//             setState(() {
//               valForList = value;
//             });
//           },),
//           TextButton(onPressed: (){
//             setState(() {
//               items.add(valForList);
//             });
//           }, child: const Text("Njekk"))
//         ],
//       ),
//     );
//   }
// }
// class ReorderableListScreen extends StatefulWidget {
//   @override
//   _ReorderableListScreenState createState() => _ReorderableListScreenState();
// }

// class _ReorderableListScreenState extends State<ReorderableListScreen> {
//   List<String> items = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Implicitly Animated Reorderable List'),
//       ),
//       body: ImplicitlyAnimatedReorderableList<String>(
//         items: items,
//         itemBuilder: (context, itemAnimation, item, index) {
//           return Reorderable(
//             key: ValueKey(item),
//             builder: (context, dragAnimation, inDrag) {
//               final t = dragAnimation.value;
//               final elevation = lerpDouble(0, 8, t); // Example: Changing elevation during drag

//               return SizeFadeTransition(
//                 sizeFraction: 0.7,
//                 curve: Curves.easeInOut,
//                 animation: itemAnimation,
//                 child: Material(
//                   elevation: elevation,
//                   child: ListTile(
//                     title: Text(item),
//                     leading: Icon(Icons.drag_handle),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//         onReorderStarted: (item, index) {
//           // Called when an item starts being dragged
//           setState(() {
//             // Update the UI or handle any necessary logic
//           });
//         },
//         onReorderFinished: (item, from, to, newItems) {
//           // Called when the item is dropped and the reordering is complete
//           setState(() {
//             items = newItems;
//             // Update the UI or handle any necessary logic
//           });
//         },
//         reorderable: true,
//       ),
//     );
//   }
// }
import 'package:appoinment_view/models/appoinTile.dart';



final names = ["a","b","c","d"];
final indexNums = [1,2,3,4];

List<AppintmentTile> getAppointments() => List.generate(
      names.length,
      (index) => AppintmentTile(
        name: names[index],
        indexNum: indexNums[index],
      ),
    );