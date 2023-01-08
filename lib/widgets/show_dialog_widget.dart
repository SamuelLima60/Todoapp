import 'package:flutter/material.dart';

import '../data/data.dart';

class ShowDialogWidget extends StatelessWidget {
  final TextEditingController controller;
  final List taskList;
  final void Function() reloaded;

  const ShowDialogWidget(
      {super.key,
      required this.controller,
      required this.taskList,
      required this.reloaded});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Tarefa'),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            TextField(
              controller: controller,
              maxLength: 50,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite o nome da tarefa',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    taskList.add([controller.text, false]);

                    Data().updateDatabase();

                    reloaded();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Salvar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Fechar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
