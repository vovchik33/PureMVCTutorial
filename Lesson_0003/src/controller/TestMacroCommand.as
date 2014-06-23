/**
 * Created by vladimirkravchenko on 6/24/14.
 */
package controller {
import org.as3commons.logging.api.getLogger;
import org.puremvc.as3.patterns.command.MacroCommand;

public class TestMacroCommand extends MacroCommand {
    override protected function initializeMacroCommand():void {
        getLogger(this).info("initializeMacroCommand()");
        addSubCommand(TestCommand);
        addSubCommand(TestCommand);
        addSubCommand(TestCommand);
    }
}
}
