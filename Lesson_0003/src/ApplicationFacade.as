/**
 * Created by vladimirkravchenko on 6/24/14.
 */
package {
import controler.TestCommand;
import controler.TestMacroCommand;

import org.as3commons.logging.api.getLogger;
import org.puremvc.as3.interfaces.IFacade;
import org.puremvc.as3.patterns.facade.Facade;

public class ApplicationFacade extends Facade implements IFacade {
    public static const TEST_COMMAND:String = "TestCommand";
    public static const TESTMACRO_COMMAND:String = "TestMacroCommand";

    public static function getInstance():ApplicationFacade {
        if (instance == null) {
            instance = new ApplicationFacade();
        }
        return instance as ApplicationFacade;
    }

    override protected function initializeController():void {
        super.initializeController();
        getLogger("ApplicationFacade").info("ApplicationFacade initializeController()");

        registerCommand(TEST_COMMAND, TestCommand);
        registerCommand(TESTMACRO_COMMAND, TestMacroCommand);
    }


    public function testCommand(application:Object):void {
        sendNotification(TEST_COMMAND, application);
    }

    public function testMacroCommand(application:Object):void {
        sendNotification(TESTMACRO_COMMAND, application);
    }

}
}
