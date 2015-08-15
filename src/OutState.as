package {
	import alternativa.engine3d.core.Camera3D;
	import com.greensock.TweenLite;
	public class OutState implements IRotationState {
		private var subject:RotateController;
		private var camera:Camera3D;
		public function OutState(subject:RotateController, camera:Camera3D) {
			this.camera = camera;
			this.subject = subject;
		}
		
		public function gotoFront():void {
			subject.state = subject.transitionState;
			TweenLite.to(camera, .5, { z:0, y:500, overwrite:false, onUpdate:lookAtZero } );
			TweenLite.to(camera, .5, { x:0, delay:.5, overwrite:false, onUpdate:lookAtZero, onComplete:gotoFront_CompleteHandler } );
		}
		
		private function gotoFront_CompleteHandler():void {
			subject.state = subject.frontState;
		}
		
		public function gotoTop():void {
			subject.state = subject.transitionState;
			TweenLite.to(camera, .5, { z:500, overwrite:false, onUpdate:lookAtZero } );
			TweenLite.to(camera, .5, { y:0, delay:.5, overwrite:false, onUpdate:lookAtZero } );
			TweenLite.to(camera, .5, { x:0, delay:1, overwrite:false, onUpdate:lookAtZero, onComplete:gotoTop_CompleteHandler } );
		}
		
		private function gotoTop_CompleteHandler():void {
			subject.state = subject.topState;
		}
		
		public function gotoLeft():void {
			subject.state = subject.transitionState;
			TweenLite.to(camera, .5, { z:0, x:500, overwrite:false, onUpdate:lookAtZero } );
			TweenLite.to(camera, .5, { y:0, delay:.5, overwrite:false, onUpdate:lookAtZero, onComplete:gotoLeft_CompleteHandler } );
		}
		
		private function gotoLeft_CompleteHandler():void {
			subject.state = subject.leftState;
		}
		
		public function gotoOut():void {
			
		}
		
		private function lookAtZero():void {
			camera.lookAt(0, 0, 0);
		}
	}
}