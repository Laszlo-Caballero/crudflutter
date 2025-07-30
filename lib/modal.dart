import 'package:crudflutter/models/todo.dart';
import 'package:crudflutter/services/todoService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateStateScreen();
}



class _CreateStateScreen extends State<CreateScreen> {

  final _formKey = GlobalKey<FormState>();
  final _taskNameController = TextEditingController();
  final _taskDescriptionController = TextEditingController();
  final _todoService = TodoService();

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      final taskName = _taskNameController.text;
      final taskDescription = _taskDescriptionController.text;

      final newTask = Todo(
        title: taskName,
        description: taskDescription,
      );
      _todoService.addTodo(newTask);

      Navigator.of(context).pop();
    }
  }

  String? _validator(String? value){
    if(value == null || value.isEmpty|| value.trim().isEmpty){
      return "Este campo es obligatorio";
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child:  Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 20,
              children: <Widget>[
                Text("Crear Tarea",
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )
                ),
                TextFormField(
                  controller: _taskNameController,
                  decoration: const InputDecoration(
                    hintText: "Nombre de la tarea",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: _validator,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: _taskDescriptionController,
                    decoration: const InputDecoration(
                      hintText: "Descripción de la tarea",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(Colors.red)
                      ),
                      child: const Text("Cancelar",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _onSubmit,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(Colors.blue)
                      ),
                      child: const Text("Guardar",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }

}