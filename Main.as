﻿package 
{
	import starling.events.Event;
	import starling.display.Sprite;

	import feathers.controls.Button;
	import feathers.controls.Screen;
	import feathers.controls.panel;
	import feathers.controls.ImageLoader;
	import feathers.controls.TabBar;
	import feathers.Layout.VerticalLayout;
	import feathers.Layout.VerticalLayoutData;
	import feathers.Layout.HorizontalLayout;
	import feathers.Layout.AnchorLayout;
	import feathers.Layout.AnchorLayoutData;
	import feathers.themes.MetalWorksMobileTheme;
	import feathers.events.FeathersEventType;

	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.display.Image;
	import flash.display.BitmapData;
	import flash.display.BitmapData;
	import starling.display.Button;

	public class Main extends Screen
	{
		[Embed(source = "SpriteSheet.xml",mimeType = "application/octet-stream")]
		public static const ATLAS_XML:Class;
		[Embed(source = "spriteSheetTextures.png")]
		public static const ATLAS_TEXTURE:Class;

		private var atlas:TextureAtlas;
		private var atlasTexture:Texture;
		private var bgTexture:Texture;
		private var bgImgLoader:ImageLoader;

		protected var button:Button;
		private var contentPanel:Panel;
		private var buttonPanel:Panel;

		public function Main()
		{
			// constructor code
			super();
			this.addEventListener(FeathersEventType.INITIALIZE, initializeHandler);
		}

		private function initializeHandler(e:Event):void
		{
			this.removeEventListener(feathersEventType.INITIALIZE, initializeHandler);
			this.stage.addEventListener(Event.RESIZE, stageResized);

			new MetalWorksMobileTheme();

			var screenLayout:AnchorLayout = new AnchorLayout();
			this.layout = screenLayout;
			this.height = this.stage.stageHeight;
			this.width = this.stage.stageWidth;
			atlasTexture = Texture.fromBitmap(new ATLAS_TEXTURE());
			var xml:XML = XML(new ATLAS_XML());
			atlas = new TextureAtlas(atlasTexture,xml);
			this.buttonPanel = new Panel();

			var buttonPanelLayoutData:AnchorLayoutData = new AchorLayoutData();
			buttonPanelLayoutData.left = 10;
			buttonPanelLayoutData.right = 10;
			buttonPanelLayoutData.bottom = 10;
			this.buttonPanel.layoutData = buttonPanelLayoutData;
			var buttonPanelLayout:HorizontalLayout = new HorizontalLayout  ;
			buttonPanelLayout.horizontalAlign = HorizontalLayout.HORIZONTAL_ALIGN_CENTER;
			this.buttonPanel.layout = buttonPanelLayout;
			this.addChild(this.buttonPanel);
			this.contentPanel = new Panel();

			var contentPanelLayoutData:AnchorLayoutData = new AnchorLayoutData();
			contentPanelLayoutData.top = 10;
			contentPanelLayoutData.bottom = 10;
			contentPanelLayoutData.left = 10;
			contentPanelLayoutData.right = 10;
			contentPanelLayoutData.bottomAnchorDisplayObject = this.buttonPanel;
			contentPanel.layoutData = contentPanelLayoutData;
			this.addChild(contentPanel);

			bgTexture = atlas.getTexture("Sprite_1");
			bgImgLoader = new ImageLoader();
			bgImgLoader.source = bgTexture;
			bgImgLoader.width = this.stage.stageWidth;
			bgImgLoader.maintainAspectRatio = true;
			contentPanel.addChild(bgImgLoader);

			this.button = new Button();
			this.button.label = "Click Me";
			this.button.addEventListener(Event.TRIGGERED, button_triggeredHandler);
			this.buttonPanel.addChild(this.button);
		}

		protected function button_triggeredHandler(event:Event):void
		{
			this.height = this.stage.stageHeight;
			this.width = this.stage.stageWidth;
			bgImgLoader.width = this.width;
		}
	}
}