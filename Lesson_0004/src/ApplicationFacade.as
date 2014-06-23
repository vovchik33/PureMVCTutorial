/**
 * Created by vladimirkravchenko on 6/24/14.
 */
package {
import controller.StartCommand;
import controller.TestCommand;

import model.TestProxy;

import org.puremvc.as3.interfaces.IFacade;
import org.puremvc.as3.patterns.facade.Facade;

public class ApplicationFacade extends Facade implements IFacade {
    public static const START_COMMAND:String = "controller.StartCommand";
    public static const TEST_COMMAND:String = "TestCommand";

    public static function getInstance():ApplicationFacade {
        if (instance == null) {
            instance = new ApplicationFacade();
        }
        return instance as ApplicationFacade;
    }

    override protected function initializeController():void {
        super.initializeController();

        registerCommand(START_COMMAND, StartCommand);
        registerCommand(TestProxy.CHANGED, TestCommand);

        registerProxy(new TestProxy());
        registerProxy(new TestProxy("OtherTestProxy", "otherTestData"));
    }

    public function startCommand(application:Object):void {
        sendNotification(START_COMMAND, application);
    }
}

}
