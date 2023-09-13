import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, String> cvInfo = {
    'full_name': 'Victor Samuel Oyede',
    'slack_username': 'VCTR',
    'github_handle': 'vicsam',
    'bio':
        '''I'm a yoruba Ninja in glasses, that uses flutter in the battlefield.\n\nI use it beacause it's a crossplatform tool which am quite comfortable with.\n\nI am also a big fan of Call of duty.\n\nI learnt quite a number of soft skills from there, which are: Grit, Teamwork, Strategical Thinking, and also Dilligence. ''',
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 120,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.black),
                        child: const Center(
                          child: Text(
                            'Full Name:',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.amberAccent),
                        child: Center(
                          child: Text(
                            '${cvInfo['full_name']}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 120,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          //color: Colors.black
                        ),
                        child: const Center(
                          child: Text(
                            '    Slack \nUsername:',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.amberAccent),
                        child: Center(
                          child: Text(
                            '${cvInfo['slack_username']}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 120,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.black),
                        child: const Center(
                          child: Text(
                            'GitHub \nHandle:',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.amberAccent),
                        child: Center(
                          child: Text(
                            '${cvInfo['github_handle']}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          //color: Colors.black
                        ),
                        child: const Center(
                          child: Text(
                            'Bio:',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 170,
                        width: 270,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.amberAccent),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${cvInfo['bio']}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final updatedCVInfo = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditScreen(cvInfo: cvInfo),
                        ),
                      );

                      if (updatedCVInfo != null) {
                        setState(() {
                          cvInfo = updatedCVInfo;
                        });
                      }
                    },
                    child: Text(
                      'Edit CV',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditScreen extends StatefulWidget {
  final Map<String, String> cvInfo;

  EditScreen({required this.cvInfo});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController fullNameController;
  late TextEditingController slackUsernameController;
  late TextEditingController githubHandleController;
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();
    fullNameController =
        TextEditingController(text: widget.cvInfo['full_name']);
    slackUsernameController =
        TextEditingController(text: widget.cvInfo['slack_username']);
    githubHandleController =
        TextEditingController(text: widget.cvInfo['github_handle']);
    bioController = TextEditingController(text: widget.cvInfo['bio']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit CV'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: fullNameController,
                    decoration: InputDecoration(labelText: 'Full Name'),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: slackUsernameController,
                    decoration: InputDecoration(labelText: 'Slack Username'),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: githubHandleController,
                    decoration: InputDecoration(labelText: 'GitHub Handle'),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: bioController,
                    decoration: InputDecoration(labelText: 'Bio'),
                    maxLines: 5,
                    minLines: 1,
                    maxLength: 350,
                    autocorrect: true,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  // Save the edited CV information here.
                  widget.cvInfo['full_name'] = fullNameController.text;
                  widget.cvInfo['slack_username'] =
                      slackUsernameController.text;
                  widget.cvInfo['github_handle'] = githubHandleController.text;
                  widget.cvInfo['bio'] = bioController.text;

                  Navigator.pop(context, widget.cvInfo);
                },
                child: Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    fullNameController.dispose();
    slackUsernameController.dispose();
    githubHandleController.dispose();
    bioController.dispose();
    super.dispose();
  }
}
