import 'package:course_view/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageProfilePage extends StatelessWidget {
  const ManageProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: <Widget>[
          MaterialButton(
            onPressed: () {},
            color: Colors.black87,
            visualDensity: const VisualDensity(vertical: -2, horizontal: -2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            minWidth: 0,
            elevation: 0,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.flash_on_rounded,
                  color: Colors.grey.shade100,
                  size: 16,
                ),
                const SizedBox(width: 2.0),
                Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.grey.shade100,
                    fontSize: 13.0,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Manage Profile',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Setup your profile for better experience. '
                  'You can only do this once in a month.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: <Widget>[
                  const CustomTextField(
                    margin: EdgeInsets.only(bottom: 10.0),
                    hintText: 'Firstname',
                  ),
                  const CustomTextField(
                    margin: EdgeInsets.only(bottom: 15.0),
                    hintText: 'Lastname',
                  ),
                  const CustomTextField(
                    margin: EdgeInsets.only(bottom: 15.0),
                    hintText: 'Username',
                  ),
                  const CustomTextField(
                    margin: EdgeInsets.only(bottom: 15.0),
                    hintText: 'Email',
                  ),
                  CustomTextField(
                    margin: const EdgeInsets.only(bottom: 15.0),
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.eye,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  CustomTextField(
                    margin: const EdgeInsets.only(bottom: 15.0),
                    hintText: 'Confirm Password',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.eye,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  const CustomTextField(
                    margin: EdgeInsets.only(bottom: 15.0),
                    hintText: 'Phone number',
                  ),
                  SizedBox(height: 50.0),
                  Divider(),
                  Text(
                      'Email and username can only be changed twice in a month. While Gender & DOB are optional.')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
