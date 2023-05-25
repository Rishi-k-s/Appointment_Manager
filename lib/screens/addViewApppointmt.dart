import 'package:appoinment_view/models/appoinTile.dart';
import 'package:appoinment_view/screens/dumpPage.dart';
import 'package:flutter/material.dart';

class AddAppointments extends StatefulWidget {
  const AddAppointments({super.key});

  @override
  State<AddAppointments> createState() => _AddAppointmentsState();
}

class _AddAppointmentsState extends State<AddAppointments> {

  List <AppintmentTile>appointTileView = [];
 
  @override
  void initState(){
    super.initState();
    appointTileView = getAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("suii"),
          centerTitle: true,
        ),
        body: ReorderableListView.builder(
          itemCount: appointTileView.length,
          onReorder: (oldIndex, newIndex) => setState(() {
            final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

            final user = appointTileView.removeAt(oldIndex);
            appointTileView.insert(index, user);
          }),
          itemBuilder: (context, index) {
            final user = appointTileView[index];

            return buildUser(index, user);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: shuffleList,
          child: const Icon(Icons.shuffle),
        ),
      );

  }
  Widget buildUser(int index, AppintmentTile appoinmentTile) => ListTile(
        key: ValueKey(appoinmentTile),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text(appoinmentTile.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.black),
              onPressed: () => edit(index),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.black),
              onPressed: () => remove(index),
            ),
          ],
        ),
      );

  void remove(int index) => setState(() => appointTileView .removeAt(index));

  void edit(int index) => showDialog(
        context: context,
        builder: (context) {
          final user = appointTileView [index];

          return AlertDialog(
            content: TextFormField(
              initialValue: user.name,
              onFieldSubmitted: (_) => Navigator.of(context).pop(),
              onChanged: (name) => setState(() => user.name = name),
            ),
          );
        },
      );

  void shuffleList() => setState(() => appointTileView .shuffle());
}