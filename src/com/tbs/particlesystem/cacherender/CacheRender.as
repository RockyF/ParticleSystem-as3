/**
 * Created by RockyF on 14-3-8.
 */
package com.tbs.particlesystem.cacherender {
import com.tbs.particlesystem.IParticleStage;
import com.tbs.particlesystem.Particle;
import com.tbs.particlesystem.shaperender.Ball;
import com.tbs.utils.TbsLoader;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.BlendMode;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.ColorTransform;
import flash.geom.Matrix;

public class CacheRender extends Sprite implements IParticleStage {
	private static const R:Number = 60;

	private var _container:Bitmap;
	private var _bmpdShow:BitmapData;
	private var _bmpdCache:BitmapData;

	private var icon:BitmapData;
	public var oldParticles:Array;
	public var particles:Array;
	private var matrix:Matrix = new Matrix();
	private var ct:ColorTransform = new ColorTransform();

	public function CacheRender() {
		addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
	}

	private function onAddToStage(event:Event):void{
		stage.addEventListener(Event.RESIZE, onResize);

		oldParticles = [];
		particles = [];

		TbsLoader.addFlag = true;
		TbsLoader.loadImage("assets/icon.png", function(bmpd:BitmapData):void{
			var b:Ball = new Ball(R);
			icon = new BitmapData(b.width, b.height, true, 0xFFFFFF);
			matrix.createBox(1, 1, 0, b.width / 2, b.height / 2);
			icon.draw(b, matrix);

			addChild(_container = new Bitmap());
			onResize();

			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		});
	}

	private function onResize(event:Event = null):void{
		_bmpdCache = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0x0);
		_bmpdShow = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0x0);
		_container.bitmapData = _bmpdShow;
	}

	private function onEnterFrame(event:Event):void {
		make(5);
		update();
	}

	private function make(count:int = 1):void {
		for (var i:int = 0; i < count; i++) {
			var particle:Particle;
			if(oldParticles.length > 0){
				particle = oldParticles.shift();
			}else{
				particle = Particle.create();
			}
			particle.init(mouseX, Math.random() * 2 - 1, mouseY, Math.random() * 2 - 1, 1, -Math.random() * 0.05 - 0.05);
			particles.push(particle);
		}
	}

	public function update():void {
		_bmpdCache.fillRect(_bmpdCache.rect, 0xFFFFFF);
		for each (var particle:Particle in particles) {
			particle.update();
			render(particle);
		}
		_bmpdShow.fillRect(_bmpdShow.rect, 0xFFFFFF);
		_bmpdShow.draw(_bmpdCache);
	}

	public function render(particle:Particle):void {
		matrix.createBox(1, 1, particle.rotation, particle.x - R, particle.y - R);
		ct.alphaMultiplier = particle.alpha;

		_bmpdCache.draw(icon, matrix, ct, BlendMode.ADD, null, true);

		if(particle.x < 0 || particle.y < 0 || particle.alpha <= 0){
			dispose(particle);
		}
	}

	private function dispose(particle:Particle):void {
		var index:int = particles.indexOf(particle);
		if (index >= 0) {
			oldParticles.push(particle);
			particles.splice(index, 1);
			particle = null;
		}
	}
}
}
