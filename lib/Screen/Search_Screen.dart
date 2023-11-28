import 'package:demo_projectapp/Model/search_user_model.dart';
import 'package:demo_projectapp/View_Model/Auth_View_Model.dart';
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  String accessToken;
  SearchScreen({super.key, required this.accessToken,});
  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> searchResults = []; 
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Screen'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
            ),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              
            });
            searchElement();
          }, child: Text('Search')),
          searchElement(),
        ],
      ),
    );
  }

  dynamic searchElement() {
    return FutureBuilder(
      future: AuthViewModel().usersearch(
        
        context,widget.accessToken,searchController.text == '' ? "" : searchController.text,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child:  CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.hasData) {
            print('hello');
            final queryData = snapshot.data!;
            final userData = Search_User_Model.fromJson(queryData);
              print("query data:$queryData");
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: userData.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      // Navigator.pushNamed(context, RouteName.,arguments: {
                      //   'userid':userData.data![index].sId,
                      // });
                    },
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(widget.accessToken),
                    ),
                    title: Text(userData.data![index].username!),
                    // subtitle: Text(userData.data![index].userName!),
                  );
                });
          } else {
            return Text('No data');
          }
        }
      },
    );
  }
}
