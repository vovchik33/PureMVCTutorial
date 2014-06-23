/**
 * Created by vladimirkravchenko on 6/24/14.
 */
package model {
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.interfaces.IProxy;
import org.puremvc.as3.patterns.observer.Notification;
import org.puremvc.as3.patterns.proxy.Proxy;

public class TestProxy extends Proxy implements IProxy {
    public static const NAME:String = "TestProxy";
    public static const CHANGED:String = "TestProxy.CHANGED";

    private var _testData:String = "";

    public function TestProxy(proxyName:String = TestProxy.NAME, data:Object = null) {
        super(proxyName, data);
    }


    public function get testData():String {
        return _testData;
    }

    public function set testData(value:String):void {
        _testData = value;
        notifyChanged();
    }

    private function notifyChanged():void {
        var notification:INotification = new Notification(TestProxy.CHANGED, _testData);
        facade.notifyObservers(notification);
    }
}
}
