/**
 * Created by RockyF on 14-3-8.
 */
package com.tbs.particlesystem.cacherender {
import com.tbs.particlesystem.IParticleStage;
import com.tbs.particlesystem.Particle;

import flash.display.GradientType;

import flash.display.Shape;
import flash.events.Event;
import flash.geom.Matrix;

public class CacheRender extends Shape implements IParticleStage {
	private static const R:Number = 10;

	public var particles:Array;
	private var matrix:Matrix = new Matrix();

	public function CacheRender() {

		addEventListener(Event.ENTER_FRAME, onEnterFrame);

		particles = [];
	}

	private function onEnterFrame(event:Event):void {
		make(1);
		update();
		trace(particles.length);
	}

	private function make(count:int = 1):void {
		for (var i:int = 0; i < count; i++) {
			var particle:Particle;
			particle = Particle.create(mouseX, Math.random() * 2 - 1, mouseY, Math.random() * 2 - 3, 1, -Math.random() * 0.5 - 0.1);
			particles.push(particle);
		}
	}

	public function update():void {
		for each (var particle:Particle in particles) {
			particle.update();
			render(particle);
		}
	}

	public function render(particle:Particle):void {
		trace(particle.x, particle.y, particle.alpha);
		matrix.createGradientBox(R * 2, R * 2, particle.rotation, -R, -R);

		graphics.beginGradientFill(GradientType.RADIAL, [0xFFC600, 0], [1, 0], [0, 255], matrix);
		graphics.drawCircle(particle.x, particle.y, R);

		if(particle.x < 0 || particle.y < 0 || particle.alpha <= 0){
			dispose(particle);
		}
	}

	private function dispose(particle:Particle):void {
		var index:int = particles.indexOf(particle);
		if (index >= 0) {
			particles.splice(index, 1);
			particle = null;
		}
	}
}
}
