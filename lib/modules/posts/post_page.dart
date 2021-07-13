import 'package:api_posts/modules/posts/post_controller.dart';
import 'package:api_posts/modules/posts/post_model.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostsController postsController = PostsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Container(
        child: FutureBuilder<List<Post>>(
          future: postsController.getPosts(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.done:
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                      title: Text(snapshot.data[index].title),
                      leading: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blueAccent),
                        height: 30,
                        width: 30,
                        child: Center(
                          child: Text(
                            "${snapshot.data[index].id}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ));
                  },
                  itemCount: snapshot.data.length,
                );
              default:
            }
          },
        ),
      ),
    );
  }
}
