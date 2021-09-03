package com.movieingwalk.www.ticketing;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class MainFrame extends JFrame{
	public MainFrame(){
		setSize(500,400);
		setTitle("CGV");
		JPanel panel = new JPanel(null);
		JLabel label = new JLabel("CGV");
		label.setFont(new Font(label.getFont().getName(), Font.PLAIN, 80));
		label.setForeground(Color.red);											// cgv ���ڸ� red�� �ٲ���
		JButton button1 = new JButton("��ȭ ����");
		JButton button2 = new JButton("���� Ȯ��");
		
		label.setBounds(160,60,200,80);											// widget�� ������ǥ ��������
		button1.setBounds(180, 180, 140, 30);
		button2.setBounds(180, 240, 140, 30);
		panel.add(label);
		panel.add(button1);
		panel.add(button2);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setResizable(false);				 // ũ�� ���� �Ұ�
		add(panel);
		
		button1.addActionListener(new ActionListener() { 						// ��ȭ ���� ��ư �̺�Ʈ������
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				// TODO Auto-generated method stub
				new TicketingFrame().show(); 									// ticketframe�� ������
				MainFrame.this.dispose();										// mainframe�� dispose��
			}
		});
		button2.addActionListener(new ActionListener() { 						// ���� Ȯ�� ��ư �̺�Ʈ ������
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				new CheckTicketFrame().show(); 									// checkTicketFrame �� ������
				MainFrame.this.dispose(); 										// mainframe�� dispose����
			}
		});
		
	}

	public static void main(String args[]) {
		new MainFrame().show();
		//new movie().show();
	}
}
