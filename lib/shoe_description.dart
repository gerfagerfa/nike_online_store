import 'package:flutter/material.dart';
import 'package:nike_online_store/data.dart';
import 'package:nike_online_store/constants.dart';
import 'dart:math' as math;

class ShoeDescription extends StatefulWidget {

  final Shoe shoe;

  ShoeDescription({@required this.shoe});

  @override
  _ShoeDescriptionState createState() => _ShoeDescriptionState();
}

class _ShoeDescriptionState extends State<ShoeDescription> {

  int _currentImage = 0;

  List<Widget> buildPageIndicator(){
    List<Widget> list = [];
    for (var i = 0; i < widget.shoe.images.length; i++) {
      list.add(i == _currentImage ? buildIndicator(true) : buildIndicator(false));
    }
    return list;
  }

  Widget buildIndicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: isActive ? 20.0 : 8.0,
      decoration: BoxDecoration(
        gradient: isActive ? kGradient : kGradientGrey,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: widget.shoe.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 16,),
            child: Icon(
              Icons.arrow_back,
              color: kPurpleCustom.withOpacity(0.5),
              size: 28,
            ),
          ),
        ),
        title: Row(
          children: <Widget>[

            Text(
              "MEN / ",
              style: TextStyle(
                color: kPurpleCustom.withOpacity(0.5),
              ),
            ),

            Text(
              "SHOES",
              style: TextStyle(
                color: kPurpleCustom,
              ),
            ),

          ],
        ),
        actions: <Widget>[

          Icon(
            Icons.search,
            color: kPurpleCustom.withOpacity(0.5),
            size: 28,
          ),

          SizedBox(
            width: 16,
          ),

          Icon(
            Icons.shopping_basket,
            color: kPurpleCustom,
            size: 28,
          ),

          SizedBox(
            width: 32,
          ),

        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          SizedBox(
            height: 16,
          ),

          Padding(
            padding: EdgeInsets.only(left: 32),
            child: Text(
              widget.shoe.family,
              style: TextStyle(
                color: kPurpleCustom,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(
            height: 16,
          ),

          Padding(
            padding: EdgeInsets.only(left: 32),
            child: Text(
              widget.shoe.name,
              style: TextStyle(
                color: kPurpleCustom.withOpacity(0.5),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(
            height: 32,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(left: 4, bottom: 8,),
                        child: Text(
                          "STYLE",
                          style: TextStyle(
                            color: kPurpleCustom.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),


                      Card(
                        elevation: 4,
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[

                                Row(
                                  children: <Widget>[

                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      width: 8,
                                    ),

                                    Text(
                                      "Wolf Grey",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                  ],
                                ),

                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.grey,
                                  size: 28,
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: 16,
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(left: 4, bottom: 8,),
                        child: Text(
                          "SIZE",
                          style: TextStyle(
                            color: kPurpleCustom.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),


                      Card(
                        elevation: 4,
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[

                                Text(
                                  "EUR - 45.5",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.grey,
                                  size: 28,
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

          SizedBox(
            height: 32,
          ),

          Expanded(
            child: Stack(
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(bottom: 16,),
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (int page){
                      setState(() {
                        _currentImage = page;
                      });
                    },
                    children: widget.shoe.images.map((path) {
                      return Center(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: size.height * 0.20,
                            margin: EdgeInsets.only(right: 32),
                            child: Hero(
                              tag: widget.shoe.name,
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(math.pi),
                                child: RotationTransition(
                                  turns: new AlwaysStoppedAnimation(20 / 360),
                                  child: Image.asset(
                                    path,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                widget.shoe.images.length > 1
                ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: buildPageIndicator(),
                    ),
                  )
                )
                : Container(),

                Padding(
                  padding: EdgeInsets.only(left: 32),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text(
                          "PRICE",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(
                          width: 16,
                        ),

                        Row(
                          children: <Widget>[
                            
                            Text(
                              (widget.shoe.price * (1 - widget.shoe.discount / 100)).toStringAsFixed(0),
                              style: TextStyle(
                                color: kPurpleCustom,
                                fontSize: 72,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              "€",
                              style: TextStyle(
                                color: kPurpleCustom,
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ],
                        ),

                        widget.shoe.discount > 0
                        ? Row(
                          children: <Widget>[

                            Text(
                              widget.shoe.price.toStringAsFixed(0),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),

                            Text(
                              "€",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),

                          ],
                        )
                        : Container(),

                      ],
                    ),
                  ),
                ),

                widget.shoe.discount > 0
                ? Padding(
                  padding: EdgeInsets.only(right: 32),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kDiscountColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6,),
                      child: Text(
                        "- " + widget.shoe.discount.toStringAsFixed(0) + "%",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
                : Container(),

              ],
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 24,),
            height: 64,
            decoration: BoxDecoration(
              gradient: kGradient,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                "ADD TO CART",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
