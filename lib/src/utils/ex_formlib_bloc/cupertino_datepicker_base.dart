import 'package:birth_days_app/src/utils/locale_helper/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/src/can_show_field_bloc_builder.dart';
import 'package:flutter_form_bloc/src/utils/utils.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:intl/intl.dart' show DateFormat;

enum CupertinoDateTimeFieldBlocBuilderBaseType {
  date,
  time,
  both,
}

/// A material design date picker.
class CupertinoDateTimeFieldBlocBuilderBase<T> extends StatefulWidget {
  const CupertinoDateTimeFieldBlocBuilderBase({
    Key key,
    @required this.dateTimeFieldBloc,
    @required this.format,
    @required this.type,
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
    this.textDirection,
    this.builder,
    this.useRootNavigator = false,
    this.routeSettings,
    @required this.initialTime,
    @required this.animateWhenCanShow,
    this.showClearIcon = true,
    this.clearIcon,
    this.nextFocusNode,
    this.focusNode,
  })  : assert(enableOnlyWhenFormBlocCanSubmit != null),
        assert(isEnabled != null),
        assert(decoration != null),
        super(key: key);

  final CupertinoDateTimeFieldBlocBuilderBaseType type;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.fieldBloc}
  final InputFieldBloc<T, Object> dateTimeFieldBloc;

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
    extends State<CupertinoDateTimeFieldBlocBuilderBase<T>> {
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
    var result;
    if (widget.type == CupertinoDateTimeFieldBlocBuilderBaseType.date) {
      result = await _showDatePicker(context,CupertinoDatePickerMode.date,widget.initialDate);
    } else if (widget.type == CupertinoDateTimeFieldBlocBuilderBaseType.both) {
      result = await _showDatePicker(context,CupertinoDatePickerMode.dateAndTime,widget.initialDate);
    } else if (widget.type == CupertinoDateTimeFieldBlocBuilderBaseType.time) {
      result = await _showDatePicker(context,CupertinoDatePickerMode.time,DateTime.now());
    }
    if (result != null) {
      fieldBlocBuilderOnChange<T>(
        isEnabled: widget.isEnabled,
        nextFocusNode: widget.nextFocusNode,
        onChanged: (value) {
          widget.dateTimeFieldBloc.updateValue(value);
          //widget.dateTimeFieldBloc.state.formBloc.reload();
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
          return BlocBuilder<InputFieldBloc<T, Object>,
              InputFieldBlocState<T, Object>>(
            cubit: widget.dateTimeFieldBloc,
            builder: (context, state) {
              final isEnabled = fieldBlocIsEnabled(
                isEnabled: this.widget.isEnabled,
                enableOnlyWhenFormBlocCanSubmit:
                widget.enableOnlyWhenFormBlocCanSubmit,
                fieldBlocState: state,
              );

              Widget child;

              if (state.value == null && widget.decoration.hintText != null) {
                child = Text(
                  widget.decoration.hintText,
                  style: widget.decoration.hintStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: widget.decoration.hintMaxLines,
                );
              } else {
                child = Text(
                  state.value != null
                      ? _tryFormat(state.value, widget.format)
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
                    decoration: _buildDecoration(context, state, isEnabled),
                    isEmpty: state.value == null &&
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

  Future<DateTime> _showDatePicker(BuildContext ctx, CupertinoDatePickerMode mod, DateTime initdate) async {
    DateTime _chosen = widget.initialDate;

    /* return await showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          height: 500,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Container(
                height: 400,
                child: CupertinoDatePicker(
                    mode: mod,
                    initialDateTime: initdate,
                    onDateTimeChanged: (val) {
                      setState(() {
                        _chosen = val;
                      });
                    }),
              ),

              // Close the modal
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              CupertinoButton(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text('Назад'),
                onPressed: (){
                  Navigator.of(ctx).pop();
                  //return _chosen;
                },
              ),
              CupertinoButton(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text('Выбрать'),
                onPressed: (){
                  Navigator.of(ctx).pop(_chosen);
                  //return _chosen;
                },
              )]
              )
            ],
          ),
        ));
  }*/

    return await showDialog(
        context: ctx,
        builder: (_) =>
        new AlertDialog(
          contentPadding: EdgeInsets.zero,

          title: new Text(S.of(ctx).com_DateSelect),
          content: ConstrainedBox(
            constraints: new BoxConstraints(
              maxHeight: 300.0,
            ),
            child:CupertinoDatePicker(
              mode: mod,
              initialDateTime: initdate,
              onDateTimeChanged: (val) {
                setState(() {
                  _chosen = val;
                });
              })),
          actions: <Widget>[
            FlatButton(
              child: Text(S.of(ctx).com_Back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ), FlatButton(
              child: Text(S.of(ctx).com_Select("").trim()),
              onPressed: () {
                Navigator.of(ctx).pop(_chosen);
              },
            )
          ],
        ));
  }

  /*Future<DateTime> _showDateTimePicker(BuildContext ctx) async {
    DateTime _chosen=widget.initialDate;

    return await showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          height: 500,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Container(
                height: 400,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.dateAndTime,
                    initialDateTime: widget.initialDate,
                    onDateTimeChanged: (val) {
                      setState(() {
                        _chosen = val;
                      });
                    }),
              ),

              // Close the modal
              CupertinoButton(
                child: Text('OK'),
                onPressed: (){
                  Navigator.of(ctx).pop(_chosen);
                  //return _chosen;
                },
              )
            ],
          ),
        ));
  }

  Future<TimeOfDay> _showTimePicker(BuildContext ctx) async {
    DateTime _chosen;

    return await showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          height: 500,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Container(
                height: 400,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (val) {
                      setState(() {
                        _chosen = val;
                      });
                    }),
              ),

              // Close the modal
              CupertinoButton(
                child: Text('OK'),
                onPressed: (){
                  Navigator.of(ctx).pop(_chosen);
                  //return _chosen;
                },
              )
            ],
          ),
        ));
  }
*/
 /* DateTime _combine(DateTime date, TimeOfDay time) {
    if (date != null && time != null) {
      return DateTime(
          date.year, date.month, date.day, time?.hour ?? 0, time?.minute ?? 0);
    }
    return null;
  }*/

  String _tryFormat(T value, DateFormat format) {
    DateTime date;
    if (widget.type == CupertinoDateTimeFieldBlocBuilderBaseType.time) {
      final time = value as TimeOfDay;
      date = DateTime(1, 1, 1, time?.hour ?? 0, time?.minute ?? 0);
    }
    date = date ?? (value as DateTime);

    try {
      return format.format(date);
    } catch (e) {
      return date.millisecondsSinceEpoch.toString();
    }
  }

  InputDecoration _buildDecoration(BuildContext context,
      InputFieldBlocState<T, Object> state, bool isEnabled) {
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
            widget.dateTimeFieldBloc.state.value == null ? 0.0 : 1.0,
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              child: widget.clearIcon ?? Icon(Icons.clear),
              onTap: () => widget.dateTimeFieldBloc.state.value == null
                    ? null
                    : widget.dateTimeFieldBloc.clear()
            ),
          )
              : null),
    );

    return decoration;
  }
}
