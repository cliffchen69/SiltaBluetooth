# Aengin SiltaBluetooth SDK for Apple iOS

##Table of Contents

- [Introduction](#introduction)
- [How to Use](#How-to-Use)
  - [Installation](#installation)
  - [Application](#application)


## Introduction

SiltaBluetooth applies to Bluetooth Low Energy (BLE) App development on Apple iOS environment.

Its main feature is to control, monitor, and track any BLE devices or module.

## How to Use

### Installation

1) You can install our SDK via CocoaPods.

`pod 'SiltaBluetooth', '~> 0.1.5'`

2) Or, you can simply download “SiltaBluetooth.framework."

[click me](https://drive.google.com/a/aengin.com/file/d/0Bxf8xz9_np75QzdFajVxM0lLUXM/view?usp=sharing)

### Application

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
      public func start() //Enable the bluetooth scanning.
      public func stop() //Stop scanning.
      public func fireCommand(command: SiltaBluetooth.ICommand, ble: SiltaBluetooth.Bluetooth) //Give commands to Bluetooth devices.
    }

**Functions to control, monitor, and track any BLE devices or module..**

    @objc public protocol SiltaBluetoothDelegate : NSObjectProtocol {
     
      optional public func bluetoothDeviceListBeenRenewed(bles: [SiltaBluetooth.Bluetooth]) //Device list updated.
      optional public func bluetoothExecuteCommandSuccess(ble: SiltaBluetooth.Bluetooth) //Commands executed successfully.
      optional public func bluetoothExecuteCommandFailure(ble: SiltaBluetooth.Bluetooth)
      optional public func bluetoothDisabled() //BLE devices not enabled.
      optional public func bluetoothUnauthorized() //BLE devices not authorized to use.
      optional public func bluetoothUnsupported() //No BLE devices connected.
    }

