import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int _currentIndex = 0;

List cardList = [const Item1(), const Item2(),const Item3(), const Item4()];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white24,
              ),
              child: Text(
                'Menu Bar',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                ),
              ),
            ),
            const Divider(
              thickness: 3,
              color: Colors.black,
            ),
            ListTile(
                leading: const Icon(Icons.home),
                title: const Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'home');
                }),
            ListTile(
              leading: const Icon(Icons.add_circle_outline),
              title: const Text(
                'Add Expanse',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'add_expanse');
              },
            ),
            ListTile(
              leading: const Icon(Icons.slideshow),
              title: const Text(
                'View Expanse',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'view_expanse');
              },
            ),
            ListTile(
              leading: const Icon(Icons.new_releases),
              title: const Text(
                'About',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'about');
              },
            ),
          ],
        ),
      ),
      body: ListView(children: [
        CarouselSlider(
          items: [
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1670424173758-ab655e14b9a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=401&q=80"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1671299202748-386d9fcb2b76?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1671486825255-ff5db2be0621?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1671471971131-196b75592f40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 2.0,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            viewportFraction: 1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(cardList, (index, url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Colors.black
                    : Colors.grey,
              ),
            );
          }),
        ),
        Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: cardList.map((card){
                return Builder(
                    builder:(BuildContext context){
                      return Container(
                        height: MediaQuery.of(context).size.height*0.30,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          child: card,
                        ),
                  );
                });
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(cardList, (index, url) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.black
                        : Colors.grey,
                  ),
                );
              }),
            ),
          ],
        )
      ]),
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              child: Table(
                children: const [
                  TableRow(children: [
                    Text(
                      'Date:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text('10-01-2022',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400)),
                  ]),
                  TableRow(children: [
                    Text('Category:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                    Text('Food',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400)),
                  ]),
                  TableRow(children: [
                    Text('Name:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                    Text('Ravi',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400)),
                  ]),
                  TableRow(children: [
                    Text('Amount:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                    Text('500',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              child: Table(
                children: const [
                  TableRow(children: [
                    Text(
                      'Date:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text('10-12-2022',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400)),
                  ]),
                  TableRow(children: [
                    Text('Category:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                    Text('Food',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400)),
                  ]),
                  TableRow(children: [
                    Text('Name:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                    Text('Vishal',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400)),
                  ]),
                  TableRow(children: [
                    Text('Amount:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                    Text('5,200',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Item3 extends StatelessWidget {
  const Item3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              child: Table(
                children: const [
                  TableRow(children: [
                    Text(
                      'Date:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text('14-01-2023',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400)),
                  ]),
                  TableRow(children: [
                    Text('Category:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                    Text('Friend',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400)),
                  ]),
                  TableRow(children: [
                    Text('Name:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                    Text('Jk',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400)),
                  ]),
                  TableRow(children: [
                    Text('Amount:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                    Text('200',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Item4 extends StatelessWidget {
  const Item4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              child: Table(
                children: const [
                  TableRow(children: [
                    Text(
                      'Date:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text('15-02-2023',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400)),
                  ]),
                  TableRow(children: [
                    Text('Category:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                    Text('Travel',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400)),
                  ]),
                  TableRow(children: [
                    Text('Name:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                    Text('kali',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400)),
                  ]),
                  TableRow(children: [
                    Text('Amount:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                    Text('1000',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}