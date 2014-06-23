/**
 * Created by vladimirkravchenko on 6/24/14.
 */
package controller {
import model.TestProxy;

import org.as3commons.logging.api.getLogger;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class StartCommand extends SimpleCommand {
    override public function execute(notification:INotification):void {
        getLogger(this).info("execute()");

        var testProxy:TestProxy = facade.retrieveProxy(TestProxy.NAME) as TestProxy;
        testProxy.testData = "newTestData";
        var otherTestProxy:TestProxy = facade.retrieveProxy("OtherTestProxy") as TestProxy;
        otherTestProxy.testData = "newOtherTestData";
    }
}
}
