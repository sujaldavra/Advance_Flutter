import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle titleStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  int initialStepperIndex = 0;
  dynamic information = " ";
  final ImagePicker Picker = ImagePicker();
  File? Image;
  final GlobalKey<FormState> Formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.lightBlueAccent,
                Colors.lightBlueAccent,
                Colors.greenAccent,
                Colors.greenAccent,
              ],
            ),
          ),
        ),
        leading: const Icon(Icons.arrow_back),
        title: const Text("Edit Your Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: Formkey,
              child: Stepper(
                onStepCancel: () {
                  setState(() {
                    if (initialStepperIndex > 0) {
                      initialStepperIndex--;
                    }
                  });
                },
                onStepContinue: () {
                  setState(() {
                    if (initialStepperIndex < 10) {
                      initialStepperIndex++;
                    }
                  });
                },
                currentStep: initialStepperIndex,
                steps: <Step>[
                  Step(
                    isActive: initialStepperIndex >= 0,
                    state: initialStepperIndex >= 1
                        ? StepState.complete
                        : StepState.disabled,
                    title: Text(
                      "Profile Picture",
                      style: titleStyle,
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Add profile photo",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.grey.shade400,
                                  backgroundImage: (Image != null)
                                      ? FileImage(Image!)
                                      : null,
                                  child: (Image != null)
                                      ? const Text("")
                                      : Text(
                                          "ADD",
                                          style: titleStyle,
                                        ),
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) => AlertDialog(
                                        title: const Text("Add Photo"),
                                        actions: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 50,
                                                child: ListTile(
                                                  onTap: () async {
                                                    XFile? pickedFile =
                                                        await Picker.pickImage(
                                                            source: ImageSource
                                                                .camera);
                                                    setState(() {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Image = File(
                                                          pickedFile!.path);
                                                    });
                                                  },
                                                  title: const Text(
                                                      "Take Your Photo"),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50,
                                                child: ListTile(
                                                  onTap: () async {
                                                    XFile? pickedFile =
                                                        await Picker.pickImage(
                                                      source:
                                                          ImageSource.gallery,
                                                    );
                                                    setState(() {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Image = File(
                                                          pickedFile!.path);
                                                    });
                                                  },
                                                  title: const Text(
                                                      "Chose From Gallary"),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50,
                                                child: TextButton(
                                                  onPressed: () async {
                                                    setState(() {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Image = null;
                                                    });
                                                  },
                                                  child: Row(
                                                    children: const [
                                                      Icon(Icons.delete),
                                                      Text(
                                                        "Delete Your Photo",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  mini: true,
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 1,
                    state: initialStepperIndex >= 2
                        ? StepState.complete
                        : StepState.disabled,
                    title: Text(
                      "NAME",
                      style: titleStyle,
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter name",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.person),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "Enter Your Name",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 2,
                    state: initialStepperIndex >= 3
                        ? StepState.complete
                        : StepState.disabled,
                    title: Text(
                      "Phone",
                      style: titleStyle,
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter phone number",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.call),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "Enter Your Phone Number",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 3,
                    state: initialStepperIndex >= 4
                        ? StepState.complete
                        : StepState.disabled,
                    title: Text(
                      "Email",
                      style: titleStyle,
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter Email",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.email),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "Enter Your Email",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 4,
                    state: initialStepperIndex >= 5
                        ? StepState.complete
                        : StepState.disabled,
                    title: Text(
                      "DOB",
                      style: titleStyle,
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter your date of birth",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.date_range),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "DD/MM/YYYY",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 5,
                    state: initialStepperIndex >= 6
                        ? StepState.complete
                        : StepState.disabled,
                    title: Text(
                      "Gender",
                      style: titleStyle,
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: "Male",
                              groupValue: information,
                              onChanged: (val) {
                                setState(() {
                                  information = val;
                                });
                              },
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 17,
                                color: (information == "Male")
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: "Female",
                              groupValue: information,
                              onChanged: (val) {
                                setState(() {
                                  information = val;
                                });
                              },
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 17,
                                color: (information == "Female")
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 6,
                    state: initialStepperIndex >= 7
                        ? StepState.complete
                        : StepState.disabled,
                    title: Text(
                      "Current location",
                      style: titleStyle,
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter current location",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.location_on),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "Enter your current location",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 7,
                    state: initialStepperIndex >= 8
                        ? StepState.complete
                        : StepState.disabled,
                    title: Text(
                      "Nationality",
                      style: titleStyle,
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter Nationality",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.flag),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "Enter Your Nationality",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 8,
                    state: initialStepperIndex >= 9
                        ? StepState.complete
                        : StepState.disabled,
                    title: Text(
                      "Religion",
                      style: titleStyle,
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter religion",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "Enter Your Religion",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 9,
                    state: initialStepperIndex >= 10
                        ? StepState.complete
                        : StepState.disabled,
                    title: Text(
                      "Language(s)",
                      style: titleStyle,
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter language",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.person),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "Enter Your Language",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Step(
                    isActive: initialStepperIndex >= 10,
                    state: initialStepperIndex >= 11
                        ? StepState.complete
                        : StepState.disabled,
                    title: Text(
                      "Biography",
                      style: titleStyle,
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter biography",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.details_outlined),
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintText: "Enter Your Biography",
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
