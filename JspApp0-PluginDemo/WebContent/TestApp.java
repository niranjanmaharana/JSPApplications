import java.applet.Applet;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;

public class TestApp extends Applet {

	@Override
	public void paint(Graphics g) {
		setBackground(Color.GREEN);
		setFont(new Font("arial",Font.BOLD,20));
		g.drawString("Welcome to Applet",300,400);
	}
	
}
