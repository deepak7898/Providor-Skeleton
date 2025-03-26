
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../custom_widgets/custome_dropdown.dart';

class CommonController extends ChangeNotifier {
  Future customDialog({
    required BuildContext context,
    String? studentPen,
    String? date,
    String? attendanceStatus,
    void Function()? onPressed,
  }) async {

    String other ='';

    return showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Leave'),
            content:  Padding(
              padding:  const EdgeInsets.only(left: 16,right: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomDropdown(
                    hintText: 'Select Type',
                    list: const ['MEDICAL','PERSONAL','FAMILY','VACATION','OTHER'],
                    onChanged: (v) {
                      other=v;
                      notifyListeners();
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: onPressed,
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          );
        });
  }
}
