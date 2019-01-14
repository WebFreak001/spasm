module spasm.bindings.permissions;

import spasm.types;
import spasm.bindings.dom;
import spasm.bindings.html;

struct DevicePermissionDescriptor {
  PermissionDescriptor _parent;
  alias _parent this;
  this(JsHandle h) {
    _parent = PermissionDescriptor(h);
  }
  static auto create() {
    return DevicePermissionDescriptor(JsHandle(spasm_add__object()));
  }
  auto deviceId(string deviceId) {
    DevicePermissionDescriptor_deviceId_Set(this._parent, deviceId);
  }
  auto deviceId() {
    auto result = DevicePermissionDescriptor_deviceId_Get(this._parent);
    return result;
  }
}
struct MidiPermissionDescriptor {
  PermissionDescriptor _parent;
  alias _parent this;
  this(JsHandle h) {
    _parent = PermissionDescriptor(h);
  }
  static auto create() {
    return MidiPermissionDescriptor(JsHandle(spasm_add__object()));
  }
  auto sysex(bool sysex) {
    MidiPermissionDescriptor_sysex_Set(this._parent, sysex);
  }
  auto sysex() {
    auto result = MidiPermissionDescriptor_sysex_Get(this._parent);
    return result;
  }
}
struct PermissionDescriptor {
  JsHandle handle;
  alias handle this;
  static auto create() {
    return PermissionDescriptor(JsHandle(spasm_add__object()));
  }
  auto name(PermissionName name) {
    PermissionDescriptor_name_Set(this.handle, name);
  }
  auto name() {
    auto result = PermissionDescriptor_name_Get(this.handle);
    return result;
  }
}
enum PermissionName {
  geolocation,
  notifications,
  push,
  midi,
  camera,
  microphone,
  speaker,
  device_info,
  background_fetch,
  background_sync,
  bluetooth,
  persistent_storage,
  ambient_light_sensor,
  accelerometer,
  gyroscope,
  magnetometer,
  clipboard,
  display
}
struct PermissionSetParameters {
  JsHandle handle;
  alias handle this;
  static auto create() {
    return PermissionSetParameters(JsHandle(spasm_add__object()));
  }
  auto descriptor(PermissionDescriptor descriptor) {
    PermissionSetParameters_descriptor_Set(this.handle, descriptor.handle);
  }
  auto descriptor() {
    auto result = PermissionDescriptor(JsHandle(PermissionSetParameters_descriptor_Get(this.handle)));
    return result;
  }
  auto state(PermissionState state) {
    PermissionSetParameters_state_Set(this.handle, state);
  }
  auto state() {
    auto result = PermissionSetParameters_state_Get(this.handle);
    return result;
  }
  auto oneRealm(bool oneRealm) {
    PermissionSetParameters_oneRealm_Set(this.handle, oneRealm);
  }
  auto oneRealm() {
    auto result = PermissionSetParameters_oneRealm_Get(this.handle);
    return result;
  }
}
enum PermissionState {
  granted,
  denied,
  prompt
}
struct PermissionStatus {
  EventTarget _parent;
  alias _parent this;
  this(JsHandle h) {
    _parent = EventTarget(h);
  }
  auto state() {
    auto result = PermissionStatus_state_Get(this._parent);
    return result;
  }
  auto onchange(EventHandler onchange) {
    PermissionStatus_onchange_Set(this._parent, onchange);
  }
  auto onchange() {
    auto result = PermissionStatus_onchange_Get(this._parent);
    return result;
  }
}
struct Permissions {
  JsHandle handle;
  alias handle this;
  auto query(JsObject permissionDesc) {
    auto result = Promise!(PermissionStatus)(JsHandle(Permissions_query(this.handle, permissionDesc.handle)));
    return result;
  }
}
struct PushPermissionDescriptor {
  PermissionDescriptor _parent;
  alias _parent this;
  this(JsHandle h) {
    _parent = PermissionDescriptor(h);
  }
  static auto create() {
    return PushPermissionDescriptor(JsHandle(spasm_add__object()));
  }
  auto userVisibleOnly(bool userVisibleOnly) {
    PushPermissionDescriptor_userVisibleOnly_Set(this._parent, userVisibleOnly);
  }
  auto userVisibleOnly() {
    auto result = PushPermissionDescriptor_userVisibleOnly_Get(this._parent);
    return result;
  }
}


extern (C) void DevicePermissionDescriptor_create(Handle);
extern (C) void DevicePermissionDescriptor_deviceId_Set(Handle, string);
extern (C) string DevicePermissionDescriptor_deviceId_Get(Handle);
extern (C) void MidiPermissionDescriptor_create(Handle);
extern (C) void MidiPermissionDescriptor_sysex_Set(Handle, bool);
extern (C) bool MidiPermissionDescriptor_sysex_Get(Handle);
extern (C) void PermissionDescriptor_create(Handle);
extern (C) void PermissionDescriptor_name_Set(Handle, PermissionName);
extern (C) PermissionName PermissionDescriptor_name_Get(Handle);
extern (C) void PermissionSetParameters_create(Handle);
extern (C) void PermissionSetParameters_descriptor_Set(Handle, Handle);
extern (C) Handle PermissionSetParameters_descriptor_Get(Handle);
extern (C) void PermissionSetParameters_state_Set(Handle, PermissionState);
extern (C) PermissionState PermissionSetParameters_state_Get(Handle);
extern (C) void PermissionSetParameters_oneRealm_Set(Handle, bool);
extern (C) bool PermissionSetParameters_oneRealm_Get(Handle);
extern (C) PermissionState PermissionStatus_state_Get(Handle);
extern (C) void PermissionStatus_onchange_Set(Handle, EventHandler);
extern (C) EventHandler PermissionStatus_onchange_Get(Handle);
extern (C) Handle Permissions_query(Handle, Handle);
extern (C) void PushPermissionDescriptor_create(Handle);
extern (C) void PushPermissionDescriptor_userVisibleOnly_Set(Handle, bool);
extern (C) bool PushPermissionDescriptor_userVisibleOnly_Get(Handle);