package com.movieingwalk.www.ticketing;

import java.awt.BorderLayout;
import java.awt.Choice;
import java.awt.Color;
import java.awt.Font;
import java.awt.Frame;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.Random;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

import org.omg.CORBA.Bounds;

public class TicketingFrame extends JFrame implements ItemListener, ActionListener{
	Choice movieName;              //��ȭ���  
	Choice selectTime; 			//�ð�
	Choice adultTicket;	//����
	JPanel panel;
	JLabel label,name,time,adult;
	JButton next,home;
	int ticketNum,select;
	public TicketingFrame(){
		setSize(500,400);
		setTitle("��ȭ ����");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		panel = new JPanel(null);
		label = new JLabel("CGV");
		name = new JLabel("��ȭ ���� : ");
		time = new JLabel("��ȭ �ð� : ");
		adult = new JLabel("��   �� : ");
		
		ticketNum = (int) (Math.random()*99999);						// ���� ��ȣ�� random���� ������
		next = new JButton("NEXT");
		home = new JButton("HOME");
		
		next.addActionListener(this);									// next �̺�Ʈ ������
		
		home.addActionListener(new ActionListener() { 					// home ��ư �̺�Ʈ ������ ���� frame�� home �̺�Ʈ �����ʿ� ����
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				// TODO Auto-generated method stub
				TicketingFrame.this.dispose();
				new MainFrame().show();
			}
		});
		
		movieName=new Choice();                // ���̽� ��ü�� �����Ѵ�.
		selectTime=new Choice(); 
		
		selectTime.add("09:00~11:20(��������)");       // ��ȭ�� ���� �ٸ� �ð�ǥ�� �߰��Ѵ�.
		selectTime.add("11:30~13:50");
		selectTime.add("14:00~16:20");
		selectTime.add("16:30~18:50");
		selectTime.add("19:00~17:20");
		selectTime.add("17:30~19:50");
		selectTime.add("22:00~24:20(�ɾ�����)");
		
		adultTicket=new Choice();			// ����ǥ ���ż��� �Է¹ޱ� ���� �ؽ�Ʈ�ʵ�
		
		movieName.add("������");                         // ��ȭ��� �߰�
		movieName.add("�����Ǽ�Ʈ");
		movieName.add("������ ����");
		movieName.add("���� ���� ����ο�");
	
		movieName.addItemListener(this);
	
		for(int i=0; i < 11; i++) {                 //�ο��� �ִ� 10��
			adultTicket.add(String.valueOf(i));
		}
		
		label.setFont(new Font(label.getFont().getName(), Font.PLAIN, 80));
		label.setForeground(Color.red);
		
		label.setBounds(160,60,200,80);												// ������ǥ ����
		name.setBounds(20,160,70,30);
		movieName.setBounds(90,163,150,30);
		time.setBounds(20,200,70,30);
		selectTime.setBounds(90,203,150,30);
		adult.setBounds(270, 160, 70, 30);
		adultTicket.setBounds(350,163,70,30);
		next.setBounds(80, 300, 140, 30);
		home.setBounds(280,300,140,30);
		
		panel.add(label);
		panel.add(name);
		panel.add(movieName);
		panel.add(time);
		panel.add(selectTime);
		panel.add(adult);
		panel.add(adultTicket);
		panel.add(next);
		panel.add(home);
		setResizable(false);				 // ũ�� ���� �Ұ�
		add(panel);
		
	}
	public void itemStateChanged(ItemEvent e) {
		// TODO Auto-generated method stub
		int index = movieName.getSelectedIndex();		//ch1�� ���ù�ȣ�� index�� �Է�
		System.out.println(index);
		selectTime.removeAll();
		if(index == 0)							//index�� 0�� ���
		{					
			selectTime.add("09:00~11:20(��������)");//��ȭ������ٸ��ð�ǥ���߰��Ѵ�.
			selectTime.add("11:30~13:50");
			selectTime.add("14:00~16:20");
			selectTime.add("16:30~18:50");
			selectTime.add("19:00~17:20");
			selectTime.add("17:30~19:50");
			selectTime.add("22:00~24:20(�ɾ�����)");
		}
		else if(index==1)
		{					
			selectTime.add("09:10~12:10(��������)");//��ȭ������ٸ��ð�ǥ���߰��Ѵ�.
			selectTime.add("12:20~15:20");
			selectTime.add("15:30~18:30");
			selectTime.add("18:40~21:40");
			selectTime.add("--:--~--:--");
			selectTime.add("--:--~--:--");
			selectTime.add("21:50~24:50(�ɾ�����)");
		}
		else if(index==2)
		{					
			selectTime.add("09:00~10:50(��������)");//��ȭ������ٸ��ð�ǥ���߰��Ѵ�.
			selectTime.add("11:00~12:50");
			selectTime.add("13:00~14:50");
			selectTime.add("15:00~16:50");
			selectTime.add("17:00~18:50");
			selectTime.add("19:00~20:50");
			selectTime.add("--:--~--:--(�ɾ߿�ȭ����)");
		}
		else if(index==3)
		{					
			selectTime.add("--:--~--:--(�������ξ���)");
			selectTime.add("11:00~13:50");//��ȭ������ٸ��ð�ǥ���߰��Ѵ�.
			selectTime.add("14:00~16:50");
			selectTime.add("17:00~19:50");
			selectTime.add("20:00~22:50");
			selectTime.add("--:--~--:--");
			selectTime.add("23:00~25:50(�ɾ�����)");
		}
		else if(index==4)
		{					
			selectTime.add("10:00~12:20(��������)");//��ȭ������ٸ��ð�ǥ���߰��Ѵ�.
			selectTime.add("12:30~14:50");
			selectTime.add("15:00~17:20");
			selectTime.add("19:00~17:20");
			selectTime.add("17:30~19:50");
			selectTime.add("--:--~--:--");
			selectTime.add("22:00~24:20(�ɾ�����)");
		}
		else if(index==5)
		{					
			selectTime.add("--:--~--:--(�������ξ���)");
			selectTime.add("11:00~13:50");//��ȭ������ٸ��ð�ǥ���߰��Ѵ�.
			selectTime.add("14:00~16:50");
			selectTime.add("17:00~19:50");
			selectTime.add("20:00~22:50");
			selectTime.add("--:--~--:--");
			selectTime.add("--:--~--:--(�ɾ߿�ȭ����)");
		}
		select = index;
	}
	public void actionPerformed(ActionEvent e){

		// ��ư�� ���� ���ڿ��� �о�´�.

			int l_nmovie_time = selectTime.getSelectedIndex();		//�� �����ۿ��� index �� ����
			String l_strmovie_time = selectTime.getSelectedItem();
			int l_nadult_ticket = adultTicket.getSelectedIndex();


			String all ="";
			int l_nadult_price = 9000;					//��ǥ�� ���� ���� ����
			int l_nstudent_price = 8000;
			int l_totalPrice = 0;

			if((l_nadult_ticket == 0) 
				|| l_strmovie_time.equals("--:--~--:-- (���� ���� ����)") 
				|| l_strmovie_time.equals("--:--~--:-- (�ɾ� ��ȭ ����)")
				|| l_strmovie_time.equals("--:--~--:--")
				||l_strmovie_time.equals(null))
			{
				new MsgBox(new JFrame("") ,null,null ,"������ ��Ұ� �ֽ��ϴ�.",null, false,null);
			}
			else
			{
				if(l_nmovie_time == 0 && !l_strmovie_time.equals("--:--~--:-- (���� ���� ����)"))
				{
					l_nadult_price -= 2000;
					l_nstudent_price -= 2000;
				}
				else if(l_nmovie_time == 6 && !l_strmovie_time.equals("--:--~--:-- (�ɾ� ��ȭ ����)"))
				{
					l_nadult_price -= 1000;
					l_nstudent_price -= 1000;
				}
				if(l_nadult_ticket != 0)
				{
					l_totalPrice += l_nadult_ticket*l_nadult_price; 
				}
				
				all += String.valueOf(l_totalPrice)+"   ";
				
				
				//MsgBox message = new MsgBox(new Frame("") , l_strmovie_time+"   " + all, true);
				TicketingFrame.this.setVisible(false); // ���� Ƽ�ϰ��� ȭ���� visivle false�� ���� dispose ���Ѱ��� seatframe���� prev��ư ó���� �����ϱ������� dispose���ָ� ����ڰ� �Է��� ��� ������ ���󰡱� ����
				/*
				 * ���� ������ ��ȭ�� ��� ������ seatFrame�� �Ѱ��� seatFrame���� ��� �¼��� �����ϸ� ��ȭ ���Ű� �Ϸ��
				 */
				SeatFrame seat = new SeatFrame(movieName.getItem(select),l_nadult_ticket,l_totalPrice,ticketNum,l_strmovie_time,TicketingFrame.this);
				seat.show();							// �¼� ���� ȭ�� show����
			}

	  }
	
}
