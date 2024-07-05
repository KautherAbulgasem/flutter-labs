import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/task_page.dart';
import 'package:flutter_application_1/pages/not_found_page.dart';
import 'package:flutter_application_1/providers/todo_provider.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: MaterialApp(
        title: 'Todo App',
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (context) => HomePage());
            case '/task':
              final TaskArguments args = settings.arguments as TaskArguments;
              return MaterialPageRoute(
                builder: (context) => TaskPage(taskArguments: args),
              );
            default:
              return MaterialPageRoute(builder: (context) => NotFoundPage());
          }
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) => NotFoundPage());
        },
      ),
    );
  }
}
