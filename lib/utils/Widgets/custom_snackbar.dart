import 'package:flutter/cupertino.dart';

import '../../res/import/import.dart';

showAlertDialog(
    {String? title, required String message, Function()? onpressed}) {
  if (Platform.isAndroid) {
    showDialog(
      barrierDismissible: false,
      // barrierColor: SwirgeColors.text.withOpacity(0.48),
      context: navigatorKey.currentContext!,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Dialog(
            insetPadding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title ?? 'Message',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: lectureAlertTextColor,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset('close'.mobilepng)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: lectureAlertTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                    enabled: true,
                    title: 'OK',
                    textColor: lectureAlertWhite,
                    onPressed: onpressed ??
                        () {
                          Navigator.pop(context);
                        },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  if (Platform.isIOS) {
    showCupertinoDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: CupertinoAlertDialog(
            actions: [
              CupertinoDialogAction(
                onPressed: onpressed ??
                    () {
                      Navigator.pop(context);
                    },
                child: const Text(
                  'Okay',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: lectureAlertWhite),
                ),
              ),
            ],
            content: Text(message),
            title: Text(title ?? 'Message'),
          ),
        );
      },
    );
  }
}

deleteDialog(
    {String? groupValue,
    Function()? onDeletepressed,
    required TextEditingController controller,
    Function()? onDeactivatepressed}) {
  return showDialog(
    barrierDismissible: false,
    // barrierColor: SwirgeColors.text.withOpacity(0.48),
    context: navigatorKey.currentContext!,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          backgroundColor: lectureAlertWhite,
          child: StatefulBuilder(builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Delete My Account',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: lectureAlertTextColor,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset('close'.mobilepng)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Why do you want to delete your account??',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: lectureAlertTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomRadio(
                    value: 'Not interested in providing services anymore',
                    onChanged: (value) {
                      setState(() {
                        groupValue = value;
                      });
                    },
                    groupValue: groupValue,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomRadio(
                    value: 'Work terms and conditions are no longer favourable',
                    onChanged: (value) {
                      setState(() {
                        groupValue = value;
                      });
                    },
                    groupValue: groupValue,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomRadio(
                    value: 'Bad work experience',
                    onChanged: (value) {
                      setState(() {
                        groupValue = value;
                      });
                    },
                    groupValue: groupValue,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomTextFormField(
                    // controller: controller,
                    label: 'Other',
                    maxLines: 3,
                    hintText: 'Enter text',
                    controller: controller,
                    onTap: () {
                      if (groupValue != null || groupValue != '') {
                        setState(() {
                          groupValue = '';
                        });
                      }
                    },
                    obscureText: false,
                    readonly: false,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                    title: 'Delete account',
                    textColor: lectureAlertWhite,
                    onPressed: onDeletepressed,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 64,
                    child: CustomButton(
                      title: 'Deactivate instead',
                      textColor: lectureAlertWhite,
                      onPressed: onDeactivatepressed,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      );
    },
  );
}

confirmDelete(
    {String? reason,
    bool? loading,
    required TextEditingController controller,
    Function()? onpressed}) {
  return showDialog(
    barrierDismissible: false,
    // barrierColor: SwirgeColors.text.withOpacity(0.48),
    context: navigatorKey.currentContext!,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          backgroundColor: lectureAlertWhite,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      '${reason != null ? 'Delete' : 'Deactivate'} My Account',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: lectureAlertTextColor,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset('close'.mobilepng)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomTextFormField(
                  label: 'Enter password',
                  hintText: 'Password',
                  obscureText: false,
                  readonly: false,
                  controller: controller,
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomButton(
                  loadingState: loading ?? false,
                  title:
                      '${reason != null ? 'Delete' : 'Deactivate'} My Account',
                  textColor: lectureAlertWhite,
                  onPressed: onpressed,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 64,
                  child: CustomButton(
                    loadingState: loading ?? false,
                    title: 'Dismiss',
                    textColor: lectureAlertWhite,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
