import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your Story UI',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // Optional: Makes the AppBar icons and text white/clearer
        appBarTheme: AppBarTheme(backgroundColor: Colors.pink),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List posts = [
    {
      "name": "davidonyourfacebaby",
      "avatar": "https://images.unsplash.com/photo-1611459293885-f8e692ab0356?w=500&auto=format&fit=crop&q=60",
      "image": "https://picsum.photos/id/237/400/300"
    },
    {
      "name": "natashabanana",
      "avatar": "https://images.unsplash.com/photo-1621390842036-f01b53d9cbfd?w=500&auto=format&fit=crop&q=60",
      "image": "https://picsum.photos/id/593/400/300"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50], // Lighter pink for better contrast
      appBar: AppBar(
        title: Text("Share Your Story"),
        centerTitle: true,
        // Fix: leadingWidth increased to 150 to prevent overflow with 3 icons
        leadingWidth: 140,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: Icon(Icons.star_border), onPressed: () {}),
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          var post = posts[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(post["avatar"]),
                  ),
                  title: Text(post["name"], style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("21 minutes ago"),
                  trailing: Icon(Icons.more_horiz),
                ),
                Image.network(
                  post["image"],
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover, // Ensures image fills the space
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.thumb_up_alt_outlined),
                        label: Text("Interested"),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.mode_comment_outlined),
                        label: Text("Statement"),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.share_outlined),
                        label: Text("Share"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}