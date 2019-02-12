private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
	size(1280,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(229, 247, 255); 
	for (int i = 128; i < width; i += 256) {
		drawTree(i, 480, color(0, (int)(Math.random() * 100) + 100, 0));
	}
} 
public void drawBranches(double x, double y, double branchLength, double angle, color c) 
{   
	if (branchLength < smallestBranch)
		return;
	ArrayList <double[]> endPoints = new ArrayList();
	int branches = (int)(Math.random() * 3) + 1;
	for (int i = 0; i < branches; i++) {
		double endBranchLength;
		if (Math.random() > 0.05)
			endBranchLength = branchLength * ((Math.random() * 0.4 + 0.6));
		else
			endBranchLength = 0;
		double endAngle = angle + ((Math.random() * 0.15) - 0.3);
		double endX;
		if (Math.random() > 0.5)
			endX = (int)(endBranchLength * Math.cos(endAngle) + x);
		else
			endX = (int)(endBranchLength * -Math.cos(endAngle) + x);
		double endY = (int)(endBranchLength * Math.sin(endAngle) + y);
		double[] tempArray = new double[4];
		tempArray[0] = endX;
		tempArray[1] = endY;
		tempArray[2] = endBranchLength;
		tempArray[3] = endAngle;
		endPoints.add(tempArray);
	}
	for (double[] temp : endPoints) {
		stroke(c);
		strokeWeight((float)branchLength / 10);
		line((float)x, (float)y, (float)temp[0], (float)temp[1]);
		drawBranches(temp[0], temp[1], temp[2], temp[3], c);
	}
} 
public void drawTree(int x, int y, color c){
	stroke(c);
	strokeWeight(10); 
	int randomTrunkHeight = (int)(Math.random() * 51) + 50;
	line(x, y, x, y - randomTrunkHeight);   
	drawBranches(x, y - randomTrunkHeight, 100, 3*Math.PI/2, c);
}