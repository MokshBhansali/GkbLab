import 'package:flutter/material.dart';
import '../global/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widgets/commonWidgets.dart';

class PostItem extends StatelessWidget {
  final myData;
  PostItem({this.myData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: ColorPlate.WhiteColor,
                boxShadow: [
                  BoxShadow(
                      color: ColorPlate.GreyColor300,
                      spreadRadius: .5,
                      blurRadius: 8,
                      offset: Offset(1, 1))
                ],
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: (myData.image == null)
                      ? Container(
                          child: LinearProgressIndicator(
                            backgroundColor: ColorPlate.WhiteColor,
                            valueColor: AlwaysStoppedAnimation(Colors.black12),
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl: myData.image ??
                              "https://cdn.pixabay.com/photo/2020/09/11/00/11/landscape-5561678_960_720.jpg",
                          imageBuilder: (context, imageProvider) => Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.fill)),
                          ),
                          placeholder: (context, image) => Container(
                            height: 200,
                            child: Center(child: CircularProgressIndicator()),
                          ),
                          errorWidget: (context, image, error) => Container(
                            height: 200,
                            child: Center(child: Icon(Icons.error)),
                          ),
                        ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      myData.email,
                      style: TextStyle(
                          color: ColorPlate.BlackColor,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    myData.postData,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: ColorPlate.BlackColor87, fontSize: 15.0),
                    maxLines: 5,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlatButton.icon(
                      label: Text("Share"),
                      onPressed: () => getShare(myData.email.toString(), myData.postData.toString()),
                      icon: Icon(Icons.share, color: ColorPlate.GreyColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
