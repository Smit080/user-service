import '../utils/all_dependancy.dart';

class CommonTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String prefixIcon;
  final String hintText;
  final String? title;
  final IconData? suffixIcon;
  final Function()? onPressed;
  final Function()? onTap;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isProfileScreen;
  final bool readOnly;
  const CommonTextfield({
    super.key,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
    this.onPressed,
    this.onTap,
    this.obscureText = false,
    this.textInputAction,
    this.keyboardType,
    this.inputFormatters,
    this.isProfileScreen = false,
    this.readOnly = false,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            S16Text(
              title!,
              fontWeight: FontWeight.w700,
              color: AppColor.grey100,
            ),
          if (title != null) 8.vertical(),
          TextFormField(
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            controller: controller,
            cursorColor: AppColor.primaryColor,
            obscureText: obscureText,
            onTap: () {
              if (onTap != null) onTap!();
            },
            style: const TextStyle(color: AppColor.primaryColor),
            textInputAction: textInputAction ?? TextInputAction.next,
            keyboardType: keyboardType ?? TextInputType.text,
            inputFormatters: inputFormatters,
            readOnly: readOnly,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: isProfileScreen ? AppColor.grey60 : AppColor.grey80,
              ),
              border: outlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
              disabledBorder: outlineInputBorder(),
              enabledBorder: outlineInputBorder(),
              errorBorder: outlineInputBorder(),
              focusedBorder: outlineInputBorder(color: AppColor.primaryColor),
              fillColor: isProfileScreen ? Colors.transparent : AppColor.grey20,
              filled: true,
              suffixIcon: (suffixIcon != null)
                  ? IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        suffixIcon,
                        color: AppColor.primaryColor,
                      ),
                    )
                  : null,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  prefixIcon,
                  height: 17,
                  // ignore: deprecated_member_use
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: color ?? (isProfileScreen ? AppColor.grey60 : AppColor.grey20),
        ),
      );
}
