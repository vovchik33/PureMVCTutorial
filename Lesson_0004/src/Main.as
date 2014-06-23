package {

import com.demonsters.debugger.MonsterDebugger;

import flash.display.Sprite;

import org.as3commons.logging.api.LOGGER_FACTORY;
import org.as3commons.logging.setup.LevelTargetSetup;
import org.as3commons.logging.setup.LogSetupLevel;
import org.as3commons.logging.setup.target.MonsterDebugger3TraceTarget;
import org.as3commons.logging.setup.target.TraceTarget;
import org.as3commons.logging.setup.target.mergeTargets;

public class Main extends Sprite {
    private var loggerFormat:String = "{logLevel} {time} - {shortName} - {message}\n";
    private var facade:ApplicationFacade;

    public function Main() {
        MonsterDebugger.initialize(this);
        LOGGER_FACTORY.setup = new LevelTargetSetup(mergeTargets(new MonsterDebugger3TraceTarget(), new TraceTarget(loggerFormat)), LogSetupLevel.ALL);

        facade = ApplicationFacade.getInstance();
        facade.startCommand(this);
    }
}
}
