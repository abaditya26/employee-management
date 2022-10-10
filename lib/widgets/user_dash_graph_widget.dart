import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_management/models/task_data_model.dart';
import 'package:flutter/material.dart';

import '../services/database_services.dart';

class UserDashGraphsWidget extends StatefulWidget {
  final String uid;

  const UserDashGraphsWidget({super.key, required this.uid});

  @override
  State<UserDashGraphsWidget> createState() => _UserDashGraphsWidgetState();
}

class _UserDashGraphsWidgetState extends State<UserDashGraphsWidget> {
  final _db = DatabaseServices();

  getData() {}
  var todayDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _db.getTasks(),
      builder: (context, snapshot) {
        List<TaskDataModel> tasks = [
          TaskDataModel(date: "", worked: 0, breaks: 0, meetings: 0),
          TaskDataModel(date: "", worked: 0, breaks: 0, meetings: 0),
          TaskDataModel(date: "", worked: 0, breaks: 0, meetings: 0),
          TaskDataModel(date: "", worked: 0, breaks: 0, meetings: 0),
          TaskDataModel(date: "", worked: 0, breaks: 0, meetings: 0),
          TaskDataModel(date: "", worked: 0, breaks: 0, meetings: 0),
          TaskDataModel(date: "", worked: 0, breaks: 0, meetings: 0),
        ];
        int i = 0;
        var dTH = todayDate.subtract(const Duration(days: 7));
        String dayTh = "${dTH.year}-${dTH.month}-${dTH.day}";
        print(dayTh);
        for (DocumentSnapshot document in snapshot.data!.docs) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          if ((data["startDateTime"] as String).split(" ")[0].compareTo(dayTh) >
              0) {
            tasks[i].date = (data["startDateTime"] as String).split(" ")[0];
            if (data["taskType"] == "Break") {
              tasks[i].breaks++;
            } else if (data["taskType"] == "Meeting") {
              // todayMeeting++;
              tasks[i].meetings++;
            } else {
              // todayWorked++;
              tasks[i].worked++;
            }
            i++;
          }
        }
        for (int i = 0; i < tasks.length; i++) {
          if (tasks[i].date.isEmpty) {
            tasks.remove(tasks[i]);
            i--;
          }
        }

        for (TaskDataModel t in tasks) {
          print("${t.date} := ${t.worked} ${t.meetings} ${t.breaks}");
        }
        if (tasks.isEmpty) {
          print("No data");
        }
        return Container(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "History for",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text("$todayDate".split(" ")[0]),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () async {
                      final dt = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000, 1, 1),
                          lastDate: DateTime.now());
                      if (dt != null) {
                        print(dt);
                        setState(() {
                          todayDate = dt;
                        });
                      }
                    },
                    icon: const Icon(Icons.calendar_month_outlined),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
