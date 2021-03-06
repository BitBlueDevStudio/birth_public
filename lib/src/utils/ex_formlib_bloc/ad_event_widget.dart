import 'package:birth_days_app/src/presentation/dto/add_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/src/utils/utils.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'ad_event_widget_base.dart';

export 'package:intl/intl.dart' show DateFormat;


//TODO убрать onRemoveMember и создать отдельный класс для списковых событий

class AdEventFieldBlocBuilder extends StatelessWidget {
  const AdEventFieldBlocBuilder({
    Key key,
    @required this.dateTimeFieldBloc,
    @required this.format,
    this.canSelectTime = false,
    this.enableOnlyWhenFormBlocCanSubmit = false,
    this.isEnabled = true,
    this.errorBuilder,
    this.padding,
    this.decoration = const InputDecoration(),
    @required this.initialDate,
    @required this.firstDate,
    @required this.lastDate,
    @required this.onRemoveMember,
    this.initialTime,
    this.selectableDayPredicate,
    this.locale,
    this.killoncross,
    this.textDirection,
    this.pickerBuilder,
    this.useRootNavigator = false,
    this.routeSettings,
    this.animateWhenCanShow = true,
    this.showClearIcon = true,
    this.clearIcon,
    this.onRefreshBloc,
    this.nextFocusNode,
    this.focusNode,
  })  : assert(enableOnlyWhenFormBlocCanSubmit != null),
        assert(isEnabled != null),
        assert(decoration != null),
        assert(firstDate != null),
        assert(lastDate != null),
        super(key: key);

  /// {@macro flutter_form_bloc.FieldBlocBuilder.fieldBloc}
  final InputFieldBloc<FormAdEvent, Object> dateTimeFieldBloc;

  /// For representing the date as a string e.g.
  /// `DateFormat("EEEE, MMMM d, yyyy 'at' h:mma")`
  /// (Sunday, June 3, 2018 at 9:24pm)
  final DateFormat format;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.errorBuilder}
  final FieldBlocErrorBuilder errorBuilder;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.enableOnlyWhenFormBlocCanSubmit}
  final bool enableOnlyWhenFormBlocCanSubmit;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.isEnabled}
  final bool isEnabled;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.padding}
  final EdgeInsetsGeometry padding;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.decoration}
  final InputDecoration decoration;

  final bool canSelectTime;

  /// {@macro  flutter_form_bloc.FieldBlocBuilder.animateWhenCanShow}
  final bool animateWhenCanShow;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.nextFocusNode}
  final FocusNode nextFocusNode;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.focusNode}
  final FocusNode focusNode;

  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final SelectableDayPredicate selectableDayPredicate;
  final DatePickerMode initialDatePickerMode = DatePickerMode.day;
  final Locale locale;
  final TextDirection textDirection;
  final TransitionBuilder pickerBuilder;
  final bool useRootNavigator;
  final RouteSettings routeSettings;
  final TimeOfDay initialTime;
  final VoidCallback onRefreshBloc;
  final bool showClearIcon;

  final Icon clearIcon;
  final bool killoncross;
  final VoidCallback onRemoveMember;

  @override
  Widget build(BuildContext context) {
    return AdEventFieldBlocBuilderBase<DateTime>(
      dateTimeFieldBloc: dateTimeFieldBloc,
      format: format,
      decoration: decoration,
      enableOnlyWhenFormBlocCanSubmit: enableOnlyWhenFormBlocCanSubmit,
      errorBuilder: errorBuilder,
      isEnabled: isEnabled,
      padding: padding,
      onRemoveMember: onRemoveMember,
      onRefreshBloc: onRefreshBloc,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      initialTime: initialTime ?? TimeOfDay.now(),
      builder: pickerBuilder,
      locale: locale,
      killoncross:killoncross,
      routeSettings: routeSettings,
      selectableDayPredicate: selectableDayPredicate,
      useRootNavigator: useRootNavigator,
      textDirection: textDirection,
      animateWhenCanShow: animateWhenCanShow,
      clearIcon: clearIcon,
      showClearIcon: showClearIcon,
      nextFocusNode: nextFocusNode,
      focusNode: focusNode,
    );
  }
}
