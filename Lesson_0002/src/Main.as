package {

import com.demonsters.debugger.MonsterDebugger;

import flash.display.Sprite;
import flash.text.TextField;

import org.as3commons.logging.api.LOGGER_FACTORY;
import org.as3commons.logging.api.getLogger;
import org.as3commons.logging.setup.LevelTargetSetup;
import org.as3commons.logging.setup.LogSetupLevel;
import org.as3commons.logging.setup.target.MonsterDebugger3TraceTarget;
import org.as3commons.logging.setup.target.TraceTarget;
import org.as3commons.logging.setup.target.mergeTargets;

public class Main extends Sprite {
    private const loggerFormat:String = "{logLevel} {time} - {shortName} - {message}\n";
    private var facade:ApplicationFacade;

    public function Main() {
        var textField:TextField = new TextField();
        textField.text = "Hello, World";
        addChild(textField);

        initialize();

    }

    private function initialize():void {
        MonsterDebugger.initialize(this);
        LOGGER_FACTORY.setup = new LevelTargetSetup(mergeTargets(new MonsterDebugger3TraceTarget(), new TraceTarget(loggerFormat)), LogSetupLevel.ALL);

        getLogger(this).info("Initialization start...");

        facade = ApplicationFacade.getInstance();

        getLogger(this).info("Initialization complete")
    }
}
}
