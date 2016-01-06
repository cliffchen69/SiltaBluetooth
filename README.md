# Aengin SiltaBluetooth SDK for Apple iOS

##Table of Contents

- [Introduction](#Introduction)
- [How to Use](#How to Use)
  - [Installation](#Installation)
  - [Application](#Application)


##Introduction

SiltaBluetooth applies to Bluetooth Low Energy (BLE) App development on Apple iOS environment.

Its main feature is to control, monitor, and track any BLE devices or module.

##How to Use

**Installation**

1) You can install our SDK via CocoaPods.

`pod 'SiltaBluetooth', '~> 0.1.4'`

2) Or, you can simply download “SiltaBluetooth.framework."

[click me](https://drive.google.com/a/aengin.com/file/d/0Bxf8xz9_np75QzdFajVxM0lLUXM/view?usp=sharing)

**Application**

Swift:
 
 First, you need to have the SiltaManager.

 `let silta = SiltaBluetooth.getManager()` 

 
 Then, delegate the SDK.

 `silta?.delegate = self`

 You are now ready to get started with App development.


##Library

**Pack the information of one single BLE device.**

    public class Bluetooth : NSObject {
      public var manufacturer: String?
      public var UUID: String?
      public var powerLevel: NSNumber?
      public var RSSI: NSNumber?
      public var name: String?
      public var live: Bool!
      public func accuracy() -> Int
      override public func isEqual(object: AnyObject?) -> Bool
      override public var hash: Int { get }
    }

**Command**

    public enum ICommand {
      case Buzzer
    }

**Functions to control BLE device.**

    public protocol ISiltaBluetoothManager : NSObjectProtocol {
      public var delegate: SiltaBluetoothDelegate? { get set } //SiltaBluetoothDelegate
      public func start() //啟動 bluetooth 掃瞄機制
      public func stop() //停止 bluetooth 掃瞄機制
      public func fireCommand(command: SiltaBluetooth.ICommand, ble: SiltaBluetooth.Bluetooth) //傳送指令到 Bluetooth 裝置
    }

**Functions to control, monitor, and track any BLE devices or module..**

    @objc public protocol SiltaBluetoothDelegate : NSObjectProtocol {
      optional public func bluetoothDeviceListBeenRenewed(bles: [SiltaBluetooth.Bluetooth]) //裝置清單已更新
      optional public func bluetoothExecuteCommandSuccess(ble: SiltaBluetooth.Bluetooth) //指令執行成功
      optional public func bluetoothExecuteCommandFailure(ble: SiltaBluetooth.Bluetooth)
      optional public func bluetoothDisabled() //藍芽裝置未開啟
      optional public func bluetoothUnauthorized() //藍芽裝置未授權使用
      optional public func bluetoothUnsupported() //裝置上無藍芽裝置
    }

