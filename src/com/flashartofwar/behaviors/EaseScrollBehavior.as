package com.flashartofwar.behaviors {
    import flash.events.EventDispatcher;
    import flash.utils.Timer;
    import flash.utils.getTimer;

    public class EaseScrollBehavior extends EventDispatcher {

    public var targetX:Number;
    private var target:Object;
        
    public function EaseScrollBehavior(target:Object, targetX:Number = 0) {

        if (!target.hasOwnProperty("scrollX")) {
            throw new Error("Supplied target does not have a scrollX property.");
        }
        else
        {
            this.target = target;
            targetX = targetX;
        }

    }

    public function calculateScrollX():void
    {

        if ((target.scrollX == targetX))
        {
            return;
        }
        else
        {
            //t: current time, b: beginning value, c: change in position, d: duration
            var c:Number = targetX - target.scrollX;
            var b:Number = target.scrollX;
            target.scrollX = quadEaseIn(b, c);

            if (c < .01 && c > -.01)
            {
                target.scrollX = targetX;
            }
        }


    }

    /**
     * t: current time, b: beginning value, c: change in position, d: duration
     * @param t - current time
     * @param b - beginning value
     * @param c - change in position
     * @param d - duration
     * @return
     *
     */
    public static function quadEaseIn(b:Number, c:Number):Number
    {
        return c * 25.0/256.0 + b;
    }

    public static function easeNone (t:Number, b:Number, c:Number, d:Number):Number {
		return c*t/d + b;
	}
}
}
