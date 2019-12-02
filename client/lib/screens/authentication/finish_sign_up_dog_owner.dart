import 'package:dogwalker2/screens/components/app_bar_factory.dart';
import 'package:dogwalker2/screens/components/button_factory.dart';
import 'package:dogwalker2/screens/components/text_factory.dart';
import 'package:dogwalker2/screens/components/user_info_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FinishSignUpDogOwnerPage extends StatefulWidget {
  @override
  FinishSignUpDogOwnerPageState createState() => FinishSignUpDogOwnerPageState();
}

class FinishSignUpDogOwnerPageState extends State<FinishSignUpDogOwnerPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController surnameController = new TextEditingController();
  TextEditingController dateTimeController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return buildAll(
        context,
        "Tengo perros",
        UserInfoFactory.generateDogOwnerSetUp(nameController, surnameController, dateTimeController, phoneController)
    );
  }

  Widget buildAll(BuildContext context, String titleText, Widget userWidget) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBarFactory.generate(context, titleText),
        body: SingleChildScrollView(
            reverse: true,
            child: Padding(
                padding: EdgeInsets.only(
                    top: 25,
                    left: 20,
                    right: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom
                ),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextFactory.generateText("Complete registro", size: 26.0, weight: FontWeight.bold),
                    ),
                    userWidget,
                    SizedBox(
                      height: 50,
                    ),
                    ButtonFactory.generate("CONTINUAR", _continue)
                  ],
                )
            )
        ),
      ),
    );
  }

  void _continue() {
  }
}
