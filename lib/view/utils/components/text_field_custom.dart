import 'package:gym_app/exports.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    Key? key,
    required this.height,
    required this.width,
    required this.controller,
    required this.label,
    this.keyboardType,
    this.contentPadding,
    this.masks,
    this.onChanged,
  }) : super(key: key);

  final double height;
  final double width;
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final EdgeInsets? contentPadding;
  final List<TextInputFormatter>? masks;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 1.h,
      ),
      width: width,
      height: height,
      child: TextFormField(
        onChanged: onChanged,
        inputFormatters: masks,
        cursorHeight: height / 2,
        cursorColor: AppColors.neutral200,
        controller: controller,
        style: const TextStyle(
          fontFamily: 'OpenSans',
          color: AppColors.neutral200,
        ),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: AppColors.neutral200),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.neutral200),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.neutral200),
              borderRadius: BorderRadius.circular(15)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.neutral200),
              borderRadius: BorderRadius.circular(15)),
          labelText: label,
          errorStyle: const TextStyle(
            height: 0,
            fontSize: 0,
          ),
          isDense: true,
          contentPadding: contentPadding,
        ),
      ),
    );
  }
}
