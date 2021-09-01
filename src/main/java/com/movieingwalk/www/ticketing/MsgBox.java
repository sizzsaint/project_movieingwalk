package com.movieingwalk.www.ticketing;


import java.awt.*;
import java.awt.event.*;

import javax.swing.BoxLayout;
import javax.swing.JFrame;
import javax.swing.JPanel;

class MsgBox extends Dialog implements ActionListener 	//���̾�α׷� ��ӹ��� �޽��� �ڽ��� ���Ǹ����ʸ� �߰��ϴ� Ŭ����
{
	boolean id = false;				//id���� �������� ����
	Button ok,can;					//��ư
	JFrame parent;
	MsgBox(JFrame frame, String movieName,String ticketNum,String msg,String seats, boolean okcan,JFrame parent)
	{
		super(frame, "Message", true);		//Message�� ������ ����
		this.parent = parent;
		
		Container panel = frame.getContentPane();
		panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
		if(movieName!=null) panel.add(new Label(movieName));
		if(ticketNum!=null) panel.add(new Label(ticketNum));
		if(seats!=null) panel.add(new Label(seats));
		panel.add(new Label(msg));
		add(panel);
		addOKCancelPanel(okcan);
		createFrame();						//������ ����
		pack();
		setVisible(true);
	}

	void addOKCancelPanel( boolean okcan ) 
	{
		Panel p = new Panel();				//�г� ����
		p.setLayout(new FlowLayout());
		createOKButton( p );				//��ư ����
		if (okcan == true)
			createCancelButton( p );
		add("South",p);
	}

	void createOKButton(Panel p) 
	{
		p.add(ok = new Button("OK"));		//�ʱ�ȭ�� ������ ����
		ok.addActionListener(this); 
	}

	void createCancelButton(Panel p) 
	{
		p.add(can = new Button("Cancel"));
		can.addActionListener(this);
	}

	void createFrame() 
	{
		Dimension d = getToolkit().getScreenSize();		//������ ������ ����
		setLocation(d.width/3,d.height/3);
	}

	public void actionPerformed(ActionEvent ae)
	{
		if(ae.getSource() == ok) 					//��ư Ŭ���� ���� �׼� ����
		{
			id = true;
			if(parent!=null) parent.dispose();
			new MainFrame().show();
			setVisible(false);
		}
		else if(ae.getSource() == can) 
		{
			setVisible(false);
		}
	}
}






