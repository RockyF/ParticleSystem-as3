/**
 * Created by lenovo on 14-3-7.
 */
package com.tbs.particlesystem.shaperender {
import flash.display.GradientType;
import flash.display.Shape;
import flash.geom.Matrix;

public class Ball extends Shape {
	private static var matrix:Matrix;
	public function Ball(R:int = 10) {
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
