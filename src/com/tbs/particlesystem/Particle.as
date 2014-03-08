/**
 * Created by lenovo on 14-3-7.
 */
package com.tbs.particlesystem {

public class Particle {
	public static function create(x:int = 0, vx:Number = 0, y:int = 0, vy:Number = 0, alpha:Number = 1, vAlpha:Number = 0, rotation:int = 0, vRotation:Number = 0):Particle{
		var particle:Particle = new Particle();
		particle.x = x;
		particle.vx = vx;
		particle.y = y;
		particle.vy = vy;
		particle.alpha = alpha;
		particle.vAlpha = vAlpha;
		particle.rotation = rotation;
		particle.vRotation = vRotation;

		particle.init(x, vx, y, vy, alpha, vAlpha, rotation, vRotation);

		return particle;
	}

	public var userData:Object;

	public var x:Number;
	public var y:Number;
	public var alpha:Number;
	public var rotation:Number;

	public var vx:Number;
	public var vy:Number;
	public var vAlpha:Number;
	public var vRotation:Number;

	public function Particle() {

	}

	public function init(x:int, vx:Number, y:int, vy:Number, alpha:Number = 1, vAlpha:Number = 0, rotation:int = 0, vRotation:Number = 0):void{
		this.x = x;
		this.vx = vx;
		this.y = y;
		this.vy = vy;
		this.alpha = alpha;
		this.vAlpha = vAlpha;
		this.rotation = rotation;
		this.vRotation = vRotation;
	}

	public function update():void{
		vy += World.gravity;
		x += vx;
		y += vy;
		alpha += vAlpha;
		if(alpha <= 0){
			alpha = 0;
		}else if(alpha >= 1){
			alpha = 1;
		}
		rotation += vRotation;
	}
}
}
