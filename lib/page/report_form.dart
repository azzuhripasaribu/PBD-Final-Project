import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  FormScreenState() {
    _type = _TypeHarrasment[0];
  }
  bool isLoading = true;

  String? _name;
  String? _email;
  String? _phoneNumber;

  String? _message;

  List<String> _TypeHarrasment = [
    'Cyber',
    'Sexual',
    'Physical',
    'Psychological',
    'Discriminatory',
    'Others',
  ];
  String? _type = '';

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
        _name = value!;
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
        _email = value!;
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
        _phoneNumber = value!;
      },
    );
  }

  Widget _buildType() {
    return DropdownButton(
      value: _type,
      items: _TypeHarrasment.map((e) => DropdownMenuItem(
            child: Text(e),
            value: e,
          )).toList(),
      onChanged: (val) {
        setState(() {
          _type = val as String;
        });
      },
    );
  }

  Widget _buildMessage() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Message', hintText: 'Write the Message'),
      maxLines: 7,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Message is Required';
        }
        return null;
      },
      onSaved: (value) {
        _message = value!;
      },
    );
  }

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildEmail(),
                _buildType(),
                _buildPhoneNumber(),
                _buildMessage(),
                SizedBox(height: 100),
                TextButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Color.fromARGB(255, 235, 115, 107),
                        fontSize: 16),
                  ),
                  onPressed: () {
                    print(_name);
                    print(_email);
                    print(_phoneNumber);
                    print(_TypeHarrasment);
                    print(_message);

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//class ShinyButton extends StatefulWidget {
  //final Widget child;
  //final Color color;
  //final VoidCallback onTap;

  //const ShinyButton({Key key,this.color,this.onTap,this.child,}) : super(key: key);

  //@override
  //_ShinyButtonState createState() => _ShinyButtonState();

//}
