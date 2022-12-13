import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  FormScreenState() {
    type = _TypeHarrasment[0];

    bool isLoading = true;
  }
  String? name;
  String? email;
  String? phonenumber;
  String? message;
  //String _MultiLineTextField;
  //FormScreenState() {
  //_type = _TypeHarrasment[0];

  List<String> _TypeHarrasment = [
    'Cyber',
    'Sexual',
    'Physical',
    'Psychological',
    'Discriminatory',
    'Others',
  ];
  String? type = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (value) {
        name = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }
        return null;
      },
      onSaved: (value) {
        email = value!;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Phone number is Required';
        }
        return null;
      },
      onSaved: (value) {
        phonenumber = value;
      },
    );
  }

  Widget _buildType() {
    return DropdownButton(
      value: type,
      items: _TypeHarrasment.map((e) => DropdownMenuItem(
            child: Text(e),
            value: e,
          )).toList(),
      onChanged: (val) {
        setState(() {
          type = val as String;
        });
      },
    );
  }

  Widget _buildMessage() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      minLines: 1, //Normal textInputField will be displayed
      maxLines: 5, // when user presses enter it will adapt to it
      decoration: InputDecoration(
        labelText: 'Message',
        hintText: 'Write A Message',
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ' Message is Required';
        }
        return null;
      },
      onSaved: (value) {
        message = value!;
      },
    );
  }
  //Widget _buildMessage() {
  //final TextEditingController _Textcontroller = TextEditingController();
  //return Scaffold(
  //body: Center(
  //child: Column(
  //mainAxisAlignment: MainAxisAlignment.center,
  //children: [
  //(_Textcontroller.value.text.isEmpty)
  //  ? Text("Please Enter Message")
  //: Text("Send Message: ${_Textcontroller.value.text}"),
  //Padding(
  //padding: const EdgeInsets.all(10.0),
  //child: TextFormField(
  //controller: _Textcontroller,
  //minLines: 1,
  //maxLines: 6,
  //keyboardType: TextInputType.multiline,
  //decoration: InputDecoration(
  //  hintText: 'Enter A Message Here',
  //hintStyle: TextStyle(color: Colors.grey),
  //border: OutlineInputBorder(
  //borderRadius: BorderRadius.all(Radius.circular(10)),
  //)),
  //),
  //),
  //ElevatedButton(
  //onPressed: () {
  //setState(() {
  //_Textcontroller.notifyListeners();
  //});
  //_Textcontroller.notifyListeners();
  //},
  //child: Text("Send Message"),
  //)
  //],
  //),
  //),
  //);
  //}
  //Widget _MultiLineTextFieldState() {
  //return TextFormField();

  //return TextFormField(
  //decoration:
  //  InputDecoration(labelText: 'Message', hintText: 'Write the Message'),
  //maxLines: 7,
  //validator: (value) {
  //if (value == null || value.isEmpty) {
  //return 'Message is Required';
  //}
  //return null;
  //},
  //onSaved: (value) {
  //_message = value!;
  //},
  //);
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report Form")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildName(),
                _buildEmail(),
                _buildPhoneNumber(),
                _buildType(),
                _buildMessage(),
                SizedBox(height: 100),
                ShinyButton(
                      color: Colors.red,
                      child: Text(
                      'Submit',
                      
                    ),
                    onPressed: () {
                      //if (!_formKey.currentState.validate()) {
                        //return;
                      //}

                      //_formKey.currentState.save();
                      print(name);
                      print(email);
                      print(type);
                      print(phonenumber);
                      print(message);
                    }, )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShinyButton extends StatefulWidget {
  final Widget child;
  final Color color;

  final VoidCallback onPressed;

  const ShinyButton({
    Key? key,
    required this.color,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  _ShinyButtonState createState() => _ShinyButtonState();
}

Future sendEmail({
  name,
  email,
  phonenumber,
  type,
  message,
}) async {
  final serviceId = 'service_bu91rsv';
  final templateId = 'template_k96es4d';
  final userId = '31dY_aklUXF6DbkG9';
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

  final response = await http.post(url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'phone_number': phonenumber,
          'user_type': type,
          'user_message': message,
        },
      }));

  (print('[Submit]${response.body}'));
}

class _ShinyButtonState extends State<ShinyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2000,
      ),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Container(
          child: widget.child,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                widget.color,
                Colors.white,
                widget.color,
              ],
              stops: [
                0.0,
                _controller.value,
                1.0,
              ],
            ),
          ),
        );
      },
    );
  }
}

//class MultiLineTextField extends StatefulWidget {
// @override
//_MultiLinetextFieldState createState() => _MultiLinetextFieldState();
//}

//class _MultiLinetextFieldState extends State<MultiLineTextField> {
//final TextEditingController _Textcontroller = TextEditingController();
//@override
//Widget _buildMessage(BuildContext context) {
//return Scaffold(
//body: Center(
//child: Column(
//mainAxisAlignment: MainAxisAlignment.center,
//children: [
//(_Textcontroller.value.text.isEmpty)
// ? Text("Please Enter Message")
//: Text("Send Message: ${_Textcontroller.value.text}"),
//Padding(
//padding: const EdgeInsets.all(10.0),
//child: TextFormField(
//controller: _Textcontroller,
//minLines: 1,
//maxLines: 6,
//keyboardType: TextInputType.multiline,
//decoration: InputDecoration(
//  hintText: 'Enter A Message Here',
//hintStyle: TextStyle(color: Colors.grey),
//border: OutlineInputBorder(
//borderRadius: BorderRadius.all(Radius.circular(10)),
//)),
//),
//),
//ElevatedButton(
//onPressed: () {
//setState(() {
//_Textcontroller.notifyListeners();
//});
//_Textcontroller.notifyListeners();
//},
//child: Text("Send Message"),
//)
//],
//),
//),
//);
//}

//@override
//Widget build(BuildContext context) {
// TODO: implement build
//throw UnimplementedError();
//}
//}

