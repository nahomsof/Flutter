import "package:another_project/pages/second_page.dart";
import "package:flutter/material.dart";

class firstpage extends StatelessWidget {
  const firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("1st Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Seconf page"),
          onPressed: () {
            //Navigate to next page
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => secondpage()));
          },
        ),
      ),
    );
  }
}
