import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Tile here...'),
            ),
            SizedBox(height: 10.h,),
            TextField(
              controller: decController,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Description here...'),
            ),
            SizedBox(height: 10.h,),
            ElevatedButton(
                style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.purple)),
                onPressed: () {}, child: Text("Create Task",style: TextStyle(color: Colors.white),)),
            SizedBox(height: 20.h,),
            Expanded(
              child: ListView.separated(itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Need to by a new laptop", maxLines: 1, style: TextStyle(overflow: TextOverflow.ellipsis),),
                  subtitle: Text("Here will be a 2 line of desciption...",maxLines: 2, style: TextStyle(overflow: TextOverflow.ellipsis, color: Colors.grey),),
                  trailing: Checkbox(value: true, onChanged: (value) {},),
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text((index + 1).toString()),
                  ),
                );
              }, separatorBuilder: (context, index) {
                return Divider();
              }, itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}
