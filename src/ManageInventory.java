import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import java.io.IOException;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import javax.swing.AbstractButton;
import javax.swing.ButtonModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.SwingConstants;
import javax.swing.UIManager;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

public class ManageInventory extends JFrame {
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
    JButton button1, button2, button3, button4, button5, button6;
    DefaultTableModel small_InventoryTableModel;
    DefaultTableModel large_InventoryTableModel;
    JTable small_InventoryTable;

    Operations ops = new Operations();

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
         * @comments Note:
         */
        public ImageButton(ImageIcon icon, int paddingTop) {
            this.icon = icon;
            this.paddingTop = paddingTop;
            setVerticalTextPosition(SwingConstants.BOTTOM);
        }
        /**
         * This method allows irreversible changes. Making sure the components
         * are located exactly where they are.
         * @comments Note:
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

    public ManageInventory(String access_level, Dashboard dashboard) {
        this.dashboard = dashboard;

        JFrame manageInventoryFrame = new JFrame("Manage Inventory Panel");
        manageInventoryFrame.setSize(1680, 720);
        manageInventoryFrame.setLayout(null);
        manageInventoryFrame.setLocationRelativeTo(null);
        manageInventoryFrame.getContentPane().setBackground(Color.decode(bgColor));

        ImageIcon icon = new ImageIcon("icons//sbc_icon.png");
        manageInventoryFrame.setIconImage(icon.getImage());

        manageInventoryFrame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
        manageInventoryFrame.setVisible(true);

        System.out.println("Manage Inventory Opened!");

        WindowAdapter windowAdapter = new WindowAdapter() {
            @Override
            public void windowLostFocus(WindowEvent e) {
                System.out.println("Focus Lost -- Manage Inventory Frame");
            }
            @Override
            public void windowClosing(WindowEvent e) {
                int choice = JOptionPane.showConfirmDialog(manageInventoryFrame,
                    "Are you sure you want to close? Any unsaved changes will be lost.",
                    "Confirm Close", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
                System.out.println("Choice: " + choice); // Log the choice made by the user
                if (choice == JOptionPane.YES_OPTION) {
                    System.out.println("Closing the window."); // Log that the window is being closed
                    manageInventoryFrame.dispose(); // Close the window if user confirms
                    dashboard.showMainDashboard();
                } else {
                    System.out.println("Window close canceled."); // Log that the window close was canceled
                }
            }
        };

        manageInventoryFrame.addWindowListener(windowAdapter);
        manageInventoryFrame.addWindowFocusListener(windowAdapter);

        /**This is the left portion of the GUI. 
         * @Comment Note:
         */

        leftPanel = new JPanel();
        leftPanel.setBounds(5, 5, 830, 670);
        leftPanel.setLayout(null);
        //leftPanel.setBorder(BorderFactory.createTitledBorder("11"));
        leftPanel.setBackground(Color.decode(bgColor));

        manageInventoryFrame.add(leftPanel);

        // Create buttons with icons aligned on top and padding
        button1 = new ImageButton(resizeIcon("icons/im_add.png", 100, 100), 50);
        button2 = new ImageButton(resizeIcon("icons/im_remove.png", 100, 100), 50);
        button3 = new ImageButton(resizeIcon("icons/im_empty.png", 100, 100), 50);
        button4 = new ImageButton(resizeIcon("icons/im_change.png", 100, 100), 50);
        button5 = new ImageButton(resizeIcon("icons/im_search.png", 100, 100), 50);
        button6 = new ImageButton(resizeIcon("icons/back_exit.png", 100, 100), 50);

        // Set Text of Buttons
        button1.setText("Add Stock");
        button2.setText("Remove Stock");
        button3.setText("Empty Stock");
        button4.setText("Change Status");
        button5.setText("Search Stock");
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
                    System.out.println("Add Stock - Is Pressed");

                    
                } else {
                    button1.setBackground(Color.decode(buttonColor)); // Change color back when released
                }
            }
        });

        button1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ops.addStock();
                    ops.updateLargeInvTable(large_InventoryTableModel);
                    ops.updateSmallInvTable(small_InventoryTableModel);
                    small_InventoryTable.setDefaultRenderer(Object.class, new CustomCellRenderer());
            }
        });
        
        // BUTTON 2 MODEL with LISTENER
        button2.getModel().addChangeListener(new ChangeListener() {
            @Override
            public void stateChanged(ChangeEvent e) {
                ButtonModel model = (ButtonModel) e.getSource();
                if (model.isPressed()) {
                    button2.setBackground(Color.decode(buttonColorOff)); // Change color when pressed
                    System.out.println("Remove Stock - Is Pressed");

                    
                } else {
                    button2.setBackground(Color.decode(buttonColor)); // Change color back when released
                }
            }
        });

        button2.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ops.removeStock();
                    ops.updateLargeInvTable(large_InventoryTableModel);
                    ops.updateSmallInvTable(small_InventoryTableModel);
                    small_InventoryTable.setDefaultRenderer(Object.class, new CustomCellRenderer());
            }
        });

        // BUTTON 3 MODEL with LISTENER
        button3.getModel().addChangeListener(new ChangeListener() {
            @Override
            public void stateChanged(ChangeEvent e) {
                ButtonModel model = (ButtonModel) e.getSource();
                if (model.isPressed()) {
                    button3.setBackground(Color.decode(buttonColorOff)); // Change color when pressed
                    System.out.println("Empty Stock - Is Pressed");

                    
                } else {
                    button3.setBackground(Color.decode(buttonColor)); // Change color back when released
                }
            }
        });

        button3.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ops.emptyStock();
                    ops.updateLargeInvTable(large_InventoryTableModel);
                    ops.updateSmallInvTable(small_InventoryTableModel);
                    small_InventoryTable.setDefaultRenderer(Object.class, new CustomCellRenderer());
            }
        });

        // BUTTON 4 MODEL with LISTENER
        button4.getModel().addChangeListener(new ChangeListener() {
            @Override
            public void stateChanged(ChangeEvent e) {
                ButtonModel model = (ButtonModel) e.getSource();
                if (model.isPressed()) {
                    button4.setBackground(Color.decode(buttonColorOff)); // Change color when pressed
                    System.out.println("Change Status - Is Pressed");

                    
                } else {
                    button4.setBackground(Color.decode(buttonColor)); // Change color back when released
                }
            }
        });

        button4.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ops.changeStockStatus();
                    ops.updateLargeInvTable(large_InventoryTableModel);
                    ops.updateSmallInvTable(small_InventoryTableModel);
                    small_InventoryTable.setDefaultRenderer(Object.class, new CustomCellRenderer());
            }
        });

        // BUTTON 5 MODEL with LISTENER
        button5.getModel().addChangeListener(new ChangeListener() {
            @Override
            public void stateChanged(ChangeEvent e) {
                ButtonModel model = (ButtonModel) e.getSource();
                if (model.isPressed()) {
                    button5.setBackground(Color.decode(buttonColorOff)); // Change color when pressed
                    System.out.println("Search Stock - Is Pressed");

                    
                } else {
                    button5.setBackground(Color.decode(buttonColor)); // Change color back when released
                }
            }
        });

        button5.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ops.searchStock();
                    ops.updateLargeInvTable(large_InventoryTableModel);
                    ops.updateSmallInvTable(small_InventoryTableModel);
                    small_InventoryTable.setDefaultRenderer(Object.class, new CustomCellRenderer());
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
                int choice = JOptionPane.showConfirmDialog(manageInventoryFrame,
                        "Are you sure you want to close? Any unsaved changes will be lost.",
                        "Confirm Close", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
                System.out.println("Choice: " + choice);
                if (choice == JOptionPane.YES_OPTION) {
                    System.out.println("Closing the window.");
                    manageInventoryFrame.dispose();
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
         * @Comment Note:
         */

        rightPanel = new JPanel();
        rightPanel.setBounds(830, 5, 830, 670);
        rightPanel.setLayout(null);
        //rightPanel.setBorder(BorderFactory.createTitledBorder("11"));
        rightPanel.setBackground(Color.decode(bgColor));

        manageInventoryFrame.add(rightPanel);

        JLabel largeInventory_label = new JLabel("Complete Inventory");
        largeInventory_label.setBounds(5, 5, 250, 35);
        rightPanel.add(largeInventory_label);

        // Create a table model for the first table
        large_InventoryTableModel = new DefaultTableModel();
        JTable large_InventoryTable = new JTable(large_InventoryTableModel);
        large_InventoryTable.setDefaultEditor(Object.class, null);
        JScrollPane large_InventoryTableScroll = new JScrollPane(large_InventoryTable);
        large_InventoryTableScroll.setBounds(5, 40, 800, 290);
        rightPanel.add(large_InventoryTableScroll);

        large_InventoryTableModel.addColumn("PRODUCT ID");
        large_InventoryTableModel.addColumn("NAME");
        large_InventoryTableModel.addColumn("STOCK LEFT");
        large_InventoryTableModel.addColumn("LAST STOCKED");

        JLabel smallInventory_label = new JLabel("Products with Low Stock");
        smallInventory_label.setBounds(5, 335, 500, 35);
        rightPanel.add(smallInventory_label);

        // Create a table model for the second table
        small_InventoryTableModel = new DefaultTableModel();
        small_InventoryTable = new JTable(small_InventoryTableModel);
        small_InventoryTable.setDefaultEditor(Object.class, null);
        JScrollPane small_InventoryTableScroll = new JScrollPane(small_InventoryTable);
        small_InventoryTableScroll.setBounds(5, 370, 800, 290);
        rightPanel.add(small_InventoryTableScroll);

        small_InventoryTableModel.addColumn("ID");
        small_InventoryTableModel.addColumn("NAME");
        small_InventoryTableModel.addColumn("STOCK LEFT");
        small_InventoryTableModel.addColumn("SUPPLIER STATUS");

        ops.updateLargeInvTable(large_InventoryTableModel);
        ops.updateSmallInvTable(small_InventoryTableModel);

        JButton largeFilterButton = new JButton("Sort by");
        largeFilterButton.setBounds(680, 5, 120, 30);
        largeFilterButton.setBackground(Color.decode(buttonColor));
        largeFilterButton.setForeground(Color.decode(fontColor));
        // SEARCH MODEL  MODEL with LISTENER
        largeFilterButton.getModel().addChangeListener(new ChangeListener() {
            @Override
            public void stateChanged(ChangeEvent e) {
                ButtonModel model = (ButtonModel) e.getSource();
                if (model.isPressed()) {
                    largeFilterButton.setBackground(Color.decode(buttonColorOff)); // Change color when pressed
                    System.out.println("LargeToggleButton - Is Pressed");
                } else {
                    largeFilterButton.setBackground(Color.decode(buttonColor)); // Change color back when released
                }
            }
        });

        // Add ActionListener to the toggle button
        largeFilterButton.addActionListener(new ActionListener() {
            int sortOption = 1; // Start with sorting by name

            @Override
            public void actionPerformed(ActionEvent e) {
                // Toggle between sorting options (1: Name, 2: Stock, 3: Product ID)
                sortOption = (sortOption % 3) + 1;
                ops.filterLargeInvTable(large_InventoryTableModel, sortOption);
            }
        });

        rightPanel.add(largeFilterButton);

        JButton smallFilterButton = new JButton("Sort by");
        smallFilterButton.setBounds(680, 335, 120, 30);
        smallFilterButton.setBackground(Color.decode(buttonColor));
        smallFilterButton.setForeground(Color.decode(fontColor));

        smallFilterButton.getModel().addChangeListener(new ChangeListener() {
            @Override
            public void stateChanged(ChangeEvent e) {
                ButtonModel model = (ButtonModel) e.getSource();
                if (model.isPressed()) {
                    smallFilterButton.setBackground(Color.decode(buttonColorOff)); // Change color when pressed
                    System.out.println("SmallToggleButton - Is Pressed");
                } else {
                    smallFilterButton.setBackground(Color.decode(buttonColor)); // Change color back when released
                }
            }
        });

        // Add ActionListener to the toggle button
        smallFilterButton.addActionListener(new ActionListener() {
            int sortOption = 1; // Start with sorting by name

            @Override
            public void actionPerformed(ActionEvent e) {
                // Toggle between sorting options (1: Name, 2: Stock, 3: Product ID)
                sortOption = (sortOption % 3) + 1;
                ops.filterSmallInvTable(small_InventoryTableModel, sortOption);
            }
        });

        rightPanel.add(smallFilterButton);

        // Set custom cell renderer
        small_InventoryTable.setDefaultRenderer(Object.class, new CustomCellRenderer());

        
    } // end of New Order

    private class CustomCellRenderer extends DefaultTableCellRenderer {
        
        @Override
        public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
            Component cell = super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);

            int stockLeft = (int) table.getValueAt(row, 2); // Assuming STOCK LEFT is in the 3rd column
            String supplierStatus = (String) table.getValueAt(row, 3); // Assuming SUPPLIER STATUS is in the 4th column

            if ("pending".equalsIgnoreCase(supplierStatus)) {
                cell.setBackground(Color.decode("#9fff80"));
            } else if (stockLeft >= 50) {
                cell.setBackground(Color.decode("#ffff80"));
            } else if (stockLeft > 0 && stockLeft < 50) {
                cell.setBackground(Color.decode("#ffff80"));
            } else if (stockLeft == 0) {
                cell.setBackground(Color.decode("#ff8080"));
            } else {
                cell.setBackground(Color.WHITE); // Default background color
            }
            
            return cell;
        }
    }

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
}
