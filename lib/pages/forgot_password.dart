import 'package:flutter/material.dart';

class MyPassword extends StatefulWidget {
  const MyPassword({Key? key}) : super(key: key);

  @override
  State<MyPassword> createState() => _MyPasswordState();
}

class _MyPasswordState extends State<MyPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 130),
            child: const Text(
              'New Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5,
                  left: 30,
                  right: 30),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'New Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Re-new Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sign In',
                        style: TextStyle(
                            color: Color(0xff4c505b),
                            fontSize: 26,
                            fontWeight: FontWeight.w700),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.grey,
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          icon: Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
