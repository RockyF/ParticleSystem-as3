/**
 * Created by lenovo on 14-3-7.
 */
package com.tbs.particlesystem {
import flash.display.DisplayObject;

public class Particle {
	public var userData:DisplayObject;
	public var vector:PVector;
	private var _callback:Function;

	public function Particle(vector:PVector, callback:Function) {
		this.vector = vector || new PVector();
		_callback = callback;
	}

	public function update():void{
		vector.update();

		if(userData){
			userData.x = vector.x;
			userData.y = vector.y;
			userData.alpha = vector.alpha;
			userData.rotation = vector.rotation;

			if(userData.parent && (vector.x < 0 || vector.y < 0 || vector.alpha <= 0)){
				vector = null;
				_callback(this);
			}
		}
	}
}
}
