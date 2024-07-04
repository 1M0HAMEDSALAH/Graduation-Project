import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:KidsMonitorAndLearning/shared/styles/colors.dart';



class MyTasksPage extends StatefulWidget {
  const MyTasksPage({super.key, required this.id});
  final id ;

  @override
  State<MyTasksPage> createState() => _MyTasksPageState();
}

class _MyTasksPageState extends State<MyTasksPage> {


  List<QueryDocumentSnapshot> TasksData = [];

  _GetTasksFromFirebase()async
  {
    QuerySnapshot querySnapshot = await FirebaseFirestore
        .instance
        .collection('TasksSide')
        .where('id',isEqualTo: widget.id['Id'])
        .get();
    TasksData.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    _GetTasksFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks',
          style: TextStyle(
            color: defaultColor,
            fontSize: 25.0,
            fontWeight: FontWeight.w700
        ),),
      ),
      body: ConditionalBuilder(
          condition: TasksData.length > 0,
          builder: (BuildContext context)=>ListView.separated(
            itemBuilder: (context,index){
              return Dismissible(
                onDismissed: (direction) async {
                  //del
                  await FirebaseFirestore.instance.collection('TasksSide').doc(TasksData[index].id).delete();
                  //add Notification
                  await FirebaseFirestore.instance.collection('Notification').add({
                    'name' :TasksData[index]['Task Name'],
                    'date' :TasksData[index]['Task Date'],
                    'finish' : FieldValue.serverTimestamp(),
                  });
                },
                key: Key(TasksData[index]['id'].toString()),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(45, 139, 232, 1),
                        radius: 40,
                        child: Text('${TasksData[index]['Task Time']}',
                          style: TextStyle(color: Colors.white,fontFamily: 'default',),),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${TasksData[index]['Task Name']}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'default',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${TasksData[index]['Task Date']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'default',
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                        onPressed: ()async
                        {
                          //del
                          await FirebaseFirestore.instance.collection('TasksSide').doc(TasksData[index].id).delete();
                        },
                        icon: Icon(Icons.done_outlined,color: Colors.cyan,),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context,index){
              return Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.grey[300],
              );
            },
            itemCount: TasksData.length,
          ),
          fallback: (BuildContext context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.search_sharp,size: 100,color: Colors.grey,),
                Text('No Tasks Yet :)',style: TextStyle(fontSize: 22,fontFamily: 'default',),)
              ],
            ),
          ),
        ),
    );
  }
}
