import 'package:flutter/material.dart';

void main() => runApp(Social_MediaApp());

class Social_MediaApp extends StatelessWidget {
  final List<Social_Media> social = [
    Social_Media(
      name: 'LinkedIn',
      description:
          'LinkedIn is a business and employment-focused social media platform that works through websites and mobile apps',
      image:
          'https://images.pexels.com/photos/15406295/pexels-photo-15406295.jpeg?auto=compress&cs=tinysrgb&w=600',
      todos: [
        'Update your status.',
        'Make Connections.',
        'Get updated in your fields.'
      ],
    ),
    Social_Media(
      name: 'WhatsApp',
      description:
          'WhatsApp is a free, multi-platform messaging app that lets users make video and voice calls, send text messages, share their status, and more with just a Wi-Fi connection',
      image:
          'https://images.pexels.com/photos/4132538/pexels-photo-4132538.jpeg?auto=compress&cs=tinysrgb&w=600',
      todos: [
        'Send messages to people.',
        'Do a video call.',
        'Share your live location.'
      ],
    ),
    Social_Media(
      name: 'Facebook',
      description:
          'Facebook is a social networking website where users can post comments, share photographs, and post links to news or other interesting content on the web, chat live, and watch short-form video.',
      image:
          'https://images.pexels.com/photos/6162932/pexels-photo-6162932.jpeg?auto=compress&cs=tinysrgb&w=600',
      todos: [
        'Follow a person/page',
        'Put post and photos',
        'Send requests to your friends'
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media Platforms',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Social Media Platforms'),
        ),
        body: ListView.builder(
          itemCount: social.length,
          itemBuilder: (BuildContext context, int index) {
            return SocialCard(social: social[index]);
          },
        ),
      ),
    );
  }
}

class Social_Media {
  final String name;
  final String description;
  final String image;
  final List<String> todos;

  Social_Media(
      {required this.name,
      required this.description,
      required this.image,
      required this.todos});
}

class SocialCard extends StatefulWidget {
  final Social_Media social;

  SocialCard({required this.social});

  @override
  _SocialCardState createState() => _SocialCardState();
}

class _SocialCardState extends State<SocialCard> {
  bool _showTodos = false;

  void _toggleTodos() {
    setState(() {
      _showTodos = !_showTodos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TodoDescriptionPage(
                social: widget.social,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              widget.social.image,
              fit: BoxFit.cover,
              height: 200.0,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.social.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.social.description,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: _toggleTodos,
                        child: Text(
                          _showTodos ? 'Hide Todos' : 'Show Todos',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                  if (_showTodos)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.social.todos
                          .map(
                            (todo) => Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 4.0,
                                horizontal: 24.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                  SizedBox(width: 8.0),
                                  Expanded(
                                    child: Text(
                                      todo,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoDescriptionPage extends StatelessWidget {
  final Social_Media social;

  TodoDescriptionPage({required this.social});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(social.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              social.image,
              fit: BoxFit.cover,
              height: 200.0,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Things to Do',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: social.todos
                        .map(
                          (todo) => Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 24.0,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 8.0),
                                Expanded(
                                  child: Text(
                                    todo,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
