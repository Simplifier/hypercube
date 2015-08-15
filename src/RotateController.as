package {
	import alternativa.engine3d.core.Camera3D;
	import alternativa.engine3d.core.MouseEvent3D;
	import alternativa.engine3d.core.Object3D;
	import alternativa.engine3d.core.Object3DContainer;
	import alternativa.engine3d.core.View;
	import alternativa.engine3d.primitives.Plane;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Point;
	public class RotateController {
		private var _state:IRotationState;
		private var _frontState:IRotationState;
		private var _topState:IRotationState;
		private var _leftState:IRotationState;
		private var _outState:IRotationState;
		private var _transitionState:IRotationState;
		
		private var camera:Camera3D;
		private var view:View;
		private var mouseSpeed2:Number;
		private var lastMousePoint:Point = new Point;
		private var cube:Cube;
		public function RotateController(camera:Camera3D, cube:Cube, stage:Stage, rootContainer:Object3DContainer) {
			this.cube = cube;
			this.camera = camera;
			view = camera.view;
			
			_frontState = new FrontState(this, camera);
			_topState = new TopState(this, camera);
			_leftState = new LeftState(this, camera);
			_outState = new OutState(this, camera);
			_transitionState = new TransitionState;
			_state = outState;
			
			//cube.front.addEventListener(MouseEvent3D.ROLL_OVER, front_clickHandler);
			//cube.left.addEventListener(MouseEvent3D.ROLL_OVER, left_clickHandler);
			//cube.top.addEventListener(MouseEvent3D.ROLL_OVER, top_clickHandler);
			//cube.addEventListener(MouseEvent3D.ROLL_OUT, stage_clickHandler);
			view.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		private function enterFrameHandler(e:Event):void {
			if ((view.mouseX != lastMousePoint.x) || (view.mouseY != lastMousePoint.y)) {
				mouseSpeed2 = (view.mouseX - lastMousePoint.x) * (view.mouseX - lastMousePoint.x) + (view.mouseY - lastMousePoint.y) * (view.mouseY - lastMousePoint.y);
				lastMousePoint.x = view.mouseX;
				lastMousePoint.y = view.mouseY;
			}else {
				mouseSpeed2 = 0;
				
				var objects:Array = view.getObjectsUnderPoint(new Point(view.mouseX, view.mouseY));
				var object:Object3D = objects[objects.length - 1];
				
				if (!(object is Plane)) {
					state.gotoOut();
					return;
				}
				
				switch(object) {
					case cube.front:
						state.gotoFront();
						break;
						
					case cube.left:
						state.gotoLeft();
						break;
						
					case cube.top:
						state.gotoTop();
						break;
				}
			}
		}
		
		private function stage_clickHandler(e:MouseEvent3D):void {
			state.gotoOut();
		}
		
		private function front_clickHandler(e:MouseEvent3D):void {
			state.gotoFront();
		}
		
		private function left_clickHandler(e:MouseEvent3D):void {
			state.gotoLeft();
		}
		
		private function top_clickHandler(e:MouseEvent3D):void {
			state.gotoTop();
		}
		
		public function get state():IRotationState {
			return _state;
		}
		
		public function set state(value:IRotationState):void {
			_state = value;
		}
		
		public function get frontState():IRotationState {
			return _frontState;
		}
		
		public function get topState():IRotationState {
			return _topState;
		}
		
		public function get leftState():IRotationState {
			return _leftState;
		}
		
		public function get outState():IRotationState {
			return _outState;
		}
		
		public function get transitionState():IRotationState {
			return _transitionState;
		}
	}
}