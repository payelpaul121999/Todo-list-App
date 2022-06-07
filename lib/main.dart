// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';
import 'package:todo_list/screens/add_task_screen.dart';
import 'package:todo_list/widgets/task_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      // builder: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TaskScreen(),
      ),
    );
  }
}

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 167, 38),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          //todo tash
          showModalBottomSheet(
              context: context, builder: (context) => const AddTaskScreen());
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 30.0,
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Todo List',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                '${Provider.of<TaskData>(context).taskCount} tasks',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal),
              )
            ]),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            child: const TasksList(),
          ))
        ],
      ),
    );
  }
}

// class TaskScreen extends StatefulWidget {
//   const TaskScreen({Key? key}) : super(key: key);

//   @override
//   State<TaskScreen> createState() => _TaskScreenState();
// }

// class _TaskScreenState extends State<TaskScreen> {
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlueAccent,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.lightBlueAccent,
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//         onPressed: () {
//           //todo tash
//           showModalBottomSheet(
//               context: context,
//               builder: (context) => AddTaskScreen((newTaskTitle) {
//                     //print(newTaskTitle);
//                     // setState(() {
//                     //   tasks.add(Task(name: newTaskTitle));
//                     // });
//                     Navigator.pop(context);
//                   }));
//         },
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children:  [
//                 const  CircleAvatar(
//                       backgroundColor: Colors.white,
//                       radius: 30.0,
//                       child: Icon(
//                         Icons.list,
//                         color: Colors.lightBlueAccent,
//                         size: 30.0,
//                       )),
//                  const SizedBox(
//                     height: 10,
//                   ),
//                const   Text(
//                     'Todoey',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 50.0,
//                         fontWeight: FontWeight.w700),
//                   ),
//                   Text(
//                     '${Provider.of<TaskData>(context).tasks.length} tasks',
//                     style:const TextStyle(
//                         color: Colors.white,
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.normal),
//                   )
//                 ]),
//           ),
//           Expanded(
//               child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20.0),
//                     topRight: Radius.circular(20.0))),
//             child: TasksList(),
//           ))
//         ],
//       ),
//     );
//   }
// }
