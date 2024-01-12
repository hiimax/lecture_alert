import '../../res/import/import.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
              color: lectureAlertPrimaryColor,
              border: Border.all(color: lectureAlertPrimaryColor),
              shape: BoxShape.circle),
          child: Padding(
            padding: REdgeInsets.all(10),
            child: Icon(
              icon,
              color: lectureAlertWhite,
            ),
          )),
    );
  }
}

class CustomButtonWithIconRight extends StatelessWidget {
  const CustomButtonWithIconRight({
    Key? key,
    this.title,
    this.buttonColor,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.loadingStateColor,
    this.textSize,
    this.showIcon = false,
    this.icon,
    this.loadingState = false,
    this.radius,
  }) : super(key: key);
  final bool loadingState;
  final String? title;
  final Color? buttonColor;
  final Color? textColor;
  final bool? showIcon;
  final double? textSize;
  final BorderRadius? radius;
  final Color? borderColor;
  final Color? loadingStateColor;
  final Widget? icon;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: (56.h),
        decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(color: borderColor ?? lectureAlertPrimaryColor),
            borderRadius: radius ?? BorderRadius.circular(31)),
        child: loadingState
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      loadingStateColor ?? lectureAlertPrimaryColor),
                ),
              )
            : Center(
                child: Stack(
                  children: [
                    Align(
                      alignment: FractionalOffset.center,
                      child: Text(
                        title ?? '',
                        style: LectureAlertTextStyle.normal.copyWith(
                            fontSize: textSize ?? 18,
                            fontWeight: FontWeight.bold,
                            color: textColor),
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.only(right: 20),
                      child: Align(
                        alignment: FractionalOffset.centerRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            icon ?? const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    Key? key,
    this.title,
    this.buttonColor,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.textSize,
  }) : super(key: key);

  final String? title;
  final Color? buttonColor;
  final Color? textColor;
  final double? textSize;
  final Color? borderColor;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: (56.h),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: buttonColor ?? lectureAlertPrimaryColor,
            border: Border.all(color: borderColor ?? lectureAlertPrimaryColor),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title ?? '',
                  style: LectureAlertTextStyle.normal.copyWith(
                      fontSize: textSize ?? 16,
                      fontWeight: FontWeight.w700,
                      color: textColor ?? lectureAlertWhite),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.onPressed,
      this.title,
      this.loadingState = false,
      this.buttonColor,
      this.textColor,
      this.buttonTextSize,
      this.buttonRadius,
      this.textSize,
      this.enabled = true})
      : super(key: key);

  final VoidCallback? onPressed;
  final double? textSize;
  final String? title;
  final bool enabled;
  final bool loadingState;
  final Color? buttonColor;
  final Color? textColor;
  final double? buttonTextSize;
  final BorderRadius? buttonRadius;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      "$title",
      textAlign: TextAlign.center,
      maxLines: 1,
      // overflow: TextOverflow.ellipsis,
      style: LectureAlertTextStyle.normal.copyWith(
          fontSize: textSize ?? 16,
          fontWeight: FontWeight.w700,
          color: textColor ?? lectureAlertWhite),
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: (56.h),
      child: loadingState
          ? const Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(lectureAlertPrimaryColor),
              ),
            )
          : TextButton(
              onPressed: enabled ? onPressed : null,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(enabled
                      ? buttonColor ?? lectureAlertPrimaryColor
                      : lectureAlertGrey),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius:
                          buttonRadius ?? BorderRadius.circular(31)))),
              child: textWidget,
            ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    Key? key,
    this.title,
    this.borderradius,
    this.buttonColor,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.textSize,
    this.showIcon = false,
    this.icon,
  }) : super(key: key);

  final String? title;
  final Color? buttonColor;
  final Color? textColor;
  final bool? showIcon;
  final double? textSize;
  final Color? borderColor;
  final Widget? icon;
  final double? borderradius;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: (56.h),
        decoration: BoxDecoration(
            color: buttonColor ?? lectureAlertPrimaryColor,
            border: Border.all(color: borderColor ?? lectureAlertPrimaryColor),
            borderRadius: borderradius == null
                ? BorderRadius.circular(31)
                : BorderRadius.circular(borderradius!)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon ?? const SizedBox.shrink(),
              if (icon != null) const XMargin(5),
              Text(
                title ?? '',
                style: LectureAlertTextStyle.normal.copyWith(
                  fontSize: textSize ?? 16,
                  fontWeight: FontWeight.w700,
                  color: textColor ?? lectureAlertWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
