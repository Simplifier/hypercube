package {
	import alternativa.engine3d.controllers.SimpleObjectController;
	import alternativa.engine3d.core.Camera3D;
	import alternativa.engine3d.core.Debug;
	import alternativa.engine3d.core.Light3D;
	import alternativa.engine3d.core.Object3DContainer;
	import alternativa.engine3d.core.View;
	import alternativa.engine3d.lights.AmbientLight;
	import alternativa.engine3d.lights.DirectionalLight;
	import alternativa.engine3d.lights.OmniLight;
	import alternativa.engine3d.materials.FlatShadingMaterial;
	import alternativa.engine3d.materials.VertexLightMaterial;
	import alternativa.engine3d.primitives.Plane;
	import com.greensock.loading.core.LoaderItem;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Alex
	 */
	public class Hypercube extends Sprite {
		private var rootContainer:Object3DContainer = new Object3DContainer;
		private var camera:Camera3D = new Camera3D;
		private var controller:SimpleObjectController;
		
		private var cube:Cube;
		private var rotationController:RotateController;
		
		public function Hypercube() {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			//var light:AmbientLight = new AmbientLight(0x111111);
			var ambientLight:AmbientLight = new AmbientLight(0xffffff);
			ambientLight.intensity = .4;
			rootContainer.addChild(ambientLight);
			var omni:OmniLight = new OmniLight(0xffffff, 300, 550);
			omni.intensity = .6;
			omni.x = 230;
			omni.y = 200;
			omni.z = 290;
			rootContainer.addChild(omni);
			var directionalLight:DirectionalLight = new DirectionalLight(0xFFFFAA);
			directionalLight.y = 200;
			directionalLight.z = 400;
			directionalLight.lookAt(0, 0, 0);
			//directionalLight.rotationX = -130*Math.PI/180;
			//directionalLight.rotationZ = -90*Math.PI/180;
			//rootContainer.addChild(directionalLight);
			
			camera.x = 400;
			camera.y = 400;
			camera.z = 300;
			camera.lookAt(0, 0, 0);
			camera.addToDebug(Debug.LIGHTS, Light3D);
			camera.debug = true;
			camera.view = new View(stage.stageWidth, stage.stageHeight);
			controller = new SimpleObjectController(stage, camera, 200);
			addChild(camera.view);
			addChild(camera.diagram);
			rootContainer.addChild(camera);
			
			cube = new Cube(300, 300, 300, new FlatShadingMaterial(new BitmapData(100, 100, false, 0x555555), true));
			cube.left.setMaterialToAllFaces(new VertexLightMaterial(new BitmapData(100, 100, false, 0x0953f6), true));
			cube.left.calculateVerticesNormals();
			cube.front.setMaterialToAllFaces(new VertexLightMaterial(new BitmapData(100, 100, false, 0xff5500), true));
			cube.front.calculateVerticesNormals();
			cube.top.setMaterialToAllFaces(new VertexLightMaterial(new BitmapData(100, 100, false, 0x477400), true));
			cube.top.calculateVerticesNormals();
			rootContainer.addChild(cube);
			//rootContainer.addChild(new Axes);
			rotationController = new RotateController(camera, cube, stage, rootContainer);
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void {
			//controller.update();
			camera.render();
		}
	}
}