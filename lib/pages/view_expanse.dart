import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ViewExpanse extends StatefulWidget {
  const ViewExpanse({Key? key}) : super(key: key);

  @override
  State<ViewExpanse> createState() => _ViewExpanseState();
}

class _ViewExpanseState extends State<ViewExpanse> {
  TextEditingController dateinput = TextEditingController();

  ScrollController scollBarController = ScrollController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Expanse'),
        backgroundColor: Colors.orangeAccent, //background color of app bar
      ),
      body: Center(
        child: SingleChildScrollView(
          controller: scollBarController,
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.bottom,
              left: 20,
              right: 20,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller:
                        dateinput, //editing controller of this TextField
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.calendar_today),
                      fillColor: Colors.grey.shade100,
                      hintStyle: const TextStyle(
                          color: Colors.black), //icon of text field
                      labelText: "Select Date",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ), //label text of field
                    ),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          dateinput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                  const Divider(
                    height: 50,
                    thickness: 5,
                    indent: 0,
                    endIndent: 0,
                    color: Color(0xFFFB8C00),
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text('10-01-2022',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400)),
                                ]),
                                TableRow(children: [
                                  Text('Category:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                  Text('Food',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400)),
                                ]),
                                TableRow(children: [
                                  Text('Name:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                  Text('Ravi',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400)),
                                ]),
                                TableRow(children: [
                                  Text('Amount:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                  Text('500',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400)),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text('10-01-2022',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400)),
                                ]),
                                TableRow(children: [
                                  Text('Category:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                  Text('Food',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400)),
                                ]),
                                TableRow(children: [
                                  Text('Name:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                  Text('Ravi',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400)),
                                ]),
                                TableRow(children: [
                                  Text('Amount:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                  Text('500',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400)),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text('10-01-2022',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400)),
                                ]),
                                TableRow(children: [
                                  Text('Category:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                  Text('Food',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400)),
                                ]),
                                TableRow(children: [
                                  Text('Name:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                  Text('Ravi',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400)),
                                ]),
                                TableRow(children: [
                                  Text('Amount:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                  Text('500',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400)),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text('10-01-2022',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400)),
                                ]),
                                TableRow(children: [
                                  Text('Category:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                  Text('Food',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400)),
                                ]),
                                TableRow(children: [
                                  Text('Name:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                  Text('Ravi',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400)),
                                ]),
                                TableRow(children: [
                                  Text('Amount:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                  Text('500',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400)),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
