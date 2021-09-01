package com.movieingwalk.www.ticketing;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class CheckTicketFrame extends JFrame{
	ArrayList<String> ticket; 											// text���Ͽ��� ���ŵ� ������ �����ͼ� arraylist�� �־���
	JPanel panel;
	JLabel label,numLabel;
	JButton next,home;
	JTextField numText;
	public CheckTicketFrame(){
		setSize(500,400);
		setTitle("CGV");
		panel = new JPanel(null);
		label = new JLabel("CGV");
		label.setFont(new Font(label.getFont().getName(), Font.PLAIN, 80));
		label.setForeground(Color.red);
		 next = new JButton("NEXT");
		home = new JButton("HOME");
		
		numLabel = new JLabel("���� ��ȣ : ");
		numText = new JTextField(10);
		ticket = new ArrayList<String>(); 								// arraylist �ʱ�ȭ
		
		try {
			FileReader fr = new FileReader("ticket.txt");				// ticket.txt ���Ͽ��� ���� ������ ������
			BufferedReader br = new BufferedReader(fr);
			String str;
			while((str = br.readLine()) != null) { 						// ���ٴ������о arraylist�� �־���
				ticket.add(str);
			}
			br.close();
			fr.close();
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		home.addActionListener(new ActionListener() { 					// home ��ư �̺�Ʈ ������
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				// TODO Auto-generated method stub
				CheckTicketFrame.this.dispose(); 						// ���� frame�� dispose ����
				new MainFrame().show(); 								// mainframe�� show ����
			}
		});
		next.addActionListener(new ActionListener() { 					// ���� ���� Ȯ�� ��ư �̺�Ʈ ������
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				// TODO Auto-generated method stub
				for(int i=0;i<ticket.size();i++) {						// text���� �о�� ���ŵ����� ���� 
					
					StringTokenizer st = new StringTokenizer(ticket.get(i).toString());
					String name = st.nextToken("\t ");
					String num = st.nextToken("\t ");
					if(num.equals(numText.getText().toString())) {
						String price = st.nextToken("\t ");
						String seats = st.nextToken("\t ");
						String time = st.nextToken("\t");
						String etc = "��    �� : "+time+"   ��     �� : "+price;
						new MsgBox(new JFrame("") ,"��ȭ �̸� : "+name,"���� ��ȣ : "+num, etc,"��     ��   : "+seats, false,null);
					}
				}
			}
		});
		next.setBounds(80, 300, 140, 30);
		home.setBounds(280,300,140,30);
		label.setBounds(160,60,200,80);
		numLabel.setBounds(120, 200, 140, 30);
		numText.setBounds(220, 200, 140, 30);
		
		panel.add(label);
		panel.add(numLabel);
		panel.add(numText);
		panel.add(next);
		panel.add(home);
		
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setResizable(false);				 // ũ�� ���� �Ұ�
		add(panel);
		
		
	}
}
