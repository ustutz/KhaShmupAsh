package ashKha.tick;
import ash.signals.Signal1;
import ash.tick.ITickProvider;
import kha.Scheduler;

/**
 * ...
 * @author Urs Stutz
 */
class KhaFrameTickProvider implements ITickProvider {

	var timeTaskId:Int;
    var previousTime:Float;
    var maximumFrameTime:Float;
    var signal:Signal1<Float>;

    public var playing(default, null):Bool;

    /**
     * Applies a time adjustment factor to the tick, so you can slow down or speed up the entire engine.
     * The update tick time is multiplied by this value, so a value of 1 will run the engine at the normal rate.
     */
    public var timeAdjustment:Float = 1;
	
	public function new( maximumFrameTime:Float = 9999999999999999.0 ) {
		
        playing = false;
        signal = new Signal1<Float>();
        this.maximumFrameTime = maximumFrameTime;
	}
	
    public function add(listener:Float->Void):Void {
        signal.add(listener);
    }

    public function remove(listener:Float->Void):Void {
        signal.remove(listener);
    }

    public function start():Void {
		
		previousTime = Scheduler.time();
		playing = true;
		timeTaskId = Scheduler.addTimeTask( dispatchTick, 0, 1 / 60 );

	}
    
	public function stop():Void {
		
		playing = false;
		Scheduler.removeTimeTask( timeTaskId );
	}
	
    public function dispatchTick():Void {
		
		var temp:Float = previousTime;
		previousTime = Scheduler.time();
		
		var frameTime:Float = ( previousTime - temp ) / 1000;
		
		if (frameTime > maximumFrameTime)
			frameTime = maximumFrameTime;
		
		signal.dispatch(frameTime * timeAdjustment);
    }
}