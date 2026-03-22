import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/features/auth/data/models/registermodel.dart';
import 'package:loginapp/features/auth/data/repositories/apiservice.dart';

import '../../shared/utils/Selectfile.dart';
import '../../shared/widgets/custombutton.dart';
import '../../shared/widgets/titletext.dart';
import '../auth/application/buttonfunctoin.dart';
import 'Businesshour.dart';
import 'complete.dart';

class Verification extends StatefulWidget {
  final RegisterModel model;
  const Verification({
    super.key,
    required this.model,
  });
  // final String? registrationproofpath;

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  String? get existingpath => widget.model.registrationProof;
  bool isloading = false;

  void _handleSignup() async {
    setState(() {
      isloading = true;
    });
    try {
      final apiService = ApiService();
      final result = await apiService.registerUser(widget.model);
      if (result['status'] == "true" || result['status'] == true) {
        if (mounted) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Complete()),
              (route) => false);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result['message'] ?? 'Signup Failed')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error:${e.toString()}")));
    } finally {
      if (mounted) {
        setState(() {
          isloading = false;
        });
      }
    }

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text("Processing your Registration")),
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => Complete()));
  }

// void _handleFileSignup() {}
// print()

  PlatformFile? selectFile;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Customtext(
              title: 'Verification',
              uptext: 'Signup 3 of 4',
              subtext: 'Attached proof of Department of Agriculture '
                  'registration i.e. Florida Fresh,USDA Approved,USDA Organic',
            ),
            SizedBox(
              height: 40,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      existingpath != null
                          ? 'File: ${existingpath!.split('/').last}'
                          : 'Attach proof of registration',
                      style: TextStyle(
                          color:
                              existingpath != null ? Colors.black : Colors.grey,
                          fontWeight: existingpath != null
                              ? FontWeight.bold
                              : FontWeight.normal),
                      overflow: TextOverflow.ellipsis,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300)),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      final PlatformFile? file =
                          await FilePickerService().PickSingleFile();
                      if (file != null) {
                        String ext = file.extension?.toLowerCase() ?? '';
                        if (ext == 'jpg' ||
                            ext == 'png' ||
                            ext == 'jpeg' ||
                            ext == 'pdf') if (file != null) {
                          setState(() {
                            widget.model.registrationProof = file.path;
                          });
                        } else {
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Invalid file path! Please an Image or PDF.')));
                          }
                        }
                      }
                    },
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: CircleBorder(),
                      elevation: 2,
                      fixedSize: Size(50, 50),
                      padding: EdgeInsets.zero,
                    )),
              ],
            ),
            // SizedBox(
            //   height: 400,
            // ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.black, size: 28)),
                  SizedBox(
                    width: 220,
                    height:
                        52, // Fixed height for buttons ensures they don't look "fat"
                    child: isloading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Colors.red,
                          ))
                        : Custom_button(
                            btName: widget.model.registrationProof != null
                                ? 'Submit'
                                : 'Continue',
                            onTap: () {
                              if (existingpath == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Please select a file first!")));
                                return;
                              }
                              if (widget.model.businessHourModel != null) {
                                _handleSignup();
                              }
                              // widget.model.registrationProof = selectFile!.path;
                              else {
                                FromHandler.ValidateAndeNext(
                                    context: context,
                                    model: widget.model,
                                    currentPageData: {
                                      "registration_proof":
                                          widget.model.registrationProof
                                    },
                                    NextScreen:
                                        Business_hour(model: widget.model));
                              }
                            }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
