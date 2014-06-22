/**
 * Created by vladimirkravchenko on 6/23/14.
 */
package {
import org.as3commons.logging.api.getLogger;
import org.puremvc.as3.interfaces.IFacade;
import org.puremvc.as3.patterns.facade.Facade;

public class ApplicationFacade extends Facade implements IFacade {
    public static function getInstance():ApplicationFacade {
        getLogger("ApplicationFacade").info("ApplicationFacade getInstance()");

        if (instance==null) {
            instance = new ApplicationFacade();
        }
        return instance as ApplicationFacade;
    }

    override protected function initializeController():void {
        super.initializeController();
        getLogger("ApplicationFacade").info("ApplicationFacade initializeController()");
    }
}
}
