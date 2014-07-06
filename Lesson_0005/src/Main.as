package {

import flash.display.Sprite;

public class Main extends Sprite {
    private var _facade:ApplicationFacade;

    public function Main() {
        _facade = ApplicationFacade.getInstance();
    }
}
}
