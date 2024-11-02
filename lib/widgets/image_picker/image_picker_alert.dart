// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tots_test/ui/ui.dart';

import 'widgets/item_button.dart';

class ImagePick {
  factory ImagePick() {
    return _instance;
  }

  ImagePick._internal();
  static final _instance = ImagePick._internal();

  showBottomSheet({
    required BuildContext context,
    required void Function() fromPhoto,
    required void Function() fromGallery,
    void Function()? fromAdditionalItem,
    IconData? additionalItemIcon,
    String? additionalItemLabel,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () async {
              Get.back();
              const permission = Permission.camera;
              if (await permission.isDenied) {
                fromPhoto();
              } else {
                final result = await permission.request();
                if (result.isRestricted || result.isPermanentlyDenied) {
                  CustomSnackBars.showErrorSnackBar(
                    message:
                        'Revisa los permisos desde la configuración del dispositivo',
                  );
                } else {
                  fromPhoto();
                }
              }
              FocusScope.of(context).unfocus();
            },
            child: const Itembutton(
              icon: Icons.camera_alt,
              label: 'Take picture',
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              Get.back();
              const permission = Permission.photos;
              if (await permission.isDenied) {
                fromGallery();
              } else {
                final result = await permission.request();
                if (result.isRestricted || result.isPermanentlyDenied) {
                  CustomSnackBars.showErrorSnackBar(
                    message:
                        'Revisa los permisos desde la configuración del dispositivo',
                  );
                } else {
                  fromGallery();
                }
              }
              FocusScope.of(context).unfocus();
            },
            child: const Itembutton(
              icon: Icons.photo_album,
              label: 'Take image from gallery',
            ),
          ),
          if (fromAdditionalItem != null)
            CupertinoActionSheetAction(
              onPressed: fromAdditionalItem,
              child: Itembutton(
                icon: additionalItemIcon!,
                label: additionalItemLabel!,
              ),
            ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Get.back();
            FocusScope.of(context).unfocus();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
