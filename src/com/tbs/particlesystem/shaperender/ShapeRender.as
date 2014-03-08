/**
 * Created by RockyF on 14-3-8.
 */
package com.tbs.particlesystem.shaperender {
import com.tbs.particlesystem.IParticleStage;
import com.tbs.particlesystem.Particle;

import flash.display.BlendMode;
import flash.display.DisplayObject;

import flash.display.Sprite;
import flash.events.Event;

public class ShapeRender extends Sprite implements IParticleStage {
	public var oldParticles:Array;
	public var particles:Array;

	public function ShapeRender() {

		addEventListener(Event.ENTER_FRAME, onEnterFrame);

		oldParticles = [];
		particles = [];
	}

	public function update():void {
		var particle:Particle;
		for each (particle in particles) {
			particle.update();
			render(particle);
		}
	}

	public function render(particle:Particle):void {
		var userData:DisplayObject = particle.userData as DisplayObject;
		userData.x = particle.x;
		userData.y = particle.y;
		userData.alpha = particle.alpha;
		userData.rotation = particle.rotation;

		if(userData.parent && (particle.x < 0 || particle.y < 0 || particle.alpha <= 0)){
			dispose(particle);
		}
	}

	private function onEnterFrame(event:Event):void {
		make(5);
		update();
		trace(particles.length, oldParticles.length);
	}

	private function make(count:int = 1):void {
		for (var i:int = 0; i < count; i++) {
			var particle:Particle;
			if(oldParticles.length > 0){
				particle = oldParticles.shift();
			}else{
				particle = Particle.create();
				particle.userData = new Ball(60);
				particle.userData.blendMode = BlendMode.ADD;
			}
			particle.init(mouseX, Math.random() * 2 - 1, mouseY, Math.random() * 2 - 1, 1, -Math.random() * 0.1 - 0.05);
			addChild(particle.userData as DisplayObject);
			particles.push(particle);
		}
	}

	private function dispose(particle:Particle):void {
		var index:int = particles.indexOf(particle);
		if (index >= 0) {
			oldParticles.push(particle);
			particles.splice(index, 1);
			removeChild(particle.userData as DisplayObject);
			particle = null;
		}
	}
}
}
