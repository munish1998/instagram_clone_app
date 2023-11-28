
import 'package:flutter/material.dart';
class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});
  @override
  State<CommentScreen> createState() => _CommentScreenState();
}
class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {

     TextEditingController commentcontroller=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Comments'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/kohli_image.png'),
                  ),
                  title: Text("user"),
                  subtitle: Text("name"),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: commentcontroller,
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                suffixIcon: Icon(Icons.send),
              ),
              onSubmitted: (text) {
               
              },
            ),
          ),
        ],
      ),
    );

  }
}