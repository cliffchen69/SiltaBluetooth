# SiltaBluetooth

##簡介

SiltaBluetooth適用於IOS之BLE App開發

功能:
提供控制 bluetooth
提供追蹤藍芽元件運行機制的各種方式

##開始

**安裝**

一 你可以透過CocoaPods安裝我們的SDK
`pod 'SiltaBluetooth', '~> 0.1.4'`

二 你可以直接下載SiltaBluetooth.framework
[click me](https://drive.google.com/a/aengin.com/file/d/0Bxf8xz9_np75QzdFajVxM0lLUXM/view?usp=sharing)

**使用SDK**

Swift:
 
 首先你必須先取得SiltaManager
 `let silta = SiltaBluetooth.getManager()` 
 再來委託SDK
 `silta?.delegate = self`
 最後Enjoy it


##Library

**封裝單一 BLE 裝置的資訊**
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

**提供控制 bluetooth 功能**

public protocol ISiltaBluetoothManager : NSObjectProtocol {

  public var delegate: SiltaBluetoothDelegate? { get set } //SiltaBluetoothDelegate

  public func start() //啟動 bluetooth 掃瞄機制

  public func stop() //停止 bluetooth 掃瞄機制

  public func fireCommand(command: SiltaBluetooth.ICommand, ble: SiltaBluetooth.Bluetooth) //傳送指令到 Bluetooth 裝置
}

**提供追蹤藍芽元件運行機制的各種方式**
@objc public protocol SiltaBluetoothDelegate : NSObjectProtocol {

  optional public func bluetoothDeviceListBeenRenewed(bles: [SiltaBluetooth.Bluetooth]) //裝置清單已更新

  optional public func bluetoothExecuteCommandSuccess(ble: SiltaBluetooth.Bluetooth) //指令執行成功

  optional public func bluetoothExecuteCommandFailure(ble: SiltaBluetooth.Bluetooth)

  optional public func bluetoothDisabled() //藍芽裝置未開啟

  optional public func bluetoothUnauthorized() //藍芽裝置未授權使用

  optional public func bluetoothUnsupported() //裝置上無藍芽裝置
}

