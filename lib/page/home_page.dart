import 'package:flutter/material.dart';
import 'package:todoapp/data/data.dart';

import '../widgets/list_tile_widget.dart';
import '../widgets/show_dialog_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Data().loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    List taskList = Data.taskList;
    void updateDatabase = Data().updateDatabase();

    void removeAt(int index) {
      setState(() {});
      taskList.removeAt(index);
      updateDatabase;
    }

    bool? onChanged(bool? value, int index) {
      setState(() {});

      if (value != null) {
        value ? taskList[index][1] = true : taskList[index][1] = false;
        updateDatabase;
      }
      return null;
    }

    void reloaded() {
      setState(() {});
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (ctx) {
                return ShowDialogWidget(
                  controller: controller,
                  taskList: taskList,
                  reloaded: reloaded,
                );
              });
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Tarefas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 45,
                  left: 25,
                ),
                child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (ctx, index) => ListTileWidget(
                    taskList: taskList[index],
                    deleteFunction: (context) => removeAt(index),
                    onChanged: (value) => onChanged(value, index),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
