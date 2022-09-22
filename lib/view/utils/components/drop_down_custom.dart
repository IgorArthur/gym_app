import 'package:gym_app/export.dart';

class DropDownCustom extends StatefulWidget {
  const DropDownCustom({
    Key? key,
    required this.height,
    required this.width,
    required this.valueSelect,
    required this.label,
    required this.values,
    this.contentPadding,
    this.onChanged,
  }) : super(key: key);

  final double height;
  final double width;
  final ValueNotifier valueSelect;
  final String label;
  final List<String> values;
  final EdgeInsets? contentPadding;
  final Function(String)? onChanged;

  @override
  State<DropDownCustom> createState() => _DropDownCustomState();
}

class _DropDownCustomState extends State<DropDownCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 1.h,
      ),
      height: widget.height,
      child: DropdownButtonFormField<String>(
        value: widget.valueSelect.value,
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
          labelText: widget.label,
          errorStyle: const TextStyle(
            height: 0,
            fontSize: 0,
          ),
          isDense: true,
          contentPadding: widget.contentPadding,
        ),
        icon: Padding(
          padding: EdgeInsets.only(left: 35.w),
          child: Icon(
            Icons.keyboard_arrow_down,
            size: 2.h,
            color: AppColors.neutral200,
          ),
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            widget.valueSelect.value = value!;
          });
        },
        items: widget.values.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
