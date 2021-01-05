import 'package:flutter/material.dart';
import 'package:gkblab/widgets/postItem.dart';
import '../../services/postServices.dart';
import '../../global/colors.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              FutureBuilder(
                future: getPost(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData || snapshot.data == null) {
                    return Center();
                  } else {
                    return Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorPlate.RedColor,
                      ),
                      child: Text(
                        snapshot.data.length.toString() ?? 0,
                        style: TextStyle(fontSize: 10),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder(
        future: getPost(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              var myData = snapshot.data[index];
              return PostItem(myData: myData);
            },
          );
        },
      ),
    );
  }
}
