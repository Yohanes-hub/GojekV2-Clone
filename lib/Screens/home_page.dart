
import 'package:flutter/material.dart';
import 'package:gojekv2/models/gojek_model.dart';
import 'package:gojekv2/utils/size_config.dart';
import 'package:gojekv2/widgets/custom_text.dart';
import 'package:gojekv2/widgets/gopay_card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PanelController controller =new PanelController();
  double _panelHeightClosed;
  double _panelHeightOpen;
  List<Promo> listTp = [];
  List<Category> listCat = [];
  List<Food> listFood = [];

  @override
  void initState() {
    setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _panelHeightOpen = SizeConfig.screenHeight / 1.11;
    _panelHeightClosed = SizeConfig.screenHeight / 2;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SlidingUpPanel(
          maxHeight: _panelHeightOpen,
          minHeight: _panelHeightClosed,
          parallaxEnabled: true,
          parallaxOffset: .5,
          controller: controller,
          defaultPanelState: PanelState.CLOSED,
          body: _body(),
          panelBuilder: (sc) {
            return _panel(sc);
          },
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28.0),
              topRight: Radius.circular(28.0)
          ),
          onPanelSlide: (double pos) => setState(() {}),
        )
      ],
    );
  }
  Widget _body(){
    return Scaffold(
      body: Column(
        children: [
          Flexible(
              flex: 1,
              child: Container(child: Center(child: Image.asset("assets/img/home.png")))),
          Flexible(
              flex: 1,
              child: Container(child: Center(child: Text('')))),
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc){
    return ListView(
      controller: sc,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
            )
          ],
        ),
        SizedBox(height: 18.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: SizeConfig.screenHeight / 12,
                padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                child: TextFormField(
                  enabled: false,
                  cursorColor: Colors.orange[200],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.blue,
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Icon(Icons.search,color: Colors.black,size: 30,),
                    hintText: "where do you want to go ?",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.black)
                    )
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 20),
              child: Image.asset("assets/img/usr2.png",
                  color: Colors.green,
              width: 40,height: 40,
              ),
            ),
            SizedBox(width: 10,)
          ],
        ),
        Container(
          height: 120,
          margin: EdgeInsets.all(8),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
    ),
    color: Color(0xff176ba3),
           child: Container(
    margin: EdgeInsets.all(10),
           child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10)
          )
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/img/gopay.png",
                  height: 20,
                  fit: BoxFit.cover,
                    width: 70,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Easy Payment With Gopay! \n Rp.50.000'),
                )
              ],
            ),
          ),
          GopayCard(Icons.upload_outlined, "Pay"),
          GopayCard(Icons.add, "Top Up"),
          GopayCard(Icons.explore, "Explore"),
        ],
      ),
            ),
          ),
        ), SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: HeaderItem(
                images: 'images/goride.png',
                title: 'GoRide',
                textcolor: Colors.grey[600],
              ),
            ),
            HeaderItem(
              images: 'images/gocar.png',
              title: 'GoCar',
              textcolor: Colors.grey[600],
            ),
            HeaderItem(
              images: 'images/gofood.png',
              title: 'GoFood',
              textcolor: Colors.grey[600],
            ),
            HeaderItem(
              images: 'images/gobluebird.png',
              title: 'GoBlueBird',
              textcolor: Colors.grey[600],
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            HeaderItem(
              images: 'images/gosend.png',
              title: 'GoSend',
              textcolor: Colors.grey[600],
            ),
            HeaderItem(
              images: 'images/godeals.png',
              title: 'GoDeals',
              textcolor: Colors.grey[600],
            ),
            HeaderItem(
              images: 'images/gopulsa.png',
              title: 'GoPulsa',
              textcolor: Colors.grey[600],
            ),
            HeaderItem(
              images: 'images/more-1.png',
              title: 'MORE',
              textcolor: Colors.grey[600],
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Padding(padding: const EdgeInsets.only(left:20),
        child: customText("Top Picks For You", SizeConfig.blockVertical * 3),),
        SizedBox(height: 8.0,),
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context,int i) => Container(
            child: Center(
              child: Card(
                color: listCat[i].isActive == true
                ? Colors.green
                : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Text(listCat[i].name,style: TextStyle(color:
                listCat[i].isActive == true
                    ?Colors.white
                    :Colors.grey
                ),),
                ),
              ),
            ),itemCount: listCat.length,
          )
        ),
        SizedBox(height: 8.0,),
        Padding(padding: const EdgeInsets.only(left: 20),
        child: customText("Info Terbaru", SizeConfig.blockVertical * 3),
        ),
        SizedBox(height: 4.0,),
        ListView.builder(
          shrinkWrap: true,
          itemCount: listTp.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context,int i){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                children: [
                  Image.asset(listTp[i].img,
                  fit: BoxFit.cover,
                  width: SizeConfig.screenWidth,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(listTp[i].name),
                  )
                ],
                ),
              ),
            );
          }
        )
      ],
    );
  }



  void setData() {
    setState(() {
      //top picks
      listCat.add(new Category(name: "all",));
      listCat.add(new Category(name: "Covid-19",));
      listCat.add(new Category(name: "Donation",));
      listCat.add(new Category(name: "Entertainment",));
      listCat.add(new Category(name: "Food",));

      //promo
      listTp.add(new Promo(
        name: 'Promo Jajan Terus Pake Gopay',
        img: "assets/img/gojek1.webp"
      ));
      listTp.add(new Promo(
        name: 'Go-Ride New Protocol',
        img: "assets/img/gojek2.webp"
      ));
    });
  }
}

class HeaderItem extends StatelessWidget {
  const HeaderItem({Key key, this.images, this.title, this.textcolor})
      : super(key: key);
  final String images;
  final String title;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Column(
        children: <Widget>[
          Image.asset(
            images,
            scale: 3,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(color: textcolor ?? Colors.white),
          )
        ],
      ),
    );
  }
}
