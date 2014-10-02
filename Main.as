package  
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

		public function Main() 
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
			
		}

	}
	
}
