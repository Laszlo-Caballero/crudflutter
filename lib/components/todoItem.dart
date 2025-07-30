import 'package:crudflutter/models/todo.dart';
import 'package:crudflutter/services/todoService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';


class TodoItem extends StatelessWidget {
  final Todo todo;
  final _todoService = TodoService();

  TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.5
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
      child: Row(
        children: [
          Checkbox(value: todo.isCompleted, onChanged:(value) => {
              todo.isCompleted = value ?? false,
              _todoService.updateTodo(todo.key!, todo)
            },
            activeColor: Colors.blue,
          ),
          Expanded(
            child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Text(todo.title, 
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Badge(
                        label: Text(todo.isCompleted ? "Completada" : "Pendiente"),
                        backgroundColor: todo.isCompleted ? Colors.green : Colors.red,
                        padding: EdgeInsets.all(5),
                        textStyle: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Text(todo.description,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    spacing: 5,
                    children: [
                      Icon(
                        LucideIcons.calendar,
                        size: 15,
                        color: Colors.grey,
                      ),
                      Text(
                        todo.createdAt != null ? 
                          "${todo.createdAt!.day}/${todo.createdAt!.month}/${todo.createdAt!.year}" : 
                          "Fecha no disponible",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ),
            IconButton(
              icon: Icon(LucideIcons.trash2, color: Colors.red),
              onPressed: () {
                _todoService.deleteTodo(todo.key!);
              },
            )
        ],
      ),
    );
  }
}