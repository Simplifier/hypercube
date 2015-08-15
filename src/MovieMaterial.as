package {
	import alternativa.engine3d.materials.TextureMaterial;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * Material enable use MovieClip as a texture
	 * Материал, позволяющий использовать MovieClip
	 * в качестве текстуры.
	 */
	public class MovieMaterial extends TextureMaterial {
		protected var mc:Sprite;
		protected var bd:BitmapData;
		
		public function MovieMaterial(clip:Sprite) {
			mc = clip;
			bd = new BitmapData(mc.width, mc.height, true);
			
			super(bd);
			
			mc.addEventListener(Event.ENTER_FRAME, updateTexture);
		}
		
		protected function updateTexture(e:Event):void {
			bd.fillRect(bd.rect, 0);
			bd.draw(mc);
		}
	}
}