package com.movieingwalk.www.ticketing;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.Frame;
import java.awt.GridLayout;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.SwingConstants;

public class SeatFrame extends JFrame {
	JPanel panel,seat;
	JLabel screen,seats[],peopleLabel,priceLabel;
	JButton prev,next;
	boolean[] select;
	ArrayList<String> ticket;
	int member; 														// member�� �ϳ��� �����ϸ鼭 0�̵Ǹ� �¼��� ���� �� ���õȰ��� �ʱ⿡�� ���� ȭ�鿡�� �� �ο���
	/*
	 * TicketingFrame���� ��ȭ������������ �Ķ���ͷ� �Ѱ���, parent�� ticketingFrame�̴�. ���߿� ���ų����� �������Ӵ� ���� ��Ű�������̴�. 
	 */
	public SeatFrame(final String movieName,int people,final int price,final int ticketNum,final String time,final JFrame parent) {
		setSize(500,400);
		setTitle("�¼� ����");
		member = people;
		panel = new JPanel(null);
		
		screen = new JLabel("SCREEN");
		screen.setBackground(Color.white);
		screen.setOpaque(true);												// �̼Ӽ��� true�� ���ָ� background color�� �����
		
		prev = new JButton("PREV");
		next = new JButton("NEXT");
		ticket = new ArrayList<String>();									// ticket.txt���� ������ ������ �����ϰ� ���Ű� �Ϸ�Ǹ� ���� ���ŵ� ������ add�� ����
		
		seat = new JPanel(new GridLayout(7, 7));	 						// ��ȭ �¼������� panel�� �ߴµ� gridlayout���� ��� 7x7 �¼��� ����
		seats = new JLabel[50];												// ��ȭ �¼��� ��ȣ�� ������ ���� �������� background color�� �ٲ㼭 �¼������� ǥ���Ұ���
		select = new boolean[50];											// ���� ������ ����� 49���ڸ��� ���õ����� select[49] = true��
		

		seat.setBackground(Color.white);
		seat.setOpaque(true);
		
		for(int i=0;i<7;i++) 												// �¼������� �ʱ�ȭ���ֱ����� �ݺ���
			for(int j=0;j<7;j++) {
				final int k =i*7+j;											
				seats[k] = new JLabel(Integer.toString(k+1)); 				// ���� �ϳ��� �¼� ��ȣ�� �ʱ�ȭ����
				seats[k].setHorizontalAlignment(JLabel.CENTER);				// �ؽ�Ʈ�� ��� ���� ����
				seats[k].addMouseListener(new MouseListener() {				// �� Ŭ�� �̺�Ʈ�� �ϱ����� mosuselistener interface�� ������
					
					@Override
					public void mouseReleased(MouseEvent arg0) {
						// TODO Auto-generated method stub
						
					}
					
					@Override
					public void mousePressed(MouseEvent arg0) {
						// TODO Auto-generated method stub
						
					}
					
					@Override
					public void mouseExited(MouseEvent arg0) {
						// TODO Auto-generated method stub
						
					}
					
					@Override
					public void mouseEntered(MouseEvent arg0) {
						// TODO Auto-generated method stub
						
					}
					
					@Override
					public void mouseClicked(MouseEvent arg0) { 						// ������ �� �Ⱦ��ϱ� ������ click �̺�Ʈ�� ��
						// TODO Auto-generated method stub
						if(seats[k].getBackground()==Color.MAGENTA) { 					// MAGETA�� ���� �����ߴ� �¼�
							seats[k].setBackground(Color.WHITE); 						// �ٽ� �����ϸ� �ٽ� ������� ����� �ٲ���
							select[k] = false;											// ���õ� �¼��� false�� �ٲ��ְ� member�� �ϳ�������Ŵ
							member++;
						}
						else if(member>0 && seats[k].getBackground()!=Color.GREEN){ 	// green�� ������ �ٸ������ ������ �¼�, member�� ���� 0�̾ƴϸ�
							seats[k].setBackground(Color.MAGENTA);						// ������ �� �����Ƿ� magenta�� ������ �ٲ��ְ� select�� true������
							select[k] = true;						
							member--;													// ���ڸ� ���������Ƿ� member�� ���ҽ�Ŵ
						}
						seats[k].setOpaque(true);										// �ٲ� ���� ����
					}
				});
				seat.add(seats[k]);														// ���Ͱ��� �ʱ�ȭ�� seats ���� �ϳ��� gridlayout���� ������ panel�� add��
			}
		
		try {
			FileReader fr = new FileReader("ticket.txt");								// ticket.txt �� �о�帲
			BufferedReader br = new BufferedReader(fr);
			String str;
			while((str = br.readLine()) != null) { 										// ���ٴ����� �о�帲
				ticket.add(str); 														// ticket arraylist�� add��Ŵ
				StringTokenizer st = new StringTokenizer(str);							// ���� stringtokenize�� �ڸ�����
				String name = st.nextToken("\t ");										// ���⼭ �ʿ��ѰŴ� ��ȭ�̸� ,�ð� ,�¼�������
				String str2 = st.nextToken("\t ");										// �������� �ʿ�����Ƿ� str2�� ���� �־���
				str2 = st.nextToken("\t ");
				String seats = st.nextToken("\t ");
				String tim = st.nextToken("\t ");
				StringTokenizer st2 = new StringTokenizer(seats,",");					// ���� �¼������� ","�� �����Ұ���
				System.out.println(seats);
				if(movieName.equals(name) && time.equals(tim)) {						// ������ ���� �о�帰 ���������� ���� ������ ������ �´����˻��ؼ� ������
					while(st2.hasMoreTokens()) {
						str2 = st2.nextToken();											// ","�� �ڸ� �¼� ��ȣ�� ������ green���� �ٲ���
						int k = Integer.parseInt(str2);
						this.seats[k].setBackground(Color.GREEN);
						this.seats[k].setOpaque(true);
					}
				}
			}
			br.close();
			fr.close();
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		
		prev.addActionListener(new ActionListener() {									// prev ��ư �̺�Ʈ ������
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				// TODO Auto-generated method stub
				parent.setVisible(true);												// �ٽ� Ƽ�� ����ȭ���� �����ְ�
				SeatFrame.this.dispose();												// �¼� ���� ȭ���� dispose
			}
		});
		next.addActionListener(new ActionListener() {									// next ��ư �̺�Ʈ ������
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				if(member>0) 
					new MsgBox(new JFrame("") ,null,null,"�¼��� ���� �������ּ���",null, false,null); 		// member�� 0���� ũ�ܰ��� �¼��� ���μ��� ���� �ʾҴٴ� ��
				else {
					String msg = movieName+"\t"+ticketNum+"\t"+price;								// �װԾƴϸ� ���������� �Ʒ��� ���� ������
					String seats = "\t";
					String etc = "��    �� : "+time+"   ��     �� : "+price;
					for(int i=0;i<49;i++) {															// �ش��ϴ� �¼��� ���õǸ� true�̱⶧����
						if(select[i])																// true���� �˻��ϰ� ������ seats�� �߰�����
							seats+=(i+1)+",";
					}
					seats = seats.substring(0, seats.length()-1);									// seats�� ������ ���ڰ� ","�̱⶧���� �װ��� �����ֱ�����
					new MsgBox(new JFrame("") ,"��ȭ �̸� : "+movieName,"���� ��ȣ : "+ticketNum, etc,"��     ��   : "+seats, false,SeatFrame.this); // ������ ������ msgbox�� ���
					msg +=seats+"\t"+time;
					ticket.add(msg);																// ����Ʈ�� ���� �߰���
					try {
						FileWriter fw = new FileWriter("ticket.txt"); 								// ���� ���Ÿ� ������ ticket.txt�� ������
						BufferedWriter bw = new BufferedWriter(fw);									// ���� �����Ѱ͸� �߰��ϰ������ �׷��������Ƿ� ticket�� �ִ� ��� ������ �ٽ� �������									
						for(int i = 0 ; i<ticket.size();i++)										// �ݺ����������� ��� ���������� �ٽ� ������� 									
							bw.write(ticket.get(i)+"\n");
						bw.close();
						fw.close();
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
				
			}
		});
		 
		peopleLabel = new JLabel("�ο�       :     "+people+"��");
		priceLabel = new JLabel("����       :     " +price+"��");
		screen.setBounds(30,20,430,30);
		screen.setHorizontalAlignment(SwingConstants.CENTER);
		
		prev.setBounds(80, 320, 140, 30);															// widget�� ������ǥ����
		next.setBounds(280,320,140,30);
		seat.setBounds(30,70,430,200);
		peopleLabel.setBounds(80,280,140,30);
		priceLabel.setBounds(280,280,140,30);
		
		panel.add(seat);
		panel.add(screen);
		panel.add(prev);
		panel.add(next);
		panel.add(peopleLabel);
		panel.add(priceLabel);
		
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setResizable(false);				 // ũ�� ���� �Ұ�
		add(panel);		
	}

}
