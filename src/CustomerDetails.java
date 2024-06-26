import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import java.io.IOException;
import javax.swing.*;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.table.DefaultTableModel;

public class CustomerDetails extends JFrame{
    DefaultTableModel tableModel;
    String bgColor = "#e0e0e0"; // light gray background
    String buttonColor = "#607D8B"; // dark color
    String buttonColorOff = "#c0c0c0"; // grey light
    String fontColor = "#e0e0e0"; // dirty white
    String defaultColor = "#000000";  // black
    String labelColor = "#001f3f"; // dark blue but not really
    String debug = "#FFC300"; // yellow to see 
    @SuppressWarnings("unused")
    private Dashboard dashboard;
    JPanel rightPanel, leftPanel;
    private JTable customerTable;
    private JLabel label1;
    JButton button1, button2, button3, button4, button5, button6;
    Operations ops = new Operations();
    /**
     * This method is responsible for loading the image for the Icons in the Buttons Panel.
     * @param path - source file path of the image
     * @param width - width of the image (px)
     * @param height - height of the image (px)
     * @return
     * @comments Note:
     */
    public static ImageIcon resizeIcon(String path, int width, int height) {
        try {
            ImageIcon icon = new ImageIcon(path);
            Image img = icon.getImage();
            Image newImg = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
            return new ImageIcon(newImg);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * This class contains the ImageButton method. THis is responsible for 
     * allowing the addition of padding to the image.
     * @comments Note:
     */
    public static class ImageButton extends JButton {
        private ImageIcon icon;
        private int paddingTop; 
        /**
         * This method is responsible for adding padding to the image and
         * lowers the text relative to the button.
         * @param icon
         * @param paddingTop
         */
        public ImageButton(ImageIcon icon, int paddingTop) {
            this.icon = icon;
            this.paddingTop = paddingTop;
            setVerticalTextPosition(SwingConstants.BOTTOM);
        }
        /**
         * This method allows irreversible changes. Making sure the components
         * are located exactly where they are.
         */
        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            if (icon != null) {
                int iconX = (getWidth() - icon.getIconWidth()) / 2;
                int iconY = paddingTop; 
                icon.paintIcon(this, g, iconX, iconY);
            }
        }
    }

    /**
     * This method combined with ImageButton allows for the exact
     * location of the TEXT inside the button. Such as changing the 
     * margin / padding of it.
     * @param button
     * @param paddingTop
     * @comments Note:
     */
    public static void adjustButtonTextHeight(AbstractButton button, int paddingTop) {
        button.setVerticalTextPosition(SwingConstants.BOTTOM);
        button.setMargin(new Insets(paddingTop, 0, 0, 0)); // Only Top since it is already centered.
    }

    /**
     * This constructor is responsible for showing the Customer Details GUI
     * @param access_level
     * @param dashboard
     * @comments Note:
     */
    public CustomerDetails(String access_level, Dashboard dashboard) {
        System.out.println("Opening Customer Details with access level " + access_level);

        this.dashboard = dashboard;
        JFrame customerDetailsFrame = new JFrame("Manage Customer Details");
        customerDetailsFrame.setSize(1680, 720);
        customerDetailsFrame.setLayout(null);
        customerDetailsFrame.setLocationRelativeTo(null);
        customerDetailsFrame.getContentPane().setBackground(Color.decode(bgColor));
        ImageIcon icon = new ImageIcon("icons//sbc_icon.png");
        customerDetailsFrame.setIconImage(icon.getImage());

        customerDetailsFrame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
        customerDetailsFrame.setVisible(true);

        System.out.println("Customer Details Opened!");

        WindowAdapter windowAdapter = new WindowAdapter() {
            @Override
            public void windowLostFocus(WindowEvent e) {
                System.out.println("Focus Lost -- Customer Details Frame");
            }
            @Override
            public void windowClosing(WindowEvent e) {
                int choice = JOptionPane.showConfirmDialog(customerDetailsFrame,
                    "Are you sure you want to close? Any unsaved changes will be lost.",
                    "Confirm Close", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
                System.out.println("Choice: " + choice); // Log the choice made by the user
                if (choice == JOptionPane.YES_OPTION) {
                    System.out.println("Closing the window."); // Log that the window is being closed
                    customerDetailsFrame.dispose(); // Close the window if user confirms
                    dashboard.showMainDashboard();
                } else {
                    System.out.println("Window close canceled."); // Log that the window close was canceled
                }
            }
        };

        customerDetailsFrame.addWindowListener(windowAdapter);
        customerDetailsFrame.addWindowFocusListener(windowAdapter);

        /**This is the left portion of the GUI. 
         * This should contain 6 Buttons
         * button1 - Add Customer
         * button2 - Rename Customer
         * button3 - Change Contact Number
         * button4 - Change Status
         * button5 - Cancel / Undo Current Changes
         * button6 - EXIT
         * @Comment Note:
         */

        leftPanel = new JPanel();
        leftPanel.setBounds(5, 5, 830, 670);
        leftPanel.setLayout(null);
        //leftPanel.setBorder(BorderFactory.createTitledBorder("11"));
        leftPanel.setBackground(Color.decode(bgColor));

        customerDetailsFrame.add(leftPanel);

        // Create buttons with icons aligned on top and padding
        button1 = new ImageButton(resizeIcon("icons/cd_add.png", 100, 100), 50);
        button2 = new ImageButton(resizeIcon("icons/cd_rename.png", 100, 100), 50);
        button3 = new ImageButton(resizeIcon("icons/cd_contact.png", 100, 100), 50);
        button4 = new ImageButton(resizeIcon("icons/cd_remove.png", 100, 100), 50);
        button5 = new ImageButton(resizeIcon("icons/ol_details.png", 100, 100), 50);
        button6 = new ImageButton(resizeIcon("icons/back_exit.png", 100, 100), 50);

        // Set Text of Buttons
        button1.setText("Add Customer");
        button2.setText("Rename Customer");
        button3.setText("Change Contact");
        button4.setText("Remove Customer");
        button5.setText("Check Customer");
        button6.setText("Exit");

        // Adjust text height for buttons
        adjustButtonTextHeight(button1, 50);
        adjustButtonTextHeight(button2, 50);
        adjustButtonTextHeight(button3, 50);
        adjustButtonTextHeight(button4, 50);
        adjustButtonTextHeight(button5, 50);
        adjustButtonTextHeight(button6, 50);

        button1.setBackground(Color.decode(buttonColor));
        button2.setBackground(Color.decode(buttonColor));
        button3.setBackground(Color.decode(buttonColor));
        button4.setBackground(Color.decode(buttonColor));
        button5.setBackground(Color.decode(buttonColor));
        button6.setBackground(Color.decode(buttonColor));

        button1.setForeground(Color.decode(fontColor));
        button2.setForeground(Color.decode(fontColor));
        button3.setForeground(Color.decode(fontColor));
        button4.setForeground(Color.decode(fontColor));
        button5.setForeground(Color.decode(fontColor));
        button6.setForeground(Color.decode(fontColor));

        button1.setFocusPainted(false);
        button2.setFocusPainted(false);
        button3.setFocusPainted(false);
        button4.setFocusPainted(false);
        button5.setFocusPainted(false);
        button6.setFocusPainted(false);

        // Location of all the BUTTONS
        button1.setBounds(20, 24, 250, 300);
        button2.setBounds(290, 25, 250, 300);
        button3.setBounds(560, 25, 250, 300);
        button4.setBounds(20, 345, 250, 300);
        button5.setBounds(290, 345, 250, 300);
        button6.setBounds(560, 345, 250, 300);

        // BUTTON 1 MODEL with LISTENER
        button1.getModel().addChangeListener(new ChangeListener() {
            @Override
            public void stateChanged(ChangeEvent e) {
                ButtonModel model = (ButtonModel) e.getSource();
                if (model.isPressed()) {
                    button1.setBackground(Color.decode(buttonColorOff)); // Change color when pressed
                    System.out.println("Button 1 - Is Pressed");
                    
                } else {
                    button1.setBackground(Color.decode(buttonColor)); // Change color back when released
                }
            }
        });

        button1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ops.addCustomer();
                    ops.updateCustomerTable(tableModel);
            }
        });
        
        // BUTTON 2 MODEL with LISTENER
        button2.getModel().addChangeListener(new ChangeListener() {
            @Override
            public void stateChanged(ChangeEvent e) {
                ButtonModel model = (ButtonModel) e.getSource();
                if (model.isPressed()) {
                    button2.setBackground(Color.decode(buttonColorOff)); // Change color when pressed
                    System.out.println("Button 2 - Is Pressed");
                    
                } else {
                    button2.setBackground(Color.decode(buttonColor)); // Change color back when released
                }
            }
        });

        button2.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ops.renameCustomer();
                    ops.updateCustomerTable(tableModel);
            }
        });

        // BUTTON 3 MODEL with LISTENER
        button3.getModel().addChangeListener(new ChangeListener() {
            @Override
            public void stateChanged(ChangeEvent e) {
                ButtonModel model = (ButtonModel) e.getSource();
                if (model.isPressed()) {
                    button3.setBackground(Color.decode(buttonColorOff)); // Change color when pressed
                    System.out.println("Button 3 - Is Pressed");
                    
                } else {
                    button3.setBackground(Color.decode(buttonColor)); // Change color back when released
                }
            }
        });

        button3.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ops.updateCustomerContactNumber();
                    ops.updateCustomerTable(tableModel);
            }
        });

        // BUTTON 4 MODEL with LISTENER
        button4.getModel().addChangeListener(new ChangeListener() {
            @Override
            public void stateChanged(ChangeEvent e) {
                ButtonModel model = (ButtonModel) e.getSource();
                if (model.isPressed()) {
                    button4.setBackground(Color.decode(buttonColorOff)); // Change color when pressed
                    System.out.println("Button 4 - Is Pressed");
                    
                } else {
                    button4.setBackground(Color.decode(buttonColor)); // Change color back when released
                }
            }
        });

        button4.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ops.changeStatus();
                    ops.updateCustomerTable(tableModel);
            }
        });

        // BUTTON 5 MODEL with LISTENER
        button5.getModel().addChangeListener(new ChangeListener() {
            @Override
            public void stateChanged(ChangeEvent e) {
                ButtonModel model = (ButtonModel) e.getSource();
                if (model.isPressed()) {
                    button5.setBackground(Color.decode(buttonColorOff)); // Change color when pressed
                    System.out.println("Button 5 - Is Pressed");
                    

                } else {
                    button5.setBackground(Color.decode(buttonColor)); // Change color back when released
                }
            }
        });

        button5.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ops.checkCustomerDetails();
                ops.updateCustomerTable(tableModel);
            }
        });

        // BUTTON 6 MODEL with CHANGE LISTENER (EXIT)
        button6.getModel().addChangeListener(new ChangeListener() {
            @Override
            public void stateChanged(ChangeEvent e) {
                ButtonModel model = (ButtonModel) e.getSource();
                if (model.isPressed()) {
                    button6.setBackground(Color.decode(buttonColorOff)); // Change color when pressed
                    System.out.println("Button 6 - Is Pressed");
                } else {
                    button6.setBackground(Color.decode(buttonColor)); // Change color back when released
                }
            }
        });

        // BUTTON 6 MODEL with ACTION LISTENER (EXIT)
        button6.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int choice = JOptionPane.showConfirmDialog(customerDetailsFrame,
                        "Are you sure you want to close? Any unsaved changes will be lost.",
                        "Confirm Close", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
                System.out.println("Choice: " + choice);
                if (choice == JOptionPane.YES_OPTION) {
                    System.out.println("Closing the window.");
                    customerDetailsFrame.dispose();
                    dashboard.showMainDashboard();
                } else {
                    System.out.println("Window close canceled.");
                }
            }
        });

        // ADDING THE BUTTONS
        leftPanel.add(button1);
        leftPanel.add(button2);
        leftPanel.add(button3);
        leftPanel.add(button4);
        leftPanel.add(button5);
        leftPanel.add(button6);

        /**This is the Right portion of the GUI. 
         * It should contain a Search Panel and Button and Below
         * should be a JTable containing the Customer Database
         * @Comment Note:
         */

        rightPanel = new JPanel();
        rightPanel.setBounds(830, 5, 830, 670);
        rightPanel.setLayout(null);
        //rightPanel.setBorder(BorderFactory.createTitledBorder("11"));
        rightPanel.setBackground(Color.decode(bgColor));

        customerDetailsFrame.add(rightPanel);

        // SEARCH BAR
        label1 = new JLabel("Customer Management Details");
        label1.setBounds(20, 30, 350, 30);
        rightPanel.add(label1);

        // Create table model
        tableModel = new DefaultTableModel();

        // Create a table and set the model
        customerTable = new JTable(tableModel);
        JScrollPane customerScrollPane = new JScrollPane(customerTable);
        customerTable.setDefaultEditor(Object.class, null);
        customerScrollPane.setBounds(20, 70, 790, 580);
        rightPanel.add(customerScrollPane);

        tableModel.addColumn("Customer ID");
        tableModel.addColumn("Name");
        tableModel.addColumn("Contact Number");

        ops.updateCustomerTable(tableModel);

    } // end of customerDetailsFrame

    /**
     * This method loads custom fonts (ttf files etc.) from the Fonts Folder
     * so that they can be used within this application.
     * @param path
     * @param size
     * @return
     * @throws IOException
     * @throws FontFormatException
     * @comments Note:
     */
    public static Font loadFont(String path, float size) throws IOException, FontFormatException {
        Font customFont = Font.createFont(Font.TRUETYPE_FONT, new File(path)).deriveFont(size);
        GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
        ge.registerFont(customFont);
        return customFont;
    } // end of show loadFont

    /**
    * This method enables all the Button Components.
    * @comments Note:
    */
    public void enableAllCustomerButtons() { 
        Component[] components = rightPanel.getComponents();
        for (Component component : components) {
            if (component instanceof ImageButton) {
                ImageButton button = (ImageButton) component;
                button.setEnabled(true);
                button.setBackground(Color.decode(buttonColor));
            }
        }
    } // end of enableAllCustomerButtons

    /**
     * This method disables all the Button Components.
     * @comments Note:
     */
    public void disableAllCustomerButtons() {
        Component[] components = rightPanel.getComponents();
        for (Component component : components) {
            if (component instanceof ImageButton) {
                ImageButton button = (ImageButton) component;
                button.setEnabled(false);
                button.setBackground(Color.decode("#84817a"));
            }
        }
    } // end of disableAllCustomerButtons
}
