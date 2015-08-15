package {
	import alternativa.engine3d.containers.DistanceSortContainer;
	import alternativa.engine3d.materials.FillMaterial;
	import alternativa.engine3d.primitives.Box;
	public class Axes extends DistanceSortContainer {
		public function Axes(scale:Number = 1) {
			if (scale != 1) {
				this.scale = scale;
			}
			
			var xaxis:Box = new Box(50, 5, 5);
			xaxis.x = 25;
			xaxis.setMaterialToAllFaces(new FillMaterial(0xff0000));
			addChild(xaxis);
			var yaxis:Box = new Box(5, 50, 5);
			yaxis.y = 25;
			yaxis.setMaterialToAllFaces(new FillMaterial(0x0000ff));
			addChild(yaxis);
			var zaxis:Box = new Box(5, 5, 50);
			zaxis.z = 25;
			zaxis.setMaterialToAllFaces(new FillMaterial(0x00ff00));
			addChild(zaxis);
		}
		
		public function set scale(value:Number):void {
			scaleX = scaleY = scaleZ = value;
		}
	}
}