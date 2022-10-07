import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController? emailAddressController;
  TextEditingController? passwordController;

  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailAddressController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF4B39EF),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: Image.asset(
              'assets/images/createAccount_BG@3x.jpg',
            ).image,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    color: Color(0x4D090F13),
                    offset: Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 56, 0, 0),

                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back,',
                              style: GoogleFonts.urbanist(
                                color: Color(0xFF14181B),
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                  controller: emailAddressController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Email Address',
                                    labelStyle: GoogleFonts.urbanist(
                                      color: Color(0xFF95A1AC),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                    hintText: 'Enter your email here...',
                                    hintStyle: GoogleFonts.urbanist(
                                      color: Color(0xFF95A1AC),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFE1EDF9),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFE1EDF9),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 24, 0, 24),
                                  ),
                                  style: GoogleFonts.urbanist(
                                    color: Color(0xFF14181B),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: !passwordVisibility,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: GoogleFonts.urbanist(
                                    color: Color(0xFF95A1AC),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                  hintText: 'Enter your password here...',
                                  hintStyle: GoogleFonts.urbanist(
                                    color: Color(0xFF95A1AC),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE1EDF9),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE1EDF9),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFFFFFFF),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16, 24, 24, 24),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => passwordVisibility =
                                          !passwordVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      passwordVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Color(0xFF95A1AC),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: GoogleFonts.urbanist(
                                  color: Color(0xFF14181B),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () async {
                                // await Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         ForgotPasswordWidget(),
                                //   ),
                                // );
                              },
                              child: Text(
                                'Forgot Password?',
                              ),
                              style: TextButton.styleFrom(
                                fixedSize: Size(170, 30),
                                textStyle: GoogleFonts.lexend(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF14181B),
                                ),
                                elevation: 0,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                              // child: FFButtonWidget(
                              //   onPressed: () async {
                              //     final user = await signInWithEmail(
                              //       context,
                              //       emailAddressController!.text,
                              //       passwordController!.text,
                              //     );
                              //     if (user == null) {
                              //       return;
                              //     }
                              //
                              //     await Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => NavBarPage(
                              //             initialPage: 'homePage_MAIN'),
                              //       ),
                              //     );
                              //   },
                              //   text: 'Login',
                              //   options: FFButtonOptions(
                              //     width: 130,
                              //     height: 50,
                              //     color:
                              //         FlutterFlowTheme.of(context).primaryColor,
                              //     textStyle: FlutterFlowTheme.of(context)
                              //         .subtitle1
                              //         .override(
                              //           fontFamily: 'Lexend Deca',
                              //           color: Colors.white,
                              //           fontSize: 18,
                              //           fontWeight: FontWeight.bold,
                              //         ),
                              //     elevation: 3,
                              //     borderSide: BorderSide(
                              //       color: Colors.transparent,
                              //       width: 1,
                              //     ),
                              //     borderRadius: BorderRadius.circular(40),
                              //   ),
                              // ),
                              child: ElevatedButton(
                                onPressed: () async {
                                  // final user = await signInWithEmail(
                                  //   context,
                                  //   emailAddressLoginController!.text,
                                  //   passwordLoginController!.text,
                                  // );
                                  // if (user == null) {
                                  //   return;
                                  // }
                                  //
                                  // await Navigator.pushAndRemoveUntil(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => NavBarPage(
                                  //         initialPage: 'MY_Card'),
                                  //   ),
                                  //       (r) => false,
                                  // );
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    primary: Color(0xFF4B39EF)),
                                child: const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25, 12, 25, 12),
                                  child: FittedBox(
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
