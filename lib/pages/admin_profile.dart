import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_management/models/user_model.dart';
import 'package:employee_management/pages/user_profile.dart';
import 'package:employee_management/services/auth_services.dart';
import 'package:employee_management/services/database_services.dart';
import 'package:employee_management/widgets/add_task_widget.dart';
import 'package:employee_management/widgets/user_dash_graph_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreenWidget extends StatefulWidget {
  const ProfileScreenWidget({Key? key}) : super(key: key);

  @override
  _ProfileScreenWidgetState createState() => _ProfileScreenWidgetState();
}

class _ProfileScreenWidgetState extends State<ProfileScreenWidget> {
  UserModel? user;
  UserModel? email;
  bool _isLoading = true;
  final _db = DatabaseServices();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() {
    _db.getUserData().then((value) {
      setState(() {
        user = value;
        email = value;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final authServices = AuthServices();
    return _isLoading
    ? const Scaffold(
      body:Center(
        child: CircularProgressIndicator(),
      )
    )
    :Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF1F4F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [

            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(
                    user!.name,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(
                    user!.email,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF3D4CF9),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(

              ),
            ),

            Material(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () async {
                  // await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const sample_size(),
                  //   ),
                  // );
                  print('Edit Profile Pressed');
                },
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,

                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Edit Profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Outfit',
                        fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                ),
              ),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Material(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              ),
              child: InkWell(splashColor: Colors.blue.withAlpha(30),
                borderRadius: BorderRadius.circular(12),
                onTap: () async {
                  authServices.signOutUser(context);
                  print('Log Out Pressed');
                },
                child: Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,

                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Log Out",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Lexend Deca',
                        fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
