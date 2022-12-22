import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddExpanse extends StatefulWidget {
  const AddExpanse({Key? key}) : super(key: key);
  @override
  State<AddExpanse> createState() => _AddExpanseState();
}

class _AddExpanseState extends State<AddExpanse> {
  TextEditingController dateinput = TextEditingController();
  String? dropdownValue;

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expanse'),
        backgroundColor: Colors.orangeAccent, //background color of app bar
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewPadding.bottom,
                left: 30,
                right: 30),
            child: Column(
              children: [
                TextField(
                  controller: dateinput, //editing controller of this TextField
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_today),
                    fillColor: Colors.grey.shade100, //icon of text field
                    labelText: "Enter Date",
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
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
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
                const SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.category),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  value: dropdownValue,
                  elevation: 5,
                  style: const TextStyle(color: Colors.black),
                  items: <String>['Travel', 'Medical', 'Food', 'Friend']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                  hint: const Text('Please choose one'),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.currency_rupee),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Amount',
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
                      'Save',
                      style: TextStyle(
                          color: Color(0xff4c505b),
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color(0xff4c505b),
                      child: IconButton(
                        color: Colors.grey,
                        onPressed: () {
                          final snackbar = SnackBar(
                            content: const Text(' Data Save Successfully'),
                            action: SnackBarAction(
                              label: '',
                              onPressed: () {
                                // Add your undo code here
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
