package {
	import alternativa.engine3d.containers.DistanceSortContainer;
	import alternativa.engine3d.materials.Material;
	import alternativa.engine3d.primitives.Plane;
	public class Cube extends DistanceSortContainer {
		private var _left:Plane;
		private var _right:Plane;
		private var _top:Plane;
		private var _bottom:Plane;
		private var _front:Plane;
		private var _back:Plane;
		public function Cube(width:Number = 100, length:Number = 100, height:Number = 100, material:Material = null) {
			_left = new Plane(width, height, 1, 1, true, false, false, material, material);
			left.name = 'left';
			left.x = width / 2;
			left.rotationY = Math.PI / 2;
			addChild(left);
			
			_right = left.clone() as Plane;
			right.name = 'right';
			right.x = -width / 2;
			right.rotationY = Math.PI / 2;
			addChild(right);
			
			_top = new Plane(width, length, 1, 1, true, false, false, material, material);
			top.name = 'top';
			top.z = height / 2;
			addChild(top);
			
			_bottom = top.clone() as Plane;
			bottom.name = 'bottom';
			bottom.z = -height / 2;
			addChild(bottom);
			
			_front = new Plane(length, height, 1, 1, true, false, false, material, material);
			front.name = 'front';
			front.y = length / 2;
			front.rotationX = Math.PI / 2;
			addChild(front);
			
			_back = front.clone() as Plane;
			back.name = 'back';
			back.y = -length / 2;
			back.rotationX = Math.PI / 2;
			addChild(back);
		}
		
		public function get left():Plane {
			return _left;
		}
		
		public function get right():Plane {
			return _right;
		}
		
		public function get top():Plane {
			return _top;
		}
		
		public function get bottom():Plane {
			return _bottom;
		}
		
		public function get front():Plane {
			return _front;
		}
		
		public function get back():Plane {
			return _back;
		}
	}
}