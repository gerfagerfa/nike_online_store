import 'package:flutter/material.dart';
import 'package:nike_online_store/constants.dart';
import 'package:nike_online_store/data.dart';
import 'package:nike_online_store/shoe_description.dart';

class Shoes extends StatefulWidget {
  @override
  _ShoesState createState() => _ShoesState();
}

class _ShoesState extends State<Shoes> {

  List<Filter> filters = getFilterList();
  List<Shoe> shoes = getShoeList();
  Filter selectedFilter;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedFilter = filters[0];
    });
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 16,),
          child: Icon(
            Icons.arrow_back,
            color: kPurpleCustom.withOpacity(0.5),
            size: 28,
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
            color: kPurpleCustom,
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
              "Men Shoes",
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

          Container(
            height: 48,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: buildFilters(),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: buildShoes(size.height * 0.4),
              ),
            ),
          ),

        ],
      ),
      floatingActionButton: Card(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Container(
          width: 130,
          height: 50,
          color: Colors.grey[200],
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Icon(
                  Icons.filter_list,
                  size: 22,
                  color: Colors.black,
                ),

                SizedBox(
                  width: 16,
                ),

                Text(
                  "Filters",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  List<Widget> buildFilters(){
    List<Widget> list = [];
    for (var i = 0; i < filters.length; i++) {
      list.add(buildFilterOption(filters[i], i));
    }
    return list;
  }

  Widget buildFilterOption(Filter filter, int index){
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 24, left: index == 0 ? 32 : 0),
        child: Text(
          filter.name,
          style: TextStyle(
            color: selectedFilter == filter ? kPurpleCustom : kPurpleCustom.withOpacity(0.5),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  List<Widget> buildShoes(double itemHeight){
    List<Widget> list = [];
    for (var i = 0; i < shoes.length; i++) {
      list.add(buildShoeOption(shoes[i], itemHeight));
    }
    return list;
  }

  Widget buildShoeOption(Shoe shoe, double itemHeight){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShoeDescription(shoe: shoe)),
        );
      },
      child: Container(
        height: itemHeight,
        color: shoe.backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16,),
        child: Stack(
          children: <Widget>[

            Align(
              alignment: Alignment.topRight,
              child: Text(
                shoe.category.toString().substring(shoe.category.toString().indexOf('.') + 1).toUpperCase(),
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: itemHeight / 2,
                margin: EdgeInsets.only(top: 32,),
                child: Hero(
                  tag: shoe.name,
                  child: RotationTransition(
                    turns: new AlwaysStoppedAnimation(15 / 360),
                    child: Image.asset(
                      shoe.images[0],
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                shoe.discount > 0
                ? Container(
                  decoration: BoxDecoration(
                    color: kDiscountColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6,),
                  child: Text(
                    "- " + shoe.discount.toStringAsFixed(0) + "%",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
                : Container(),

                SizedBox(
                  height: 16,
                ),

                Text(
                  shoe.family,
                  style: TextStyle(
                    color: kPurpleCustom,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 8,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Text(
                      shoe.name,
                      style: TextStyle(
                        color: kPurpleCustom.withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),

                    Icon(
                      Icons.arrow_forward,
                      color: kPurpleCustom,
                      size: 28,
                    ),

                  ],
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }

}