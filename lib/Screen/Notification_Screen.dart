import 'package:demo_projectapp/Model/Notification_Model.dart';
import 'package:demo_projectapp/View_Model/Auth_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NotificationScreen extends StatefulWidget {
  String accessToken;
  NotificationScreen({super.key, required this.accessToken});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: FutureBuilder(
          future: authViewModel.notificationget(context, widget.accessToken),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              if (snapshot.hasData) {
                // ;; print("query data:$queryData");
                print('hello');
                final queryData = snapshot.data!;
                final userData = Notification_model.fromJson(queryData);
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: userData.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {},
                        leading: Text(userData.data![index].message!),

                        // trailing: InkWell(
                        //   onTap: () {
                        //     authViewModel.deletenotification(context, widget.accessToken,userData.data![index].sId! );
                        //   },
                        //  // child: Icon(Icons.delete)),
                      );
                    });
              } else {
                return Text('No data');
              }
            }
          },
        ),
      ),
    );
  }
}
