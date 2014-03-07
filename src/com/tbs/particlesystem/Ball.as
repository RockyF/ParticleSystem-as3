/**
 * Created by lenovo on 14-3-7.
 */
package com.tbs.particlesystem {
import flash.display.GradientType;
import flash.display.Shape;
import flash.geom.Matrix;

public class Ball extends Shape {
	private static var matrix:Matrix;
	private static const R:Number = 10;

	public function Ball() {
		if(!matrix){
			matrix = new Matrix();
			matrix.createGradientBox(R * 2, R * 2, 0, -R, -R);
		}
		graphics.beginGradientFill(GradientType.RADIAL, [0xFFC600, 0], [1, 0], [0, 255], matrix);
		graphics.drawCircle(0, 0, R);
		graphics.endFill();
	}
}
}
