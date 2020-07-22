import 'package:flutter/material.dart';

List<Item> unSelectedList;
List<Item> selectedList;

class SelectScreen extends StatefulWidget {
  @override
  SelectScreenState createState() => SelectScreenState();
}

class SelectScreenState extends State<SelectScreen> {
  @override
  void initState() {
    addList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customApp(),
      body: GridView.builder(
          itemCount: unSelectedList.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (BuildContext context, int index) {
            return GridItem(
                key: Key(unSelectedList[index].rank.toString()),
                item: unSelectedList[index],
                isSelected: (bool value) {
                  setState(() {
                    if (value) {
                      selectedList.add(unSelectedList[index]);
                    } else {
                      selectedList.remove(unSelectedList[index]);
                    }
                  });
                });
          }),
    );
  }
}

Widget customApp() {
  return AppBar(
    title: Text(selectedList.length < 1
        ? "Default AppBar"
        : "${selectedList.length} is selected"),
    actions: [
      selectedList.length < 1
          ? Container()
          : InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.delete),
              ),
            ),
    ],
  );
}

addList() {
  unSelectedList = List();
  selectedList = List();

  List.generate(20, (int index) {
    unSelectedList.add(Item(
        imageUrl:
            "https://i.picsum.photos/id/1/200/300.jpg?hmac=jH5bDkLr6Tgy3oAg5khKCHeunZMHq0ehBZr6vGifPLY",
        rank: index));
  });
}

class Item {
  String imageUrl;
  int rank;
  Item({this.imageUrl, this.rank});
}

class GridItem extends StatefulWidget {
  final Key keys;
  final Item item;
  final ValueChanged<bool> isSelected;

  const GridItem({Key key, this.keys, this.item, this.isSelected})
      : super(key: key);
  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Stack(
        children: [
          Image.network(
            widget.item.imageUrl,
            color: Colors.black.withOpacity(isSelected ? 0.9 : 0.0),
            colorBlendMode: BlendMode.color,
          ),
          isSelected
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
