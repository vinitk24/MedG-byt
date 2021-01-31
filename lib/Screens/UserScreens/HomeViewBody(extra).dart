import"package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeViewBody_Extra extends StatefulWidget {
  
  @override
  _HomeViewBody_ExtraState createState() => _HomeViewBody_ExtraState();
}

class _HomeViewBody_ExtraState extends State<HomeViewBody_Extra> {

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List _fetchedItems;
  List _items = [];
  int counter = 0;

  @override
  void initState() {
    super.initState();

    _loadItems();
  }

  Future<void> _loadItems() async {
    int ftwo =0;
    for (Map item in _fetchedItems) {
      // 1) Wait for one second
      await Future.delayed(Duration(milliseconds: 2000));
      // 2) Adding data to actual variable that holds the item.

      ftwo++;
      if(ftwo>2){break;}else{_items.add(item);}

      // 3) Telling animated list to start animation
      listKey.currentState.insertItem(_items.length - 1);
    }
  }
  Future<void> ClickItem(int ind)async{
    for(Map item in _fetchedItems.getRange(ind,ind+1)){

      await Future.delayed(Duration(milliseconds: 2000));
      _items.add(item);
      listKey.currentState.insertItem(_items.length - 1);

    }
  }

  Widget slideIt(BuildContext context, int index, animation) {
    String item = _items[index][index];
    String Q = _items[index]["question"];
    List type = _items[index]["type"];
    bool ans = _items[index]["ans"];
    TextStyle textStyle = Theme.of(context).textTheme.headline4;
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset(0, 0),
      ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.bounceIn,
          reverseCurve: Curves.bounceOut)),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Image.asset("images/eyeBOT.gif"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 50),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 0.1,
                            blurRadius: 0.2,
                            color: Colors.black26)
                      ]),
                  child: ans ? Text("${Q}") : Text("Im H'Bot here to Assist you."),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.w, right: 200.w),
              child: Text(
                "${Q}",
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ans
                ? Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 3,
                        color: Colors.black,
                        spreadRadius: 0.1,
                        offset: Offset(0.0, 1.0))
                  ]),
              margin: EdgeInsets.only(left: 50.w, right: 50.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //we can use for loop here
                  SizedBox(
                    height: 20.h,
                  ),
                  tile('${type[0]}',Q),
                  line(),
                  tile('${type[1]}',Q),
                  line(),
                  tile('${type[2]}',Q),
                  line(),
                  tile('${type[3]}',Q),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            )
                : Container()
          ],
        ),
      ),
    );
  }


  Widget line() {
    return Divider(
      thickness: 0.5,
      indent: 60.w,
      endIndent: 60.w,
    );

  }


  Widget tile(String answer,String Q) {
    int ind=3;
    return GestureDetector(
      onTap:(){
        setState(() {
          if(ind>2&&ind<_fetchedItems.length){
          ClickItem(ind);}
          ind++;
        });
      },
      child: Padding(
          padding: EdgeInsets.only(right: 5, top: 5, left: 20, bottom: 7),
          child: Text("$answer")),
    );
  }



  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Container(
            height: double.infinity,
            child: AnimatedList(
              key: listKey,
              initialItemCount: _items.length,
              itemBuilder: (context, index, animation) {
                return slideIt(context, index, animation);
              },
            ),
          ),
        ),

      ],
    );
  }
}

// class ChatBubble extends StatefulWidget{
//   String Q;
//   List type;
//   bool ans;
//   Function fun;
//   ChatBubble({this.fun,this.type, this.Q, this.ans});
//
//   @override
//   _ChatBubbleState createState() => _ChatBubbleState();
// }
// class _ChatBubbleState extends State<ChatBubble> {
//
//
//   //
//   // FirestoreService _firestoreService = locator<FirestoreService>();
//   //
//   // Map<String,String> QandA = {
//   //   "Question":"answer",
//   // };
//   //
//   // void insert(Q,ans){
//   //   QandA["$Q"]="$ans";
//   // }
//
//
//
//
//
//   //=============
//
//   // Widget ChatRoomList(){
//   //   return StreamBuilder(
//   //     stream: ,
//   //     builder: (context,snapshot){
//   //       return ListView.builder(
//   //         itemCount: snapshot.data.length,
//   //         itemBuilder: (context,index){
//   //           String Q = snapshot.data.documents[index]["question"];
//   //           List type = snapshot.data.documents[index]["type"];
//   //           bool ans = snapshot.data.documents[index]["ans"];
//   //           return ChatBubble(type: type,ans: ans,Q: Q,);
//   //         },
//   //       );
//   //     },
//   //   );
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<ChatBubbleModel>.reactive(builder: (context,model,child)=> viewModelBuilder: ()=>ChatBubbleModel());
//   }
// }
//


