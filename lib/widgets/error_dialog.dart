import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorDialouge {
  static Future<void> showErrorDialogue(
      BuildContext context, String mesasge) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          //key: key,
          //backgroundColor: Colors.white,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                    child: Text(
                      mesasge,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Get.theme.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Ok'),
                      ))
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
