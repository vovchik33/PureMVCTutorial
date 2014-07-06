package {

import com.demonsters.debugger.MonsterDebugger;

import flash.display.Sprite;
import flash.text.TextField;

import org.as3commons.logging.api.ILogger;
import org.as3commons.logging.api.LOGGER_FACTORY;
import org.as3commons.logging.api.getLogger;
import org.as3commons.logging.setup.LevelTargetSetup;
import org.as3commons.logging.setup.LogSetupLevel;
import org.as3commons.logging.setup.target.MonsterDebugger3TraceTarget;
import org.as3commons.logging.setup.target.TextFieldTarget;
import org.as3commons.logging.setup.target.TraceTarget;
import org.as3commons.logging.setup.target.mergeTargets;

public class Main extends Sprite {
    public function Main() {
        // Start the MonsterDebugger
        MonsterDebugger.initialize(this);

        //TextField for logging
        var textField:TextField = new TextField();
        textField.width = stage.stageWidth;
        textField.height = stage.stageHeight / 2;
        addChild(textField);

        //Logger Format
        var loggerFormat:String = "{logLevel} {time} - {shortName} - {message}\n";
        LOGGER_FACTORY.setup = new LevelTargetSetup(mergeTargets(new MonsterDebugger3TraceTarget(), new TraceTarget(loggerFormat), new TextFieldTarget(loggerFormat, textField)), LogSetupLevel.INFO);
        //LOGGER_FACTORY.setup=new SimpleTargetSetup(mergeTargets(new MonsterDebugger3TraceTarget(),new TextFieldTarget(null, textField)));

        var logger:ILogger;
        logger = getLogger(this);
        logger.debug("Hello debug");
        logger.info("Hello info");
        logger.debug("Hello debug again");
        logger.info("Hello info again");
    }
}
}
