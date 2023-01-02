import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoist/controller/task_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
          child:GetBuilder<TaskController>(
            builder: (_){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        Text("DEC 27, 2020",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: const Color(0xFF000000),fontSize: 32,fontWeight: FontWeight.bold),),
                        Text("5 incomplete, 5 completed",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: const Color(0xFF000000),fontSize: 14,fontWeight: FontWeight.w600),),
                        const Divider(thickness: 2,),
                      ],
                    ),
                     Flexible(
                       fit: FlexFit.tight,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Incomplete",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: const Color(0xFF000000),fontSize: 18,fontWeight: FontWeight.w600),),
                           ListView.builder(
                             shrinkWrap: true,
                               itemCount: taskController.toDoList.length,
                               itemBuilder: (context,index){
                                 return taskController.toDoList[index].isChecked!?const SizedBox():  Row(
                                   children: [
                                     Flexible(
                                       child: CheckboxListTile(
                                         contentPadding: EdgeInsets.zero,
                                         title: Text(taskController.toDoList[index].title!),
                                         subtitle: Text(taskController.toDoList[index].details!),
                                         value: taskController.toDoList[index].isChecked,
                                         onChanged: (newValue) {
                                           taskController.updateStatus(index);
                                         },
                                         controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                                       ),
                                     ),
                                     IconButton(
                                       onPressed: (){
                                         taskController.deleteTask(index);
                                       },
                                       icon: const Icon(Icons.delete),
                                     )
                                   ],
                                 );
                               }
                           ),
                         ],
                       ),
                     ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Completed",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: const Color(0xFF000000),fontSize: 18,fontWeight: FontWeight.w600),),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount:taskController.toDoList.length,
                              itemBuilder: (context,index){
                                return  taskController.toDoList[index].isChecked!?Flexible(
                                  child: CheckboxListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(taskController.toDoList[index].title!),
                                    //subtitle: const Text("SubTitle"),
                                    value: taskController.toDoList[index].isChecked,
                                    onChanged: (newValue) {
                                      //taskController.changeStatus(index);
                                    },
                                    controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                                  ),
                                ):const SizedBox();
                              }


                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },)
        ),

        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            backgroundColor: const Color(0xFFE44332),
            onPressed: (){
              Get.toNamed('/createTask');
            },
            child: const Icon(Icons.add)
        )
    );
  }
}
