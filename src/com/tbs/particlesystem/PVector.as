/**
 * Created by lenovo on 14-3-7.
 */
package com.tbs.particlesystem {
public class PVector {
	public static function create(x:int, vx:Number, y:int, vy:Number, alpha:Number = 1, vAlpha:Number = 0, rotation:int = 0, vRotation:Number = 0):PVector{
		var v:PVector = new PVector();

		v.init(x, vx, y, vy, alpha, vAlpha, rotation, vRotation);

		return v;
	}

	public var x:Number;
	public var y:Number;
	public var alpha:Number;
	public var rotation:Number;

	public var vx:Number;
	public var vy:Number;
	public var vAlpha:Number;
	public var vRotation:Number;

	public function PVector() {
	}

	public function init(x:int, vx:Number, y:int, vy:Number, alpha:Number, vAlpha:Number, rotation:int, vRotation:Number):void{
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
