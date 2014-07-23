package
{
 
    import flash.display.MovieClip;
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;
    import flash.utils.*;//need for setTimeout
 
 
    //use this class for main class your flash project
    public class cheatCodeMain extends MovieClip
    {
 
        public function cheatCodeMain()
        {
            // init
            init_cheats_listener();
 
        }
 
        public var correct:MovieClip = new correctMc(); //your MovieClip inside library for add when code is correct
 
        private var keyBuffer:Array = [];
 
        //private var cheatCode:Array = [Keyboard.UP,Keyboard.DOWN,Keyboard.LEFT,Keyboard.RIGHT];
        private var cheatCode:Array = ["1".charCodeAt(),"2".charCodeAt(),"3".charCodeAt(),"4".charCodeAt(),"5".charCodeAt(),"6".charCodeAt()];
        
        //your cheat code now is :  123456
        
        
        private var type_timeout:uint;
 
        private function init_cheats_listener():void
        {
            stage.addEventListener(KeyboardEvent.KEY_UP, on_cheat_key_up , false , 0 , true);
        }
 
        private function on_cheat_key_up(evt:KeyboardEvent):void
        {
 
            if (type_timeout)
            {
                clearTimeout(type_timeout);
            }
 
            //if length in Equal remove one index from first
            if (keyBuffer.length == cheatCode.length)
            {
                keyBuffer.shift();
            }
 
            //get keyCode & charCode;
            if (evt.charCode == 0)
            {
                keyBuffer.push(evt.keyCode);
            }
            else
            {
                keyBuffer.push(evt.charCode);
            }
 
            //checking by join and compire;
            if (keyBuffer.join("") == cheatCode.join(""))
            {
                trace(keyBuffer.join("")+"=="+cheatCode.join("")+" - The Correct code!");
 
                addChild(correct);
                correct.gotoAndPlay(1);
                correct.x = 277;
                correct.y = 135;
 
            }
            else
            {
 
                trace(keyBuffer.join("")+"=="+cheatCode.join(""));
            }
 
            //rest Buffer array in timeout
            type_timeout = setTimeout(reset_cheats,1000);
        }
 
        private function reset_cheats():void
        {
            //clear keyBuffer
            keyBuffer = [];
        }
 
    }
 
}
