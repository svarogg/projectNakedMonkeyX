package
{
    import loom.Application;
    import loom2d.display.StageScaleMode;
    import loom2d.display.Image;
    import loom2d.textures.Texture;
    import loom2d.ui.SimpleLabel;
	import loom2d.math.Point;
	import loom2d.events.TouchEvent;
	import loom2d.events.Touch;
	import loom2d.display.Quad;
	import loom2d.events.TouchPhase;

    public class ProjectNakedMonkeyX extends Application
    {
		private var label:SimpleLabel;
		private var cubicSpline:CubicSpline;
		private var pointLabels:Vector.<SimpleLabel>;
		
		private function init() {
			cubicSpline = new CubicSpline(new Vector.<Point>());
			pointLabels = new Vector.<SimpleLabel>();
		}
		
        override public function run():void
        {
			init();
			
            // Comment out this line to turn off automatic scaling.
            stage.scaleMode = StageScaleMode.LETTERBOX;

            // Setup anything else, like UI, or game objects.
            var bg = new Image(Texture.fromAsset("assets/bg.png"));
            bg.width = stage.stageWidth;
            bg.height = stage.stageHeight;
            stage.addChild(bg);
			
			label = new SimpleLabel("assets/Curse-hd.fnt");
			label.scale = 0.5;
			label.text = "Coords will be here!";
			label.x = 5;
			label.y = 5;
			stage.addChild(label);
			
			var center = new Quad(3, 3, 0xFF0000, false);
			center.x = stage.stageWidth / 2;
			center.y = stage.stageHeight / 2;
			stage.addChild(center);
			
			stage.addEventListener(TouchEvent.TOUCH, updateCoords);
            
            //var sprite = new Image(Texture.fromAsset("assets/logo.png"));
            //sprite.center();
            //sprite.x = stage.stageWidth / 2;
            //sprite.y = stage.stageHeight / 2 + 50;
            //stage.addChild(sprite);

            //var label = new SimpleLabel("assets/Curse-hd.fnt");
            //label.text = "Hello Loom!";
            //label.center();
            //label.x = stage.stageWidth / 2;
            //label.y = stage.stageHeight / 2 - 100;
            //stage.addChild(label);
        }
		
		private function drawCubicSpline(cubicSpline:CubicSpline) {
			var i:Number;
			Console.print(1);
			for (i in pointLabels) {
				stage.removeChild(pointLabels[i]);
			}
			Console.print(2);
			pointLabels = new Vector.<SimpleLabel>();
			Console.print(3);
			
			for (i in cubicSpline.points) {
				Console.print(4);
				var label = new SimpleLabel("assets/Curse-hd.fnt");
				Console.print(5);
				label.text = i.toString();
				Console.print(6);
				label.center();
				Console.print(7);
				Console.print("length is " + cubicSpline.points.length);
				Console.print("i is " + i);
				Console.print(cubicSpline.points[i]);
				Console.print(cubicSpline.points[i][i].getType().getFullName());
				//var point = cubicSpline.points[i].toPoint();
				//Console.print(8);
				//label.x = point.x;
				//label.x = point.x;
				//Console.print(9);
				//label.y = point.y;
				//Console.print(10);
				//stage.addChild(label);
				//Console.print(11);
				//pointLabels.push(label);
				//Console.print(12);
			}
		}
		
		public function updateCoords(event:TouchEvent):void {
			var touch = event.touches[0];
			if (touch.phase != TouchPhase.ENDED) {
				return;
			}
			cubicSpline.addPoint(new Point(touch.globalX, touch.globalY));
			drawCubicSpline(cubicSpline);
        }
    }
}