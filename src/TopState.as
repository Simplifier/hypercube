package {
	import alternativa.engine3d.core.Camera3D;
	import com.greensock.TweenLite;
	public class TopState implements IRotationState {
		private var subject:RotateController;
		private var camera:Camera3D;
		public function TopState(subject:RotateController, camera:Camera3D) {
			this.camera = camera;
			this.subject = subject;
		}
		
		public function gotoFront():void {
			
		}
		
		public function gotoTop():void {
			
		}
		
		public function gotoLeft():void {
			
		}
		public function gotoOut():void {
			subject.state = subject.transitionState;
			TweenLite.to(camera, .5, { x:400, overwrite:false, onUpdate:lookAtZero } );
			TweenLite.to(camera, .5, { y:400, delay:.5, overwrite:false, onUpdate:lookAtZero } );
			TweenLite.to(camera, .5, { z:300, delay:1, overwrite:false, onUpdate:lookAtZero, onComplete:gotoOut_CompleteHandler } );
		}
		
		private function gotoOut_CompleteHandler():void {
			subject.state = subject.outState;
		}
		
		private function lookAtZero():void {
			camera.lookAt(0, 0, 0);
		}
	}
}