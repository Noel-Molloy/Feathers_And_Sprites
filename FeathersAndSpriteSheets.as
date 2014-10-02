﻿package  
{
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	
	import feathers.system.DeviceCapabilities;
	
	
	public class FeathersAndSpriteSheets extends Sprite 
	{
		private var starling:Starling;
		
		public function FeathersAndSpriteSheets() 
		{
			// constructor code
			this.stage.align = StageAlign.TOP_LEFT;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			
			/*remember to comment out*/
			DeviceCapabilities.dpi = 432;
			DeviceCapabilities.screenPixelWidth = 1080;
			DeviceCapabilities.screenPixelHeight = 1920;
			
			this.stage.addEventListener(Event.RESIZE, stageResized);
			
			starling.handleLostContext = true;
			starling = new Starling(main,this.stage);
			starling.start();
		}
		
		private function stageResized(e:Event):void
		{
			starling.stage.stageWidth = this.stage.stageWidth;
			starling.stage.stageHeight = this.stage.stageHeight;
			const viewPort:Rectangle = starling.viewPort;
			viewPort.width = this.stage.stageWidth;
			viewPort.height = this.stage.stageHeight;
			starling.viewPort = viewPort;
		}
	}
	
}