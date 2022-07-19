import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/screens/authentication/choose_avatar.dart';
import 'package:globaltrailblazersapp/screens/authentication/login.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<DropDownValueModel> curriculums = const [
    DropDownValueModel(name: 'Rwanda Curriculum', value: "Rwanda Curriculum"),
    DropDownValueModel(name: 'USA Curriculum', value: "USA Curriculum"),
    DropDownValueModel(name: 'America Curriculum', value: 'America Curriculum'),
    DropDownValueModel(name: 'Cambridge', value: 'Cambridge')
  ];
  List<DropDownValueModel> countries = const [
    DropDownValueModel(name: "Rwanda", value: "Rwanda"),
    DropDownValueModel(name: "Burundi", value: "Burundi"),
    DropDownValueModel(name: "DR Congo", value: "DR Congo"),
    DropDownValueModel(name: "Tanzania", value: "Tanzania"),
    DropDownValueModel(name: "Kenya", value: "Kenya"),
    DropDownValueModel(name: "Uganda", value: "Uganda"),
    DropDownValueModel(name: "South Sudan", value: "South Sudan"),
    DropDownValueModel(name: "None of the above", value: "None of the above"),
  ];
  List<DropDownValueModel> grades = const [
    DropDownValueModel(name: "A+", value: "A+"),
    DropDownValueModel(name: "A", value: "A"),
    DropDownValueModel(name: "B", value: "B"),
    DropDownValueModel(name: "C", value: "C"),
    DropDownValueModel(name: "D", value: "D"),
    DropDownValueModel(name: "D2", value: "D2"),
  ];
  List<DropDownValueModel> genders = const [
    DropDownValueModel(name: "Male", value: "Male"),
    DropDownValueModel(name: "Female", value: "Female"),
    DropDownValueModel(name: "Prefer not to say", value: "Prefer not to say"),
  ];

  late SingleValueDropDownController _country;
  late SingleValueDropDownController _curriculum;
  late SingleValueDropDownController _grade;
  late SingleValueDropDownController _gender;
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  @override
  void initState() {
    _country = SingleValueDropDownController();
    _curriculum = SingleValueDropDownController();
    _grade = SingleValueDropDownController();
    _gender = SingleValueDropDownController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(32),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_body.png"),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 80),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 80),
                  child: const Text(
                    'To get customized  courses',
                    style: TextStyle(
                      fontSize: 15,
                      color: grayColor,
                    ),
                  ),
                ),
                Image.asset('assets/images/pencil_boy.png', height: 200),
                TextField(
                  autofocus: false,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    hintText: 'Full name',
                    hintStyle: const TextStyle(color: Color(0xFFbdc6cf)),
                    filled: true,
                    fillColor: softGray,
                    contentPadding: const EdgeInsets.only(left: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryColor, width: 0.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryColor, width: 0.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownTextField(
                  textFieldDecoration: InputDecoration(
                    hintText: 'Choose Country',
                    hintStyle: const TextStyle(color: Color(0xFFbdc6cf)),
                    filled: true,
                    fillColor: softGray,
                    contentPadding: const EdgeInsets.only(left: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryColor, width: 0.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryColor, width: 0.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  singleController: _country,
                  clearOption: false,
                  enableSearch: true,
                  validator: (value) {
                    if (value == null) {
                      return "Required field";
                    } else {
                      return null;
                    }
                  },
                  dropDownItemCount: 4,
                  dropDownList: countries,
                  onChanged: (val) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownTextField(
                  textFieldDecoration: InputDecoration(
                    hintText: 'Choose Curriculum',
                    hintStyle: const TextStyle(color: Color(0xFFbdc6cf)),
                    filled: true,
                    fillColor: softGray,
                    contentPadding: const EdgeInsets.only(left: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryColor, width: 0.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryColor, width: 0.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  singleController: _curriculum,
                  clearOption: false,
                  enableSearch: true,
                  validator: (value) {
                    if (value == null) {
                      return "Required field";
                    } else {
                      return null;
                    }
                  },
                  dropDownItemCount: 4,
                  dropDownList: curriculums,
                  onChanged: (val) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownTextField(
                  textFieldDecoration: InputDecoration(
                    hintText: 'Choose Grade',
                    hintStyle: const TextStyle(color: Color(0xFFbdc6cf)),
                    filled: true,
                    fillColor: softGray,
                    contentPadding: const EdgeInsets.only(left: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryColor, width: 0.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryColor, width: 0.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  singleController: _grade,
                  clearOption: false,
                  enableSearch: true,
                  validator: (value) {
                    if (value == null) {
                      return "Required field";
                    } else {
                      return null;
                    }
                  },
                  dropDownItemCount: 4,
                  dropDownList: grades,
                  onChanged: (val) {},
                ),
                const SizedBox(height: 10),
                TextField(
                  autofocus: false,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    hintText: 'School name',
                    hintStyle: const TextStyle(color: Color(0xFFbdc6cf)),
                    filled: true,
                    fillColor: softGray,
                    contentPadding: const EdgeInsets.only(left: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryColor, width: 0.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryColor, width: 0.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownTextField(
                  textFieldDecoration: InputDecoration(
                    hintText: 'Choose Gender',
                    hintStyle: const TextStyle(color: Color(0xFFbdc6cf)),
                    filled: true,
                    fillColor: softGray,
                    contentPadding: const EdgeInsets.only(left: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryColor, width: 0.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryColor, width: 0.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  singleController: _gender,
                  clearOption: false,
                  enableSearch: true,
                  validator: (value) {
                    if (value == null) {
                      return "Required field";
                    } else {
                      return null;
                    }
                  },
                  dropDownItemCount: 4,
                  dropDownList: genders,
                  onChanged: (val) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  autofocus: false,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    hintText: 'Age',
                    hintStyle: const TextStyle(color: Color(0xFFbdc6cf)),
                    filled: true,
                    fillColor: softGray,
                    contentPadding: const EdgeInsets.only(left: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryColor, width: 0.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryColor, width: 0.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ChooseAvatarScreen())),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: brandYellowColor.withOpacity(0.85),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(color: grayColor200),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: grayColor200, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
