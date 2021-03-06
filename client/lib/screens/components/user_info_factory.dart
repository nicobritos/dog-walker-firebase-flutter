import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dogwalker2/models/users/dog_owner.dart';
import 'package:dogwalker2/screens/components/text_factory.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

abstract class UserInfoFactory {
  static Widget generateAvatar(DogOwner user, onTap) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: CircularProfileAvatar(
          user?.photoUrl,
          radius: 60.0,
          borderWidth: 0,
          backgroundColor: Colors.blueAccent,
          initialsText: Text(
            (user.name.substring(0, 1) + user.surname.substring(0, 1)).toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 60.0
            ),
          ),
        ),
      ),
    );
  }

  static Container generateDogOwnerSetUp(nameController, surnameController, phoneController) {
    return _generate(
      _generateDogOwnerWidgets(
        nameController,
        surnameController,
        phoneController,
        enabled: true
      )
    );
  }

  static Container generateDogOwner(nameController, surnameController, phoneController) {
    return _generate(
      _generateDogOwnerWidgets(
        nameController,
        surnameController,
        phoneController
      )
    );
  }

  static Container generateDogWalkerApply(
      context,
      nameController,
      surnameController,
      dateTimeController,
      onDateSet,
      phoneController,
      dniController
      ) {
    return _generate(
        _generateDogWalkerWidgets(
            context,
            nameController,
            surnameController,
            dateTimeController,
            onDateSet,
            phoneController,
            dniController,
            apply: true
        )
    );
  }

  static Container generateDogWalkerSetUp(
      context,
      nameController,
      surnameController,
      dateTimeController,
      onDateSet,
      phoneController,
      dniController
      ) {
    return _generate(
        _generateDogWalkerWidgets(
            context,
            nameController,
            surnameController,
            dateTimeController,
            onDateSet,
            phoneController,
            dniController,
            enabled: true
        )
    );
  }

  static Container generateDogWalker(
      context,
      nameController,
      surnameController,
      dateTimeController,
      onDateSet,
      phoneController,
      dniController
      ) {
    return _generate(
        _generateDogWalkerWidgets(
          context,
            nameController,
            surnameController,
            dateTimeController,
            onDateSet,
            phoneController,
            dniController
        )
    );
  }

  static Container _generate(List<Widget> widgets) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: widgets,
      ),
    );
  }

  static List<Widget> _generateDogOwnerWidgets(nameController, surnameController, phoneController, {enabled: false}) {
    return [
      TextFactory.generateTextField(
          nameController,
          "Nombre(s)",
          enabled: enabled,
          icon: Icon(
            FontAwesomeIcons.user,
            color: Colors.red,
          ),
      ),
      SizedBox(
        height: 10,
      ),
      TextFactory.generateTextField(
        surnameController,
        "Apellido(s)",
        enabled: enabled,
        icon: Icon(
          FontAwesomeIcons.user,
          color: Colors.red,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      TextFactory.generateTextFieldPhone(
        phoneController,
        "Telefono",
        enabled: true,
        icon: Icon(
          FontAwesomeIcons.phone,
          color: Colors.red,
        ),
      )
    ];
  }

  static List<Widget> _generateDogWalkerWidgets(
      context,
      nameController,
      surnameController,
      dateTimeController,
      onDateSet,
      phoneController,
      dniController,
      {enabled: false, apply: false}
      ) {
    List<Widget> widgets = _generateDogOwnerWidgets(nameController, surnameController, phoneController, enabled: apply ? false : enabled);

    widgets.addAll([
      SizedBox(
        height: 10,
      ),
      TextFactory.generateTextFieldDatetime(
          context,
          dateTimeController,
          "Fecha de nacimiento",
          enabled: apply ? true : enabled,
          icon: Icon(
            FontAwesomeIcons.calendarAlt,
            color: Colors.red,
          ),
          onDateSet: onDateSet
      ),
      SizedBox(
        height: 10,
      ),
      TextFactory.generateTextFieldNumeric(
        dniController,
        "DNI",
        enabled: apply ? true : enabled,
        icon: Icon(
          FontAwesomeIcons.phone,
          color: Colors.red,
        ),
      )
    ]);

    return widgets;
  }
}
