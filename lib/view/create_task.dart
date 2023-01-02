import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todoist/model/task_model.dart';

import '../controller/task_controller.dart';
import '../utils/colors.dart';

class CreateTask extends StatelessWidget {
  Task? task;
  CreateTask({Key? key,this.task}) : super(key: key);
  final TaskController taskController = Get.put(TaskController());
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: SafeArea(
            child: Form(
              key: formKey,
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3.0,right: 23.0),
                            child: SvgPicture.asset("assets/icon/back_button.svg"),
                          ),
                        ),
                        Text("Create Task",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: const Color(0xFF000000),fontSize: 32,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text("DEC 27, 2022",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: const Color(0xFF000000),fontSize: 14,fontWeight: FontWeight.w600),),
                    ),
                    const SizedBox(height: 32,),
                    const Divider(thickness: 2,),
                    const SizedBox(height: 29,),
                    Container(
                      alignment: Alignment.center,
                      height: 18,
                      width: 76,
                      color: ColorRes.buttonColor,
                      child: Text("Task Title",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: const Color(0xFFFFFFFF),fontSize: 12),),
                    ),
                    Text("Task Title",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: const Color(0xFFFFFFFF),fontSize: 12)),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                          hintText: "Task Title"
                      ),

                      validator: (input) {
                        if (input!.isEmpty) {
                          return 'Please enter title';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: detailsController,
                      decoration: const InputDecoration(
                        hintText: "Task Details"
                      ),
                      validator: (input) {
                        if (input!.isEmpty) {
                          return 'Please enter details';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      floatingActionButton: SizedBox(
        width: 152.0,
        height: 52.0,

        child: ElevatedButton(
          onPressed: (){
            if(formKey.currentState!.validate()){
              taskController.createNewTask(
                  Task(details: detailsController.text, title: titleController.text, isChecked: false));
              Get.back();
            }

          },
          style:  ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(ColorRes.buttonColor),
          ),
          child: const Text("Save"),
        ),
      ));
  }
}
