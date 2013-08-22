package  
{
	import loom2d.math.Point;
	
	/**
	 * ...
	 * @author RhinoBear Soft.
	 */
	public class PolarPoint 
	{
		public var radius:Number, theta:Number;
		private static var center = new Point(320, 240);
		
		public function PolarPoint(point:Point) 
		{
			var x:Number, y:Number;
			x = point.x - center.x;
			y = point.y - center.y;
			
			if (x > 0) {
				theta = Math.atan(y / x);
				if (y < 0) {
					theta += Math.PI * 2;
				}
			}else if (x < 0) {
				theta = Math.PI + Math.atan(y / x);
			}else {
				theta = y / Math.abs(y) * Math.PI / 2;
			}
			radius = Math.sqrt(x * x + y * y);
		}
		
		override public function toString():String {
			return "(" + radius + "," + theta + ")";
		}
		
		override public function toPoint():Point {
			//Console.print("1.1");
			//var x = Math.cos(theta) * radius;
			//Console.print("1.2");
			//var y = Math.sin(theta) * radius;
			//Console.print("1.3");
			//var pointFromCenter = new Point(Math.cos(theta) * radius, Math.sin(theta) * radius);
			//Console.print("1.4");
			//return pointFromCenter + center;
			return center;
		}
		
		public function compareTo(other:PolarPoint):Number {
			var radiusDifference = this.radius - other.radius;
			if (radiusDifference != 0) {
				return radiusDifference;
			}else {
				if (this.radius == 0) {
					return 0;
				}else {
					return this.theta - other.theta;
				}
			}
		}
		
		public static function compare(first: PolarPoint, second: PolarPoint):Number {
			return first.compareTo(second);
		}
		
		public static function sortVector(v:Vector.<PolarPoint>) {
			v.sort(compare);
		}
	}
}