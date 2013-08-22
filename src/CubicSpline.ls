package  
{
	
	import loom2d.math.Point;
	/**
	 * ...
	 * @author RhinoBear Soft.
	 * Holds a list of Points, and lets draw the spline of those points
	 */
	public class CubicSpline 
	{
		public var points: Vector.<PolarPoint>;
		
		public function CubicSpline(points: Vector.<Point>)
		{
			this.points = new Vector.<PolarPoint>();
			for (var i in points) {
				var point = points[i];
				this.points.push(new PolarPoint(point));
			}
			PolarPoint.sortVector(points);
		}
		
		public function addPoint(point:Point) {
			var polarPoint = new PolarPoint(point);
			var i:Number;
			for (i = 0; i < points.length && polarPoint.compareTo(points[i]) < 0; i++) ;
			
			var polarPointsVector = new Vector.<PolarPoint>();
			polarPointsVector.push(polarPoint);
			points.splice(i, 0, polarPointsVector);
		}
	}	
}