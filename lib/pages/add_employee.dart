// import '../flutter_flow/flutter_flow_drop_down.dart';
// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class add_employee_page extends StatefulWidget {
  const add_employee_page({Key? key}) : super(key: key);

  @override
  _add_employee_pageState createState() => _add_employee_pageState();
}

class _add_employee_pageState extends State<add_employee_page> {
  String? dropDownValue;
  TextEditingController? _empolyeename;
  TextEditingController? _empolyeeemail;
  TextEditingController? _empolyeenumber;
  TextEditingController? _empolyeepassword;
  final _startDate = TextEditingController();
  bool _isLoading = false;
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  String? selectedItem = 'Item 1';


  late bool passwordVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _empolyeename = TextEditingController();
    _empolyeeemail = TextEditingController();
    _empolyeenumber = TextEditingController();
    _empolyeepassword = TextEditingController();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    _empolyeepassword?.dispose();
    _empolyeenumber?.dispose();
    _empolyeeemail?.dispose();
    _empolyeename?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        title: const Text(
          'Add New Employee',
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(25, 25, 25, 25),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.name,

                              controller: _empolyeename,
                              validator: (value) {
                                return value != null
                                    ? RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$").hasMatch(value)
                                    ? null
                                    : "Enter valid name"
                                    : "Name required";
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                labelStyle: GoogleFonts.urbanist(
                                  color: const Color(0xFF95A1AC),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                hintText: 'Enter employee name here...',
                                hintStyle: GoogleFonts.urbanist(
                                  color: const Color(0xFF95A1AC),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFE1EDF9),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFE1EDF9),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFFFFFFF),
                                contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    16, 24, 0, 24),
                                prefixIcon: const Icon(Icons.people),
                              ),
                              style: GoogleFonts.urbanist(
                                color: const Color(0xFF14181B),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _empolyeeemail,
                              keyboardType: TextInputType.emailAddress,

                              validator: (value) {
                                return value != null
                                    ? RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)
                                    ? null
                                    : "Enter valid email"
                                    : "Email required";
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                labelStyle: GoogleFonts.urbanist(
                                  color: const Color(0xFF95A1AC),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                hintText: 'Enter your email here...',
                                hintStyle: GoogleFonts.urbanist(
                                  color: const Color(0xFF95A1AC),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFE1EDF9),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFE1EDF9),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFFFFFFF),
                                contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    16, 24, 0, 24),
                                prefixIcon: const Icon(Icons.email),
                              ),
                              style: GoogleFonts.urbanist(
                                color: const Color(0xFF14181B),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              controller: _empolyeenumber,
                              validator: (value) {
                                return value != null
                                    ? RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                                    .hasMatch(value)
                                    ? null
                                    : "Enter valid Contact-Number"
                                    : "Contact-number required";
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Contact-Number',
                                labelStyle: GoogleFonts.urbanist(
                                  color: const Color(0xFF95A1AC),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                hintText: 'Enter employee number...',
                                hintStyle: GoogleFonts.urbanist(
                                  color: const Color(0xFF95A1AC),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFE1EDF9),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFE1EDF9),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFFFFFFF),
                                contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    16, 24, 0, 24),
                                prefixIcon: const Icon(Icons.phone),
                              ),
                              style: GoogleFonts.urbanist(
                                color: const Color(0xFF14181B),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField<String>(

                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),

                            borderSide: const BorderSide(
                                width: 3, color: Color(0xFFF1F4F8)),
                          ),
                          prefixIcon: const Icon(Icons.business),
                        ),
                        value: selectedItem,
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item,
                              style: const TextStyle(fontSize: 14)),
                        ))
                            .toList(),
                        onChanged: (item) =>
                            setState(() => selectedItem = item),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          final dt = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000, 1, 1),
                              lastDate: DateTime.now());
                          if (dt == null) {
                            return;
                          }
                          String datetime = "${dt.year}-${dt.month}-${dt.day}";

                          final now = DateTime.now();
                          String dtNow =
                              "${now.year}-${now.month}-${now.day}";
                          if (dtNow.compareTo(datetime) < 0) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Select Valid Date"),
                                content: Text(
                                    "Please select time less than current time $dtNow."),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("OK")),
                                ],
                              ),
                            );
                            return;
                          }
                          _startDate.text = datetime;
                        },
                        child: TextFormField(
                            controller: _startDate,
                            obscureText: false,
                            enabled: false,
                            decoration: InputDecoration(
                                labelText: 'Joining Date',
                                labelStyle: GoogleFonts.urbanist(
                                  color: const Color(0xFF95A1AC),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                hintText: 'Enter Start Time here...',
                                hintStyle: GoogleFonts.urbanist(
                                  color: const Color(0xFF95A1AC),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFE1EDF9),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFE1EDF9),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFE1EDF9),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFFFFFFF),
                                contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                                prefixIcon: const Icon(Icons.date_range)
                            ),
                            style: GoogleFonts.urbanist(
                              color: const Color(0xFF14181B),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            )),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,

                              controller: _empolyeepassword,
                              validator: (value) {
                                return value != null
                                    ? value.length >= 6
                                    ? null
                                    : value.isEmpty
                                    ? "Enter Password"
                                    : "Minimum password length is 6"
                                    : "Enter Password";
                              },
                              obscureText: !passwordVisibility,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: GoogleFonts.urbanist(
                                  color: const Color(0xFF95A1AC),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                hintText: 'Enter your password here...',
                                hintStyle: GoogleFonts.urbanist(
                                  color: const Color(0xFF95A1AC),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFE1EDF9),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFE1EDF9),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFFFFFFF),
                                contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
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
                                    color: const Color(0xFF95A1AC),
                                    size: 22,
                                  ),
                                ),
                                prefixIcon: const Icon(Icons.password),
                              ),
                              style: GoogleFonts.urbanist(
                                color: const Color(0xFF14181B),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 4, 0),
                          child: _isLoading
                              ? const Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(25, 12, 25, 12),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                              : ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: const Color(0xFF4B39EF)),
                            child: const Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(25, 12, 25, 12),
                              child: FittedBox(
                                child: Text(
                                  'Add Employee',
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
