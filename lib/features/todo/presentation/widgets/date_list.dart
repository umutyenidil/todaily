import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todaily/core/extensions/build_context_ext.dart';
import 'package:todaily/core/extensions/widget_ext.dart';
import 'package:todaily/core/resources/color_res.dart';
import 'package:todaily/core/resources/edge_insets_res.dart';
import 'package:todaily/core/resources/vector_res.dart';

class DateList extends StatefulWidget {
  DateList({super.key});

  @override
  State<DateList> createState() => _DateListState();
}

class _DateListState extends State<DateList> {
  late DateTime _selected;
  late List<DateTime> _dates;

  @override
  void initState() {
    super.initState();

    _dates = List.generate(14, (index) => DateTime.now().add(Duration(days: index)));
    _selected = _dates[0];
  }

  final Map<String, String> vectors = {
    "Monday": VectorRes.MONDAY,
    "Tuesday": VectorRes.TUESDAY,
    "Wednesday": VectorRes.WEDNESDAY,
    "Thursday": VectorRes.THURSDAY,
    "Friday": VectorRes.FRIDAY,
    "Saturday": VectorRes.SATURDAY,
    "Sunday": VectorRes.SUNDAY,
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: context.screenHeight * 0.13,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsetsRes.H16,
        itemBuilder: (_, index) {
          final date = _dates[index];
          final isSelected = date == _selected;
          return SizedBox(
            width: context.screenWidth * 0.22,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        _selected = date;
                      });
                    },
                    child: DecoratedBox(
                      decoration: ShapeDecoration(
                        color: ColorRes.WHITE,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            Text(
                              DateFormat('dd E').format(date),
                              style: context.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Expanded(
                              child: SvgPicture.asset(
                                vectors[DateFormat.EEEE().format(date)]!,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: isSelected ? 1 : 0,
                  duration: Durations.short3,
                  child: const FractionallySizedBox(
                    widthFactor: 0.5,
                    child: SizedBox(
                      height: 3,
                      child: DecoratedBox(
                        decoration: ShapeDecoration(
                          color: ColorRes.GREEN500,
                          shape: StadiumBorder(),
                        ),
                      ),
                    ),
                  ).padding(top: 4),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(width: 12);
        },
        itemCount: _dates.length,
      ),
    );
  }
}
