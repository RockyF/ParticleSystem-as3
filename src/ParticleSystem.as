package {

import com.tbs.particlesystem.Ball;
import com.tbs.particlesystem.PVector;
import com.tbs.particlesystem.Particle;

import flash.display.BlendMode;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.filters.BlurFilter;

[SWF(backgroundColor=0x0)]
public class ParticleSystem extends Sprite {
	public var particles:Array;

	public function ParticleSystem() {
		addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
	}

	private function onAddToStage(event:Event):void {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;

		addEventListener(Event.ENTER_FRAME, onEnterFrame);

		particles = [];
	}

	private function onEnterFrame(event:Event):void {
		make(5);
		var particle:Particle;
		for each (particle in particles) {
			particle.update();
		}
	}

	private function make(count:int = 1):void {
		for (var i:int = 0; i < count; i++) {
			var particle:Particle;
			particle = new Particle(PVector.create(mouseX, Math.random() * 2 - 1, mouseY, 0, 1, -Math.random() * 0.5 - 0.1), onDispose);
			particle.userData = new Ball();
			particle.userData.blendMode = BlendMode.ADD;
			addChild(particle.userData);
			particles.push(particle);
		}
	}

	private function onDispose(particle:Particle):void {
		var index:int = particles.indexOf(particle);
		if (index >= 0) {
			particles.splice(index, 1);
			removeChild(particle.userData);
		}
	}
}
}
