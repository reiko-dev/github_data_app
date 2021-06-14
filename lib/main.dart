import 'package:flutter/material.dart';
import 'package:github_data_app/star_counter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(StarCounterApp());
}

class StarCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      routes: {
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  static final routeName = '/';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _repositoryName = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Card(
            elevation: 7,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Image.asset('assets/github.png'),
                    ),
                  ),
                  SizedBox(height: size.height * .04),
                  Text(
                    'GitHub Star Counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter a GitHub repository',
                      hintText: 'flutter/flutter',
                    ),
                    onChanged: (val) => _repositoryName = val,
                    onSubmitted: (text) {
                      setState(() {
                        _repositoryName = text;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text('Search'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GitHubStarCounter(
                      repositoryName: _repositoryName,
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.blue),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () => launch(
                      '/privacy_police.html',
                      enableJavaScript: true,
                      enableDomStorage: true,
                    ),
                    child: Text('Privacy Policy'),
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
