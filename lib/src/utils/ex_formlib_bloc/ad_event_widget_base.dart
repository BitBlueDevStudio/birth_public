import 'package:birth_days_app/src/presentation/bloc/form/form_add_bloc.dart';
import 'package:birth_days_app/src/presentation/dto/add_event.dart';
import 'package:birth_days_app/src/presentation/ui/widget/dialogs_form_widget.dart';
import 'package:birth_days_app/src/utils/locale_helper/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_form_bloc/src/can_show_field_bloc_builder.dart';
import 'package:flutter_form_bloc/src/utils/utils.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'cupertino_datepicker.dart';

/// A material design date picker.
class AdEventFieldBlocBuilderBase<T> extends StatefulWidget {
  const AdEventFieldBlocBuilderBase({
    Key key,
    @required this.dateTimeFieldBloc,
    @required this.format,
    this.enableOnlyWhenFormBlocCanSubmit = false,
    this.isEnabled = true,
    this.errorBuilder,
    this.padding,
    this.decoration = const InputDecoration(),
    @required this.initialDate,
    @required this.firstDate,
    @required this.lastDate,
    this.killoncross,
    this.selectableDayPredicate,
    this.locale,
    this.onRefreshBloc,
    this.textDirection,
    this.builder,
    this.useRootNavigator = false,
    this.routeSettings,
    @required this.initialTime,
    @required this.animateWhenCanShow,
    this.showClearIcon = true,
    this.clearIcon,
    @required this.onRemoveMember,
    this.nextFocusNode,
    this.focusNode,
  })  : assert(enableOnlyWhenFormBlocCanSubmit != null),
        assert(isEnabled != null),
        assert(decoration != null),
        super(key: key);


  /// {@macro flutter_form_bloc.FieldBlocBuilder.fieldBloc}
  final InputFieldBloc<FormAdEvent, Object> dateTimeFieldBloc;

  /// For representing the date as a string e.g.
  /// `DateFormat("EEEE, MMMM d, yyyy 'at' h:mma")`
  /// (Sunday, June 3, 2018 at 9:24pm)
  final DateFormat format;

  final VoidCallback onRemoveMember;

  final VoidCallback onRefreshBloc;

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

  /// {@macro  flutter_form_bloc.FieldBlocBuilder.animateWhenCanShow}
  final bool animateWhenCanShow;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.nextFocusNode}
  final FocusNode nextFocusNode;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.focusNode}
  final FocusNode focusNode;

  final bool showClearIcon;

  final Icon clearIcon;
  final bool killoncross;

  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final SelectableDayPredicate selectableDayPredicate;
  final Locale locale;
  final TextDirection textDirection;
  final TransitionBuilder builder;
  final bool useRootNavigator;
  final RouteSettings routeSettings;
  final TimeOfDay initialTime;

  @override
  _CupertinoDateTimeFieldBlocBuilderBaseState createState() =>
      _CupertinoDateTimeFieldBlocBuilderBaseState();
}

class _CupertinoDateTimeFieldBlocBuilderBaseState<T>
    extends State<AdEventFieldBlocBuilderBase<T>> {
  final DatePickerMode initialDatePickerMode = DatePickerMode.day;

  FocusNode _focusNode = FocusNode();

  FocusNode get _effectiveFocusNode => widget.focusNode ?? _focusNode;

  @override
  void initState() {
    _effectiveFocusNode.addListener(_onFocusRequest);
    super.initState();
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_onFocusRequest);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusRequest() {
    if (_effectiveFocusNode.hasFocus) {
      _showPicker(context);
    }
  }

  void _showPicker(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    FormAdEvent result=FormAdEvent(widget.dateTimeFieldBloc.value.date, widget.dateTimeFieldBloc.value.name);
    AddPersonAddEventFormBloc formBloc;

    onSubmit(dynamic context, dynamic state, DateTime dt, String name) {
      result.name=name;
      result.date=dt;
    }

    await showAddMoreEventDialog(S.of(context).com_Select("").trim(),result, context, formBloc, onSubmit);


    if (result != null) {
      fieldBlocBuilderOnChange<FormAdEvent>(
        isEnabled: widget.isEnabled,
        nextFocusNode: widget.nextFocusNode,
        onChanged: (value) {
          widget.dateTimeFieldBloc.updateValue(value);
          //TODO сделать нормальное обновление названия при редактировании, убрать костыль ниже
          widget.onRefreshBloc();
          // Used for hide keyboard
          // FocusScope.of(context).requestFocus(FocusNode());
        },
      )(result);
    }


  }

  @override
  Widget build(BuildContext context) {
    if (widget.dateTimeFieldBloc == null) {
      return SizedBox();
    }

    return Focus(
      focusNode: _effectiveFocusNode,
      child: CanShowFieldBlocBuilder(
        fieldBloc: widget.dateTimeFieldBloc,
        animate: widget.animateWhenCanShow,
        builder: (_, __) {
          return BlocBuilder<InputFieldBloc<FormAdEvent, Object>,
              InputFieldBlocState<FormAdEvent, Object>>(
            cubit: widget.dateTimeFieldBloc,
            builder: (context, state) {
              final isEnabled = fieldBlocIsEnabled(
                isEnabled: this.widget.isEnabled,
                enableOnlyWhenFormBlocCanSubmit:
                widget.enableOnlyWhenFormBlocCanSubmit,
                fieldBlocState: state,
              );

              Widget child;

              if (state.value.date == null && widget.decoration.hintText != null) {
                child = Text(
                  widget.decoration.hintText,
                  style: widget.decoration.hintStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: widget.decoration.hintMaxLines,
                );
              } else {
                child = Text(
                  state.value.date != null
                      ? _tryFormat(state.value.date, widget.format)
                      : '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: Style.getDefaultTextStyle(
                    context: context,
                    isEnabled: isEnabled,
                  ),
                );
              }

              return DefaultFieldBlocBuilderPadding(
                padding: widget.padding,
                child: GestureDetector(
                  onTap: !isEnabled ? null : () => _showPicker(context),
                  child: InputDecorator(
                    decoration: _buildDecoration(context, state, isEnabled,widget.onRemoveMember),
                    isEmpty: state.value.date == null &&
                        widget.decoration.hintText == null,
                    child: child,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _tryFormat(DateTime value, DateFormat format) {
    DateTime date;
    date = value;

    try {
      return format.format(date);
    } catch (e) {
      return date.millisecondsSinceEpoch.toString();
    }
  }

  InputDecoration _buildDecoration(BuildContext context,
      InputFieldBlocState<FormAdEvent, Object> state, bool isEnabled, VoidCallback onRemoveMember) {
    InputDecoration decoration = this.widget.decoration;

    decoration = decoration.copyWith(
      enabled: isEnabled,
      errorText: Style.getErrorText(
        context: context,
        errorBuilder: widget.errorBuilder,
        fieldBlocState: state,
        fieldBloc: widget.dateTimeFieldBloc,
      ),
      suffixIcon: decoration.suffixIcon ??
          (widget.showClearIcon
              ? AnimatedOpacity(
            duration: Duration(milliseconds: 400),
            opacity:
            widget.dateTimeFieldBloc.state.value.date == null ? 0.0 : 1.0,
            child: InkWell(
                borderRadius: BorderRadius.circular(25),
                child: widget.clearIcon ?? Icon(Icons.clear),
                onTap: () {

                  if (widget.dateTimeFieldBloc.state.value.date == null) {
                    return null;
                  } else {
                    onRemoveMember();
                  }

                  /*widget.dateTimeFieldBloc.state.value == null
                    ? null
                    : widget.dateTimeFieldBloc.clear;*/
                }
            ),
          )
              : null),
    );

    return decoration;
  }
}
