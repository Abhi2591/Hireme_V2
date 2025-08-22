import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hireme_v2/bloc/todo/todo_bloc.dart';
import 'package:hireme_v2/utils/custom_stuffs.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController decController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("My To-Do Task"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Tile here...'),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextField(
              controller: decController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Description here...'),
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.purple)),
                onPressed: () {
                  context.read<TodoBloc>().add(AddTodoEvent(title: titleController.text.trim(), desc: decController.text.trim(), ctx: context));

                  },
                child: Text(
                  "Create Task",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: BlocConsumer<TodoBloc, TodoStates>(
                builder: (context, state) {
                  if(state is TaskTodoState){
                    if(state.records.isEmpty){
                      return Center(
                        child: Text("No Record Found"),
                      );
                    }
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              state.records[index]['title'],
                              maxLines: 1,
                              style: TextStyle(overflow: TextOverflow.ellipsis),
                            ),
                            subtitle: Text(
                              state.records[index]['desc'],
                              maxLines: 2,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.grey),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.blue,
                                  value: state.records[index]['isCompleted'],
                                  onChanged: (value) {
                                    print("Check Box Value : ${value}");
                                    context.read<TodoBloc>().add(UpdateTodoEvent(id: state.records[index]['id'], newValue: value));
                                  },
                                ),
                                Icon(Icons.edit, color: Colors.blue,),
                                GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      context.read<TodoBloc>().add(RemoveTodoEvent(id: state.records[index]['id']));
                                    },
                                    child: Icon(Icons.delete, color: Colors.red,))
                              ],
                            ),
                            leading: CircleAvatar(
                              backgroundColor: state.records[index]['isCompleted'] ?Colors.green : Colors.red,
                              child: Text((index + 1).toString()),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: state.records.length);
                  }
                  else{
                    return Center(
                      child: Text("Invalid State"),
                    );
                  }
                },
                listener: (context, state) {
                  if(state is TaskTodoState){
                    if(state.records.isEmpty)return;
                    titleController.clear();
                    decController.clear();
                    CustomSnackbar(context, "Event Success!!!");
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
