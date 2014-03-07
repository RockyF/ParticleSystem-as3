/**
 * Created by RockyF on 14-3-7.
 */
package com.tbs.particlesystem {
public interface IParticleStage {
	function update():void;
	function render(particle:Particle):void;
}
}
