import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_like_css/gradient_like_css.dart';
import 'package:real_app/style/text_field_style.dart';

class AddGroupDialog extends StatelessWidget {
  const AddGroupDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     gradient: linearGradient(150, [ '#1f005c', '#6c0060', '#a40059', '#cf2b4c', '#ea623b', '#f7972e', '#f4cb36', '#e2ff61'])
      // ),
      // width: 200,
      height: 350,
      // padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("New Group:" ,style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please enter group code.";
                    }
                  },
                // style: TextStyle(backgroundColor: Colors.red.shade50),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.code),
                  filled: true, //<-- SEE HERE
                  fillColor: Colors.grey.shade200,
                  labelText: "Group Code",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                )
              )
            ),
            Padding(
                padding: const EdgeInsets.all(8),
              child: TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Please enter group name.";
                  }
                },
                // style: TextStyle(backgroundColor: Colors.red.shade50),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.send_time_extension_outlined),
                  filled: true, //<-- SEE HERE
                  fillColor: Colors.grey.shade200,
                  labelText: "Group Name",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              )
            ),
            Padding(
                padding: const EdgeInsets.all(8),
              child: TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please enter group description.";
                    }
                  },
              // style: TextStyle(backgroundColor: Colors.red.shade50),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.description_outlined),
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.grey.shade200,
                    labelText: "Group Description",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  )
    )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){

                },
                child: Text("Add Group"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
