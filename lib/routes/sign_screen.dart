import 'package:flutter/material.dart';

const Color blue = const Color(0xFF01B4E4);

class SignScreen extends StatefulWidget {
  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.white,
        ),
        title: const Text(
          "TMDB",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle_outlined),
            color: Colors.white,
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 30,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 16,
            ),
            _FormSection(),
            const SizedBox(
              height: 40,
            ),
            _TextSection(),
          ],
        ),
      ),
    );
  }
}

//-------------------Section Widgets-------------------
class _TextSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "In order to use the editing and ating capabilities of TMDB, as well as get personal recomendations you will need to login to your account. If you do not have an account, registreting for an account is free and simple. Click here to get started",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        _LinkButtonWidget(
          onPressed: () {},
          text: "Registration",
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "If you signed up but didn't get your verification email, click here to have it resent.",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        _LinkButtonWidget(onPressed: () {}, text: "Resent e-mail")
      ],
    );
  }
}

//---------------
class _FormSection extends StatefulWidget {
  @override
  State<_FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<_FormSection> {
  static const String user = "admin";
  static const String pass = "admin";

  final TextEditingController _userFieldController =
      TextEditingController(text: user);
  final TextEditingController _passFieldController =
      TextEditingController(text: pass);

  String _errorText = "";

  void login() {
    var userString = _userFieldController.text.toString();
    var passString = _passFieldController.text.toString();
    if ((userString == user) && (passString == pass)) {
      _errorText = "";
      Navigator.pushNamedAndRemoveUntil(
          context, 'homeScreen/', (route) => false);
    } else {
      _errorText = "Incorrect pass or name";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _userFieldController.text = user;
    _passFieldController.text = pass;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Login to your account",
          style:
              TextStyle(fontWeight: FontWeight.w600, fontSize: 25, height: 2),
        ),
        const SizedBox(
          height: 10,
        ),
        _TextFieldWidget(
          fieldName: "Useraname",
          controller: _userFieldController,
        ),
        const SizedBox(
          height: 10,
        ),
        _TextFieldWidget(
          fieldName: "Password",
          controller: _passFieldController,
        ),
        Text(
          _errorText,
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            _ButtonWidget(
              text: "Login",
              onPressed: () {
                login();
              },
            ),
            const SizedBox(
              width: 30,
            ),
            _LinkButtonWidget(
              onPressed: () {},
              text: "Reset password",
            ),
          ],
        )
      ],
    );
  }
}
//-------------------Section Widgets-------------------

//-------------------Component Widgets--------------
class _TextFieldWidget extends StatelessWidget {
  final TextEditingController _controller;
  final String _fieldName;
  _TextFieldWidget({required fieldName, required controller})
      : this._fieldName = fieldName,
        this._controller = controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_fieldName),
        TextFormField(
            cursorColor: const Color.fromARGB(255, 0, 0, 0),
            controller: _controller,
            cursorWidth: 1,
            decoration: const InputDecoration(
              //Focused
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: blue, width: 2),
              ),

              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
            )),
      ],
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  Function()? onPressed;
  late String text;

  _ButtonWidget(
      {required onPressed,
      required text,
      textColor = Colors.white,
      backColor = blue}) {
    this.text = text;
    this.onPressed = onPressed;
  }
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 25)),
          backgroundColor: MaterialStatePropertyAll(blue),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class _LinkButtonWidget extends StatelessWidget {
  Function()? onPressed;
  late String text;
  _LinkButtonWidget({required onPressed, required text}) {
    this.text = text;
    this.onPressed = onPressed;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
      child: Text(
        text,
        style: const TextStyle(color: blue),
      ),
    );
  }
}
//-------------------Component Widgets--------------


