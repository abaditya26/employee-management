import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_employee.dart';
import 'admin_profile.dart';
import 'user_profile.dart';
class admin_dashboard extends StatefulWidget {
  const admin_dashboard({Key? key}) : super(key: key);

  @override
  _admin_dashboardState createState() => _admin_dashboardState();
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const add_employee_page(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class _admin_dashboardState extends State<admin_dashboard> {
  TextEditingController? textController;
  bool _isLoading = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF1F4F8),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         
          Navigator.of(context).push(_createRoute());
        },
        backgroundColor: const Color(0xFF4B39EF),
        elevation: 8,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 225,
              decoration: const BoxDecoration(
                color: Color(0xFF14181B),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x39000000),
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24, 60, 24, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,

                      children: [
                        Text(
                          'Dashboard',
                          style: GoogleFonts.urbanist(
                            color: const Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfileScreenWidget(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.people_alt_outlined),
                        color: Colors.white,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Find your Dream Space To Getaway',
                          style: GoogleFonts.urbanist(
                            color: const Color(0xFF95A1AC),
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F4F8),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4, 0, 4, 0),
                              child: TextFormField(
                                controller: textController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Employee name',
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
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
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
                                  prefixIcon: const Icon(
                                    Icons.search_sharp,
                                    color: Color(0xFF95A1AC),
                                  ),
                                ),
                                style: GoogleFonts.urbanist(
                                  color: const Color(0xFF14181B),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 8, 0),
                            child: _isLoading
                                ? const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25, 12, 25, 12),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : ElevatedButton(
                                    onPressed: () {
                                      print('Search button pressed');
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: const StadiumBorder(),
                                        backgroundColor:
                                            const Color(0xFF4B39EF)),
                                    child: const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 12, 10, 12),
                                      child: FittedBox(
                                        child: Text(
                                          'Search',
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
                  ),
                ],
              ),
            ),
           // TODO add stream view for employee
           // Generated code for this ListView Widget...
           //  Padding(
           //    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
           //    child: StreamBuilder<List<PropertiesRecord>>(
           //      stream: queryPropertiesRecord(
           //        queryBuilder: (propertiesRecord) =>
           //            propertiesRecord.orderBy('lastUpdated', descending: true),
           //      ),
           //      builder: (context, snapshot) {
           //        // Customize what your widget looks like when it's loading.
           //        if (!snapshot.hasData) {
           //          return const Center(
           //            child: SizedBox(
           //              width: 50,
           //              height: 50,
           //              child: CircularProgressIndicator(
           //                color: Color(0xFF4B39EF),
           //              ),
           //            ),
           //          );
           //        }
           //        List<PropertiesRecord> listViewPropertiesRecordList = snapshot.data!;
           //        return ListView.builder(
           //          padding: EdgeInsets.zero,
           //          primary: false,
           //          shrinkWrap: true,
           //          scrollDirection: Axis.vertical,
           //          itemCount: listViewPropertiesRecordList.length,
           //          itemBuilder: (context, listViewIndex) {
           //            final listViewPropertiesRecord =
           //            listViewPropertiesRecordList[listViewIndex];
           //            return Padding(
           //              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
           //              child: Container(
           //                width: double.infinity,
           //                decoration: BoxDecoration(
           //                  color: const Color(0xFFFFFFFF),
           //                  boxShadow: const [
           //                    BoxShadow(
           //                      blurRadius: 4,
           //                      color: Color(0x32000000),
           //                      offset: Offset(0, 2),
           //                    )
           //                  ],
           //                  borderRadius: BorderRadius.circular(8),
           //                ),
           //                child: InkWell(
           //                  onTap: () async {
           //                    await Navigator.push(
           //                      context,
           //                      MaterialPageRoute(
           //                        builder: (context) => PropertyDetailsWidget(
           //                          propertyRef: listViewPropertiesRecord,
           //                        ),
           //                      ),
           //                    );
           //                  },
           //                  child: Column(
           //                    mainAxisSize: MainAxisSize.max,
           //                    children: [
           //                      Padding(
           //                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
           //                        child: Row(
           //                          mainAxisSize: MainAxisSize.max,
           //                          children: [
           //                            Expanded(
           //                              child: Text(
           //                                listViewPropertiesRecord.propertyName!
           //                                    .maybeHandleOverflow(
           //                                  maxChars: 36,
           //                                  replacement: '…',
           //                                ),
           //                                style: GoogleFonts.urbanist(
           //
           //                                  color: const Color(0xFF14181B),
           //                                  fontWeight: FontWeight.bold,
           //                                  fontSize: 20,
           //                                ),
           //                              ),
           //                            ),
           //                            IconButton(
           //
           //                              icon: const Icon(
           //                                Icons.edit,
           //                                color: Colors.black,
           //                                size: 30,
           //                              ),
           //                              onPressed: () {
           //                                Navigator.push(
           //                                    context,
           //                                    MaterialPageRoute(
           //                                        builder: (context) => UserProfile(
           //                                          user: user!,
           //                                        ))).then((value) {
           //                                  getUserData();
           //                                });
           //                              },
           //                            )
           //                          ],
           //                        ),
           //                      ),
           //                      Expanded(
           //                        child: Text(
           //                          listViewPropertiesRecord.propertyNeighborhood!.maybeHandleOverflow(
           //                            maxChars: 90,
           //                            replacement: '…',
           //                          ),
           //                          style: GoogleFonts.urbanist(
           //
           //                            color: const Color(0x9914181B),
           //                            fontWeight: FontWeight.bold,
           //                            fontSize: 15,
           //                          ),
           //                        ),
           //                      ),
           //                    ],
           //                  ),
           //                ),
           //              ),
           //            );
           //          },
           //        );
           //      },
           //    ),
           //  ),
          ],
        ),
      ),
    );
  }
}
