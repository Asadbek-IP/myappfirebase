import 'package:flutter/material.dart';
import 'package:myappfirebase/model/post_model.dart';
import 'package:myappfirebase/pages/create_page.dart';
import 'package:myappfirebase/services/auth.dart';
import 'package:myappfirebase/services/rtdb_service.dart';

import 'sign_up.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> _posts = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPosts();
  }

  _getPosts() async {
    setState(() {
      isLoading = true;
    });
    RTDB.getPosts(Auth.userId).then((value) {
      setState(() {
        _posts = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? info = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatePage()),
          );

          if (info != null) {
            _getPosts();
          }
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("${Auth.hozirgiFoy().email}"),
        actions: [
          IconButton(
              onPressed: () {
                Auth.logOut().then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                });
              },
              icon: const Icon(Icons.exit_to_app_rounded))
        ],
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: _posts.length,
                itemBuilder: ((context, index) => Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _posts[index].title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              _posts[index].body,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              ),
      ),
    );
  }
}
