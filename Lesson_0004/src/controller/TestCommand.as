/**
 * Created by vladimirkravchenko on 6/24/14.
 */
package controller {
import org.as3commons.logging.api.getLogger;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class TestCommand extends SimpleCommand {
    override public function execute(notification:INotification):void {
        getLogger(this).info("execute() " + notification.getBody());
    }
}
}
