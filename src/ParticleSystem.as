package {

import com.tbs.particlesystem.cacherender.CacheRender;
import com.tbs.particlesystem.shaperender.ShapeRender;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

[SWF(backgroundColor=0x0)]
public class ParticleSystem extends Sprite {
	public function ParticleSystem() {
		addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
	}

	private function onAddToStage(event:Event):void {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;

		addChild(new ShapeRender());
		//addChild(new CacheRender());
	}
}
}
