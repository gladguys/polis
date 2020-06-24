// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'document_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$DocumentEventTearOff {
  const _$DocumentEventTearOff();

  OpenDocumentImage openDocumentImage(String url) {
    return OpenDocumentImage(
      url,
    );
  }
}

// ignore: unused_element
const $DocumentEvent = _$DocumentEventTearOff();

mixin _$DocumentEvent {
  String get url;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result openDocumentImage(String url),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result openDocumentImage(String url),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result openDocumentImage(OpenDocumentImage value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result openDocumentImage(OpenDocumentImage value),
    @required Result orElse(),
  });

  $DocumentEventCopyWith<DocumentEvent> get copyWith;
}

abstract class $DocumentEventCopyWith<$Res> {
  factory $DocumentEventCopyWith(
          DocumentEvent value, $Res Function(DocumentEvent) then) =
      _$DocumentEventCopyWithImpl<$Res>;
  $Res call({String url});
}

class _$DocumentEventCopyWithImpl<$Res>
    implements $DocumentEventCopyWith<$Res> {
  _$DocumentEventCopyWithImpl(this._value, this._then);

  final DocumentEvent _value;
  // ignore: unused_field
  final $Res Function(DocumentEvent) _then;

  @override
  $Res call({
    Object url = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed ? _value.url : url as String,
    ));
  }
}

abstract class $OpenDocumentImageCopyWith<$Res>
    implements $DocumentEventCopyWith<$Res> {
  factory $OpenDocumentImageCopyWith(
          OpenDocumentImage value, $Res Function(OpenDocumentImage) then) =
      _$OpenDocumentImageCopyWithImpl<$Res>;
  @override
  $Res call({String url});
}

class _$OpenDocumentImageCopyWithImpl<$Res>
    extends _$DocumentEventCopyWithImpl<$Res>
    implements $OpenDocumentImageCopyWith<$Res> {
  _$OpenDocumentImageCopyWithImpl(
      OpenDocumentImage _value, $Res Function(OpenDocumentImage) _then)
      : super(_value, (v) => _then(v as OpenDocumentImage));

  @override
  OpenDocumentImage get _value => super._value as OpenDocumentImage;

  @override
  $Res call({
    Object url = freezed,
  }) {
    return _then(OpenDocumentImage(
      url == freezed ? _value.url : url as String,
    ));
  }
}

class _$OpenDocumentImage implements OpenDocumentImage {
  _$OpenDocumentImage(this.url) : assert(url != null);

  @override
  final String url;

  @override
  String toString() {
    return 'DocumentEvent.openDocumentImage(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OpenDocumentImage &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(url);

  @override
  $OpenDocumentImageCopyWith<OpenDocumentImage> get copyWith =>
      _$OpenDocumentImageCopyWithImpl<OpenDocumentImage>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result openDocumentImage(String url),
  }) {
    assert(openDocumentImage != null);
    return openDocumentImage(url);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result openDocumentImage(String url),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (openDocumentImage != null) {
      return openDocumentImage(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result openDocumentImage(OpenDocumentImage value),
  }) {
    assert(openDocumentImage != null);
    return openDocumentImage(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result openDocumentImage(OpenDocumentImage value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (openDocumentImage != null) {
      return openDocumentImage(this);
    }
    return orElse();
  }
}

abstract class OpenDocumentImage implements DocumentEvent {
  factory OpenDocumentImage(String url) = _$OpenDocumentImage;

  @override
  String get url;
  @override
  $OpenDocumentImageCopyWith<OpenDocumentImage> get copyWith;
}
