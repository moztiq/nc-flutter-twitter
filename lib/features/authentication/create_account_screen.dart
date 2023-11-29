import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_twitter/constants/gaps.dart';
import 'package:nc_flutter_twitter/constants/sizes.dart';
import 'package:nc_flutter_twitter/features/authentication/customize_experience_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  bool _isTapDate = false;

  String _name = '';
  String _email = '';

  bool _nameValid = false;
  bool _emailValid = false;
  bool _dateValid = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
        if (_name.isEmpty) {
          _nameValid = false;
        } else {
          _nameValid = true;
        }
        _activeFormButton = _nameValid && _emailValid && _dateValid;
      });
    });
    _emailController.addListener(() {
      final regExp = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      setState(() {
        _email = _emailController.text;
        if (_email.isEmpty || !regExp.hasMatch(_email)) {
          _emailValid = false;
        } else {
          _emailValid = true;
        }
        _activeFormButton = _nameValid && _emailValid && _dateValid;
      });
    });
    _dateController.addListener(() {
      setState(() {
        _dateValid = true;
        _activeFormButton = _nameValid && _emailValid && _dateValid;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  bool _activeFormButton = false;

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _dateController.value = TextEditingValue(text: textDate);
  }

  void _onSubmit() {
    if (_nameValid && _emailValid && _dateValid) {
      _formKey.currentState!.save();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CustomizeExperienceScreen(formData: formData),
        ),
      );
    }
  }

  void _onCancelTap() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size32,
        ),
        leading: GestureDetector(
          onTap: _onCancelTap,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: Sizes.size8,
              ),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size14,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size32,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v28,
              const Text(
                "Create your account",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v28,
              TextFormField(
                controller: _nameController,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                cursorColor: Theme.of(context).primaryColor,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Name',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  suffixIcon: _nameValid
                      ? Align(
                          alignment: Alignment.centerRight,
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleCheck,
                            color: Colors.green,
                            size: Sizes.size28,
                          ),
                        )
                      : null,
                ),
                validator: (value) {
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    formData['name'] = newValue;
                  }
                },
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                cursorColor: Theme.of(context).primaryColor,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  suffixIcon: _emailValid
                      ? Align(
                          alignment: Alignment.centerRight,
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleCheck,
                            color: Colors.green,
                            size: Sizes.size28,
                          ),
                        )
                      : null,
                ),
                validator: (value) {
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    formData['email'] = newValue;
                  }
                },
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isTapDate = true;
                  });
                },
                child: TextFormField(
                  enabled: false,
                  controller: _dateController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Date of birth',
                    hintText: 'Date of birth',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    suffixIcon: _dateValid
                        ? Align(
                            alignment: Alignment.centerRight,
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Colors.green,
                              size: Sizes.size28,
                            ),
                          )
                        : null,
                  ),
                  validator: (value) {
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      formData['date'] = newValue;
                    }
                  },
                ),
              ),
              Gaps.v10,
              Container(
                child: _isTapDate
                    ? Text(
                        'This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      )
                    : null,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: _onSubmit,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(
                          vertical: Sizes.size10,
                          horizontal: Sizes.size28,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Sizes.size28,
                          ),
                          color: _activeFormButton
                              ? Colors.black
                              : Colors.grey.shade400,
                        ),
                        child: AnimatedDefaultTextStyle(
                          style: TextStyle(
                            color: _activeFormButton
                                ? Colors.white
                                : Colors.grey.shade100,
                            fontSize: Sizes.size18,
                            fontWeight: FontWeight.w600,
                          ),
                          duration: Duration(
                            milliseconds: 200,
                          ),
                          child: Text(
                            'Next',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.v40,
            ],
          ),
        ),
      ),
      bottomNavigationBar: _isTapDate
          ? BottomAppBar(
              color: Colors.white,
              height: Sizes.size96,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: _setTextFieldDate,
              ),
            )
          : null,
    );
  }
}
