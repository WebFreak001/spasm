module spasm.bindings.streams;

import spasm.types;
import spasm.bindings.common;

@safe:
nothrow:

struct ByteLengthQueuingStrategy {
  nothrow:
  spasm.bindings.streams.QueuingStrategy _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .QueuingStrategy(h);
  }
  void highWaterMark()(double highWaterMark) {
    ByteLengthQueuingStrategy_highWaterMark_Set(this._parent, highWaterMark);
  }
  auto highWaterMark()() {
    return ByteLengthQueuingStrategy_highWaterMark_Get(this._parent);
  }
  auto size()(scope ref ArrayBufferView chunk) {
    return ByteLengthQueuingStrategy_size(this._parent, chunk);
  }
}
struct CountQueuingStrategy {
  nothrow:
  spasm.bindings.streams.QueuingStrategy _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .QueuingStrategy(h);
  }
  void highWaterMark()(double highWaterMark) {
    CountQueuingStrategy_highWaterMark_Set(this._parent, highWaterMark);
  }
  auto highWaterMark()() {
    return CountQueuingStrategy_highWaterMark_Get(this._parent);
  }
  auto size(T0)(scope auto ref T0 chunk) {
    Handle _handle_chunk = getOrCreateHandle(chunk);
    auto result = CountQueuingStrategy_size(this._parent, _handle_chunk);
    dropHandle!(T0)(_handle_chunk);
    return result;
  }
}
struct PipeOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PipeOptions(spasm_add__object());
  }
  void preventClose(T0)(scope auto ref Optional!(T0) preventClose) if (isTOrPointer!(T0, bool)) {
    PipeOptions_preventClose_Set(this.handle, !preventClose.empty, preventClose.front);
  }
  auto preventClose()() {
    return PipeOptions_preventClose_Get(this.handle);
  }
  void preventAbort(T0)(scope auto ref Optional!(T0) preventAbort) if (isTOrPointer!(T0, bool)) {
    PipeOptions_preventAbort_Set(this.handle, !preventAbort.empty, preventAbort.front);
  }
  auto preventAbort()() {
    return PipeOptions_preventAbort_Get(this.handle);
  }
  void preventCancel(T0)(scope auto ref Optional!(T0) preventCancel) if (isTOrPointer!(T0, bool)) {
    PipeOptions_preventCancel_Set(this.handle, !preventCancel.empty, preventCancel.front);
  }
  auto preventCancel()() {
    return PipeOptions_preventCancel_Get(this.handle);
  }
}
struct QueuingStrategy {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return QueuingStrategy(spasm_add__object());
  }
  void highWaterMark(T0)(scope auto ref Optional!(T0) highWaterMark) if (isTOrPointer!(T0, double)) {
    QueuingStrategy_highWaterMark_Set(this.handle, !highWaterMark.empty, highWaterMark.front);
  }
  auto highWaterMark()() {
    return QueuingStrategy_highWaterMark_Get(this.handle);
  }
  void size(T0)(scope auto ref Optional!(T0) size) if (isTOrPointer!(T0, QueuingStrategySizeCallback)) {
    QueuingStrategy_size_Set(this.handle, !size.empty, size.front);
  }
  auto size()() {
    return QueuingStrategy_size_Get(this.handle);
  }
}
alias QueuingStrategySizeCallback = double delegate(Any);
struct ReadableByteStreamController {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto byobRequest()() {
    return ReadableStreamBYOBRequest(ReadableByteStreamController_byobRequest_Get(this.handle));
  }
  auto desiredSize()() {
    return ReadableByteStreamController_desiredSize_Get(this.handle);
  }
  void close()() {
    ReadableByteStreamController_close(this.handle);
  }
  void enqueue()(scope ref ArrayBufferView chunk) {
    ReadableByteStreamController_enqueue(this.handle, chunk);
  }
  void error(T0)(scope auto ref T0 error) {
    Handle _handle_error = getOrCreateHandle(error);
    ReadableByteStreamController_error(this.handle, _handle_error);
    dropHandle!(T0)(_handle_error);
  }
  void error()() {
    ReadableByteStreamController_error_0(this.handle);
  }
}
alias ReadableByteStreamControllerCallback = Any delegate(ReadableByteStreamController);
struct ReadableStream {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto locked()() {
    return ReadableStream_locked_Get(this.handle);
  }
  auto cancel(T0)(scope auto ref T0 reason) {
    Handle _handle_reason = getOrCreateHandle(reason);
    auto result = Promise!(void)(ReadableStream_cancel(this.handle, _handle_reason));
    dropHandle!(T0)(_handle_reason);
    return result;
  }
  auto cancel()() {
    return Promise!(void)(ReadableStream_cancel_0(this.handle));
  }
  auto getReader(T0)(scope auto ref T0 options) {
    Handle _handle_options = getOrCreateHandle(options);
    auto result = ReadableStreamBYOBReader(ReadableStream_getReader__Handle(this.handle, _handle_options));
    dropHandle!(T0)(_handle_options);
    return result;
  }
  auto getReader()() {
    return ReadableStreamDefaultReader(ReadableStream_getReader__(this.handle));
  }
  auto pipeThrough(T0)(scope auto ref T0 pair, scope ref PipeOptions options) {
    Handle _handle_pair = getOrCreateHandle(pair);
    auto result = Any(ReadableStream_pipeThrough(this.handle, _handle_pair, options.handle));
    dropHandle!(T0)(_handle_pair);
    return result;
  }
  auto pipeThrough(T0)(scope auto ref T0 pair) {
    Handle _handle_pair = getOrCreateHandle(pair);
    auto result = Any(ReadableStream_pipeThrough_0(this.handle, _handle_pair));
    dropHandle!(T0)(_handle_pair);
    return result;
  }
  auto pipeTo()(scope ref WritableStream dest, scope ref PipeOptions options) {
    return Promise!(void)(ReadableStream_pipeTo(this.handle, dest.handle, options.handle));
  }
  auto pipeTo()(scope ref WritableStream dest) {
    return Promise!(void)(ReadableStream_pipeTo_0(this.handle, dest.handle));
  }
  auto tee()() {
    return Sequence!(ReadableStream)(ReadableStream_tee(this.handle));
  }
}
struct ReadableStreamBYOBReader {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto closed()() {
    return Promise!(void)(ReadableStreamBYOBReader_closed_Get(this.handle));
  }
  auto cancel(T0)(scope auto ref T0 reason) {
    Handle _handle_reason = getOrCreateHandle(reason);
    auto result = Promise!(void)(ReadableStreamBYOBReader_cancel(this.handle, _handle_reason));
    dropHandle!(T0)(_handle_reason);
    return result;
  }
  auto cancel()() {
    return Promise!(void)(ReadableStreamBYOBReader_cancel_0(this.handle));
  }
  auto read()(scope ref ArrayBufferView view) {
    return Promise!(ReadableStreamReadResult)(ReadableStreamBYOBReader_read(this.handle, view));
  }
  void releaseLock()() {
    ReadableStreamBYOBReader_releaseLock(this.handle);
  }
}
struct ReadableStreamBYOBRequest {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto view()() {
    return ReadableStreamBYOBRequest_view_Get(this.handle);
  }
  void respond()(uint bytesWritten) {
    ReadableStreamBYOBRequest_respond(this.handle, bytesWritten);
  }
  void respondWithNewView()(scope ref ArrayBufferView view) {
    ReadableStreamBYOBRequest_respondWithNewView(this.handle, view);
  }
}
struct ReadableStreamDefaultController {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto desiredSize()() {
    return ReadableStreamDefaultController_desiredSize_Get(this.handle);
  }
  void close()() {
    ReadableStreamDefaultController_close(this.handle);
  }
  void enqueue(T0)(scope auto ref T0 chunk) {
    Handle _handle_chunk = getOrCreateHandle(chunk);
    ReadableStreamDefaultController_enqueue(this.handle, _handle_chunk);
    dropHandle!(T0)(_handle_chunk);
  }
  void error(T0)(scope auto ref T0 error) {
    Handle _handle_error = getOrCreateHandle(error);
    ReadableStreamDefaultController_error(this.handle, _handle_error);
    dropHandle!(T0)(_handle_error);
  }
  void error()() {
    ReadableStreamDefaultController_error_0(this.handle);
  }
}
alias ReadableStreamDefaultControllerCallback = Any delegate(ReadableStreamDefaultController);
struct ReadableStreamDefaultReader {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto closed()() {
    return Promise!(void)(ReadableStreamDefaultReader_closed_Get(this.handle));
  }
  auto cancel(T0)(scope auto ref T0 reason) {
    Handle _handle_reason = getOrCreateHandle(reason);
    auto result = Promise!(void)(ReadableStreamDefaultReader_cancel(this.handle, _handle_reason));
    dropHandle!(T0)(_handle_reason);
    return result;
  }
  auto cancel()() {
    return Promise!(void)(ReadableStreamDefaultReader_cancel_0(this.handle));
  }
  auto read()() {
    return Promise!(ReadableStreamReadResult)(ReadableStreamDefaultReader_read(this.handle));
  }
  void releaseLock()() {
    ReadableStreamDefaultReader_releaseLock(this.handle);
  }
}
alias ReadableStreamErrorCallback = Any delegate(Any);
struct ReadableStreamReadResult {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void done()(bool done) {
    ReadableStreamReadResult_done_Set(this.handle, done);
  }
  auto done()() {
    return ReadableStreamReadResult_done_Get(this.handle);
  }
  void value()(scope ref Any value) {
    ReadableStreamReadResult_value_Set(this.handle, value.handle);
  }
  auto value()() {
    return Any(ReadableStreamReadResult_value_Get(this.handle));
  }
}
struct TransformStream {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto readable()() {
    return ReadableStream(TransformStream_readable_Get(this.handle));
  }
  auto writable()() {
    return WritableStream(TransformStream_writable_Get(this.handle));
  }
}
struct TransformStreamDefaultController {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto desiredSize()() {
    return TransformStreamDefaultController_desiredSize_Get(this.handle);
  }
  void enqueue(T0)(scope auto ref T0 chunk) {
    Handle _handle_chunk = getOrCreateHandle(chunk);
    TransformStreamDefaultController_enqueue(this.handle, _handle_chunk);
    dropHandle!(T0)(_handle_chunk);
  }
  void error(T0)(scope auto ref T0 reason) {
    Handle _handle_reason = getOrCreateHandle(reason);
    TransformStreamDefaultController_error(this.handle, _handle_reason);
    dropHandle!(T0)(_handle_reason);
  }
  void error()() {
    TransformStreamDefaultController_error_0(this.handle);
  }
  void terminate()() {
    TransformStreamDefaultController_terminate(this.handle);
  }
}
alias TransformStreamDefaultControllerCallback = Any delegate(TransformStreamDefaultController);
alias TransformStreamDefaultControllerTransformCallback = Any delegate(Any, TransformStreamDefaultController);
struct Transformer {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return Transformer(spasm_add__object());
  }
  void start(T0)(scope auto ref Optional!(T0) start) if (isTOrPointer!(T0, TransformStreamDefaultControllerCallback)) {
    Transformer_start_Set(this.handle, !start.empty, start.front);
  }
  auto start()() {
    return Transformer_start_Get(this.handle);
  }
  void transform(T0)(scope auto ref Optional!(T0) transform) if (isTOrPointer!(T0, TransformStreamDefaultControllerTransformCallback)) {
    Transformer_transform_Set(this.handle, !transform.empty, transform.front);
  }
  auto transform()() {
    return Transformer_transform_Get(this.handle);
  }
  void flush(T0)(scope auto ref Optional!(T0) flush) if (isTOrPointer!(T0, TransformStreamDefaultControllerCallback)) {
    Transformer_flush_Set(this.handle, !flush.empty, flush.front);
  }
  auto flush()() {
    return Transformer_flush_Get(this.handle);
  }
  void readableType(T0)(scope auto ref T0 readableType) {
    Handle _handle_readableType = getOrCreateHandle(readableType);
    Transformer_readableType_Set(this.handle, _handle_readableType);
    dropHandle!(T0)(_handle_readableType);
  }
  auto readableType()() {
    return Any(Transformer_readableType_Get(this.handle));
  }
  void writableType(T0)(scope auto ref T0 writableType) {
    Handle _handle_writableType = getOrCreateHandle(writableType);
    Transformer_writableType_Set(this.handle, _handle_writableType);
    dropHandle!(T0)(_handle_writableType);
  }
  auto writableType()() {
    return Any(Transformer_writableType_Get(this.handle));
  }
}
struct UnderlyingByteSource {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return UnderlyingByteSource(spasm_add__object());
  }
  void start(T0)(scope auto ref Optional!(T0) start) if (isTOrPointer!(T0, ReadableByteStreamControllerCallback)) {
    UnderlyingByteSource_start_Set(this.handle, !start.empty, start.front);
  }
  auto start()() {
    return UnderlyingByteSource_start_Get(this.handle);
  }
  void pull(T0)(scope auto ref Optional!(T0) pull) if (isTOrPointer!(T0, ReadableByteStreamControllerCallback)) {
    UnderlyingByteSource_pull_Set(this.handle, !pull.empty, pull.front);
  }
  auto pull()() {
    return UnderlyingByteSource_pull_Get(this.handle);
  }
  void cancel(T0)(scope auto ref Optional!(T0) cancel) if (isTOrPointer!(T0, ReadableStreamErrorCallback)) {
    UnderlyingByteSource_cancel_Set(this.handle, !cancel.empty, cancel.front);
  }
  auto cancel()() {
    return UnderlyingByteSource_cancel_Get(this.handle);
  }
  void type()(string type) {
    UnderlyingByteSource_type_Set(this.handle, type);
  }
  auto type()() {
    return UnderlyingByteSource_type_Get(this.handle);
  }
  void autoAllocateChunkSize(T0)(scope auto ref Optional!(T0) autoAllocateChunkSize) if (isTOrPointer!(T0, uint)) {
    UnderlyingByteSource_autoAllocateChunkSize_Set(this.handle, !autoAllocateChunkSize.empty, autoAllocateChunkSize.front);
  }
  auto autoAllocateChunkSize()() {
    return UnderlyingByteSource_autoAllocateChunkSize_Get(this.handle);
  }
}
struct UnderlyingSink {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return UnderlyingSink(spasm_add__object());
  }
  void start(T0)(scope auto ref Optional!(T0) start) if (isTOrPointer!(T0, WritableStreamDefaultControllerStartCallback)) {
    UnderlyingSink_start_Set(this.handle, !start.empty, start.front);
  }
  auto start()() {
    return UnderlyingSink_start_Get(this.handle);
  }
  void write(T0)(scope auto ref Optional!(T0) write) if (isTOrPointer!(T0, WritableStreamDefaultControllerWriteCallback)) {
    UnderlyingSink_write_Set(this.handle, !write.empty, write.front);
  }
  auto write()() {
    return UnderlyingSink_write_Get(this.handle);
  }
  void close(T0)(scope auto ref Optional!(T0) close) if (isTOrPointer!(T0, WritableStreamDefaultControllerCloseCallback)) {
    UnderlyingSink_close_Set(this.handle, !close.empty, close.front);
  }
  auto close()() {
    return UnderlyingSink_close_Get(this.handle);
  }
  void abort(T0)(scope auto ref Optional!(T0) abort) if (isTOrPointer!(T0, WritableStreamErrorCallback)) {
    UnderlyingSink_abort_Set(this.handle, !abort.empty, abort.front);
  }
  auto abort()() {
    return UnderlyingSink_abort_Get(this.handle);
  }
  void type(T0)(scope auto ref T0 type) {
    Handle _handle_type = getOrCreateHandle(type);
    UnderlyingSink_type_Set(this.handle, _handle_type);
    dropHandle!(T0)(_handle_type);
  }
  auto type()() {
    return Any(UnderlyingSink_type_Get(this.handle));
  }
}
struct UnderlyingSource {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return UnderlyingSource(spasm_add__object());
  }
  void start(T0)(scope auto ref Optional!(T0) start) if (isTOrPointer!(T0, ReadableStreamDefaultControllerCallback)) {
    UnderlyingSource_start_Set(this.handle, !start.empty, start.front);
  }
  auto start()() {
    return UnderlyingSource_start_Get(this.handle);
  }
  void pull(T0)(scope auto ref Optional!(T0) pull) if (isTOrPointer!(T0, ReadableStreamDefaultControllerCallback)) {
    UnderlyingSource_pull_Set(this.handle, !pull.empty, pull.front);
  }
  auto pull()() {
    return UnderlyingSource_pull_Get(this.handle);
  }
  void cancel(T0)(scope auto ref Optional!(T0) cancel) if (isTOrPointer!(T0, ReadableStreamErrorCallback)) {
    UnderlyingSource_cancel_Set(this.handle, !cancel.empty, cancel.front);
  }
  auto cancel()() {
    return UnderlyingSource_cancel_Get(this.handle);
  }
  void type(T0)(scope auto ref T0 type) {
    Handle _handle_type = getOrCreateHandle(type);
    UnderlyingSource_type_Set(this.handle, _handle_type);
    dropHandle!(T0)(_handle_type);
  }
  auto type()() {
    return Any(UnderlyingSource_type_Get(this.handle));
  }
}
struct WritableStream {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto locked()() {
    return WritableStream_locked_Get(this.handle);
  }
  auto abort(T0)(scope auto ref T0 reason) {
    Handle _handle_reason = getOrCreateHandle(reason);
    auto result = Promise!(void)(WritableStream_abort(this.handle, _handle_reason));
    dropHandle!(T0)(_handle_reason);
    return result;
  }
  auto abort()() {
    return Promise!(void)(WritableStream_abort_0(this.handle));
  }
  auto getWriter()() {
    return WritableStreamDefaultWriter(WritableStream_getWriter(this.handle));
  }
}
struct WritableStreamDefaultController {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void error(T0)(scope auto ref T0 error) {
    Handle _handle_error = getOrCreateHandle(error);
    WritableStreamDefaultController_error(this.handle, _handle_error);
    dropHandle!(T0)(_handle_error);
  }
  void error()() {
    WritableStreamDefaultController_error_0(this.handle);
  }
}
alias WritableStreamDefaultControllerCloseCallback = Any delegate();
alias WritableStreamDefaultControllerStartCallback = Any delegate(WritableStreamDefaultController);
alias WritableStreamDefaultControllerWriteCallback = Any delegate(Any, WritableStreamDefaultController);
struct WritableStreamDefaultWriter {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto closed()() {
    return Promise!(void)(WritableStreamDefaultWriter_closed_Get(this.handle));
  }
  auto desiredSize()() {
    return WritableStreamDefaultWriter_desiredSize_Get(this.handle);
  }
  auto ready()() {
    return Promise!(void)(WritableStreamDefaultWriter_ready_Get(this.handle));
  }
  auto abort(T0)(scope auto ref T0 reason) {
    Handle _handle_reason = getOrCreateHandle(reason);
    auto result = Promise!(void)(WritableStreamDefaultWriter_abort(this.handle, _handle_reason));
    dropHandle!(T0)(_handle_reason);
    return result;
  }
  auto abort()() {
    return Promise!(void)(WritableStreamDefaultWriter_abort_0(this.handle));
  }
  auto close()() {
    return Promise!(void)(WritableStreamDefaultWriter_close(this.handle));
  }
  void releaseLock()() {
    WritableStreamDefaultWriter_releaseLock(this.handle);
  }
  auto write(T0)(scope auto ref T0 chunk) {
    Handle _handle_chunk = getOrCreateHandle(chunk);
    auto result = Promise!(void)(WritableStreamDefaultWriter_write(this.handle, _handle_chunk));
    dropHandle!(T0)(_handle_chunk);
    return result;
  }
}
alias WritableStreamErrorCallback = Any delegate(Any);


extern (C) void ByteLengthQueuingStrategy_highWaterMark_Set(Handle, double);
extern (C) double ByteLengthQueuingStrategy_highWaterMark_Get(Handle);
extern (C) double ByteLengthQueuingStrategy_size(Handle, scope ref ArrayBufferView);
extern (C) void CountQueuingStrategy_highWaterMark_Set(Handle, double);
extern (C) double CountQueuingStrategy_highWaterMark_Get(Handle);
extern (C) double CountQueuingStrategy_size(Handle, Handle);
extern (C) void PipeOptions_preventClose_Set(Handle, bool, bool);
extern (C) Optional!(bool) PipeOptions_preventClose_Get(Handle);
extern (C) void PipeOptions_preventAbort_Set(Handle, bool, bool);
extern (C) Optional!(bool) PipeOptions_preventAbort_Get(Handle);
extern (C) void PipeOptions_preventCancel_Set(Handle, bool, bool);
extern (C) Optional!(bool) PipeOptions_preventCancel_Get(Handle);
extern (C) void QueuingStrategy_highWaterMark_Set(Handle, bool, double);
extern (C) Optional!(double) QueuingStrategy_highWaterMark_Get(Handle);
extern (C) void QueuingStrategy_size_Set(Handle, bool, QueuingStrategySizeCallback);
extern (C) Optional!(QueuingStrategySizeCallback) QueuingStrategy_size_Get(Handle);
extern (C) Handle ReadableByteStreamController_byobRequest_Get(Handle);
extern (C) Optional!(double) ReadableByteStreamController_desiredSize_Get(Handle);
extern (C) void ReadableByteStreamController_close(Handle);
extern (C) void ReadableByteStreamController_enqueue(Handle, scope ref ArrayBufferView);
extern (C) void ReadableByteStreamController_error(Handle, Handle);
extern (C) void ReadableByteStreamController_error_0(Handle);
extern (C) bool ReadableStream_locked_Get(Handle);
extern (C) Handle ReadableStream_cancel(Handle, Handle);
extern (C) Handle ReadableStream_cancel_0(Handle);
extern (C) Handle ReadableStream_getReader__Handle(Handle, Handle);
extern (C) Handle ReadableStream_getReader__(Handle);
extern (C) Handle ReadableStream_pipeThrough(Handle, Handle, Handle);
extern (C) Handle ReadableStream_pipeThrough_0(Handle, Handle);
extern (C) Handle ReadableStream_pipeTo(Handle, Handle, Handle);
extern (C) Handle ReadableStream_pipeTo_0(Handle, Handle);
extern (C) Handle ReadableStream_tee(Handle);
extern (C) Handle ReadableStreamBYOBReader_closed_Get(Handle);
extern (C) Handle ReadableStreamBYOBReader_cancel(Handle, Handle);
extern (C) Handle ReadableStreamBYOBReader_cancel_0(Handle);
extern (C) Handle ReadableStreamBYOBReader_read(Handle, scope ref ArrayBufferView);
extern (C) void ReadableStreamBYOBReader_releaseLock(Handle);
extern (C) ArrayBufferView ReadableStreamBYOBRequest_view_Get(Handle);
extern (C) void ReadableStreamBYOBRequest_respond(Handle, uint);
extern (C) void ReadableStreamBYOBRequest_respondWithNewView(Handle, scope ref ArrayBufferView);
extern (C) Optional!(double) ReadableStreamDefaultController_desiredSize_Get(Handle);
extern (C) void ReadableStreamDefaultController_close(Handle);
extern (C) void ReadableStreamDefaultController_enqueue(Handle, Handle);
extern (C) void ReadableStreamDefaultController_error(Handle, Handle);
extern (C) void ReadableStreamDefaultController_error_0(Handle);
extern (C) Handle ReadableStreamDefaultReader_closed_Get(Handle);
extern (C) Handle ReadableStreamDefaultReader_cancel(Handle, Handle);
extern (C) Handle ReadableStreamDefaultReader_cancel_0(Handle);
extern (C) Handle ReadableStreamDefaultReader_read(Handle);
extern (C) void ReadableStreamDefaultReader_releaseLock(Handle);
extern (C) void ReadableStreamReadResult_done_Set(Handle, bool);
extern (C) bool ReadableStreamReadResult_done_Get(Handle);
extern (C) void ReadableStreamReadResult_value_Set(Handle, Handle);
extern (C) Handle ReadableStreamReadResult_value_Get(Handle);
extern (C) Handle TransformStream_readable_Get(Handle);
extern (C) Handle TransformStream_writable_Get(Handle);
extern (C) Optional!(double) TransformStreamDefaultController_desiredSize_Get(Handle);
extern (C) void TransformStreamDefaultController_enqueue(Handle, Handle);
extern (C) void TransformStreamDefaultController_error(Handle, Handle);
extern (C) void TransformStreamDefaultController_error_0(Handle);
extern (C) void TransformStreamDefaultController_terminate(Handle);
extern (C) void Transformer_start_Set(Handle, bool, TransformStreamDefaultControllerCallback);
extern (C) Optional!(TransformStreamDefaultControllerCallback) Transformer_start_Get(Handle);
extern (C) void Transformer_transform_Set(Handle, bool, TransformStreamDefaultControllerTransformCallback);
extern (C) Optional!(TransformStreamDefaultControllerTransformCallback) Transformer_transform_Get(Handle);
extern (C) void Transformer_flush_Set(Handle, bool, TransformStreamDefaultControllerCallback);
extern (C) Optional!(TransformStreamDefaultControllerCallback) Transformer_flush_Get(Handle);
extern (C) void Transformer_readableType_Set(Handle, Handle);
extern (C) Handle Transformer_readableType_Get(Handle);
extern (C) void Transformer_writableType_Set(Handle, Handle);
extern (C) Handle Transformer_writableType_Get(Handle);
extern (C) void UnderlyingByteSource_start_Set(Handle, bool, ReadableByteStreamControllerCallback);
extern (C) Optional!(ReadableByteStreamControllerCallback) UnderlyingByteSource_start_Get(Handle);
extern (C) void UnderlyingByteSource_pull_Set(Handle, bool, ReadableByteStreamControllerCallback);
extern (C) Optional!(ReadableByteStreamControllerCallback) UnderlyingByteSource_pull_Get(Handle);
extern (C) void UnderlyingByteSource_cancel_Set(Handle, bool, ReadableStreamErrorCallback);
extern (C) Optional!(ReadableStreamErrorCallback) UnderlyingByteSource_cancel_Get(Handle);
extern (C) void UnderlyingByteSource_type_Set(Handle, string);
extern (C) string UnderlyingByteSource_type_Get(Handle);
extern (C) void UnderlyingByteSource_autoAllocateChunkSize_Set(Handle, bool, uint);
extern (C) Optional!(uint) UnderlyingByteSource_autoAllocateChunkSize_Get(Handle);
extern (C) void UnderlyingSink_start_Set(Handle, bool, WritableStreamDefaultControllerStartCallback);
extern (C) Optional!(WritableStreamDefaultControllerStartCallback) UnderlyingSink_start_Get(Handle);
extern (C) void UnderlyingSink_write_Set(Handle, bool, WritableStreamDefaultControllerWriteCallback);
extern (C) Optional!(WritableStreamDefaultControllerWriteCallback) UnderlyingSink_write_Get(Handle);
extern (C) void UnderlyingSink_close_Set(Handle, bool, WritableStreamDefaultControllerCloseCallback);
extern (C) Optional!(WritableStreamDefaultControllerCloseCallback) UnderlyingSink_close_Get(Handle);
extern (C) void UnderlyingSink_abort_Set(Handle, bool, WritableStreamErrorCallback);
extern (C) Optional!(WritableStreamErrorCallback) UnderlyingSink_abort_Get(Handle);
extern (C) void UnderlyingSink_type_Set(Handle, Handle);
extern (C) Handle UnderlyingSink_type_Get(Handle);
extern (C) void UnderlyingSource_start_Set(Handle, bool, ReadableStreamDefaultControllerCallback);
extern (C) Optional!(ReadableStreamDefaultControllerCallback) UnderlyingSource_start_Get(Handle);
extern (C) void UnderlyingSource_pull_Set(Handle, bool, ReadableStreamDefaultControllerCallback);
extern (C) Optional!(ReadableStreamDefaultControllerCallback) UnderlyingSource_pull_Get(Handle);
extern (C) void UnderlyingSource_cancel_Set(Handle, bool, ReadableStreamErrorCallback);
extern (C) Optional!(ReadableStreamErrorCallback) UnderlyingSource_cancel_Get(Handle);
extern (C) void UnderlyingSource_type_Set(Handle, Handle);
extern (C) Handle UnderlyingSource_type_Get(Handle);
extern (C) bool WritableStream_locked_Get(Handle);
extern (C) Handle WritableStream_abort(Handle, Handle);
extern (C) Handle WritableStream_abort_0(Handle);
extern (C) Handle WritableStream_getWriter(Handle);
extern (C) void WritableStreamDefaultController_error(Handle, Handle);
extern (C) void WritableStreamDefaultController_error_0(Handle);
extern (C) Handle WritableStreamDefaultWriter_closed_Get(Handle);
extern (C) Optional!(double) WritableStreamDefaultWriter_desiredSize_Get(Handle);
extern (C) Handle WritableStreamDefaultWriter_ready_Get(Handle);
extern (C) Handle WritableStreamDefaultWriter_abort(Handle, Handle);
extern (C) Handle WritableStreamDefaultWriter_abort_0(Handle);
extern (C) Handle WritableStreamDefaultWriter_close(Handle);
extern (C) void WritableStreamDefaultWriter_releaseLock(Handle);
extern (C) Handle WritableStreamDefaultWriter_write(Handle, Handle);