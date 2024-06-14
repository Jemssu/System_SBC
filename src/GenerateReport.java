import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.time.Year;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.swing.*;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.table.DefaultTableModel;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class GenerateReport extends JFrame{
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
    private JTable salesReportTable;
    JButton button1, button2, button3, button4, button5, button6;
    DefaultTableModel product_TableModel;
    JTable product_Table;

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
    public GenerateReport(String access_level, Dashboard dashboard) {
        System.out.println("Opening Generate Report with access level " + access_level);

        this.dashboard = dashboard;
        JFrame generateReportFrame = new JFrame("Generate Report");
        generateReportFrame.setSize(1680, 720);
        generateReportFrame.setLayout(null);
        generateReportFrame.setLocationRelativeTo(null);
        generateReportFrame.getContentPane().setBackground(Color.decode(bgColor));

        ImageIcon icon = new ImageIcon("icons//sbc_icon.png");
        generateReportFrame.setIconImage(icon.getImage());

        generateReportFrame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
        generateReportFrame.setVisible(true);

        System.out.println("Generate Report Opened!");

        WindowAdapter windowAdapter = new WindowAdapter() {
            @Override
            public void windowLostFocus(WindowEvent e) {
                System.out.println("Focus Lost -- Generate Report Frame");
            }
            @Override
            public void windowClosing(WindowEvent e) {
                int choice = JOptionPane.showConfirmDialog(generateReportFrame,
                    "Are you sure you want to close? Any unsaved changes will be lost.",
                    "Confirm Close", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
                System.out.println("Choice: " + choice); // Log the choice made by the user
                if (choice == JOptionPane.YES_OPTION) {
                    System.out.println("Closing the window."); // Log that the window is being closed
                    generateReportFrame.dispose(); // Close the window if user confirms
                    dashboard.showMainDashboard();
                } else {
                    System.out.println("Window close canceled."); // Log that the window close was canceled
                }
            }
        };

        generateReportFrame.addWindowListener(windowAdapter);
        generateReportFrame.addWindowFocusListener(windowAdapter);

        leftPanel = new JPanel();
        leftPanel.setBounds(5, 5, 830, 670);
        leftPanel.setLayout(null);
        //leftPanel.setBorder(BorderFactory.createTitledBorder("11"));
        leftPanel.setBackground(Color.decode(bgColor));

        generateReportFrame.add(leftPanel);

        // Create buttons with icons aligned on top and padding
        button1 = new ImageButton(resizeIcon("icons/gr_daily.png", 100, 100), 50);
        button2 = new ImageButton(resizeIcon("icons/gr_month.png", 100, 100), 50);
        button3 = new ImageButton(resizeIcon("icons/gr_custom.png", 100, 100), 50);
        button4 = new ImageButton(resizeIcon("icons/all_cancel.png", 100, 100), 50);
        button5 = new ImageButton(resizeIcon("icons/ol_filter.png", 100, 100), 50);
        button6 = new ImageButton(resizeIcon("icons/back_exit.png", 100, 100), 50);

        // Set Text of Buttons
        button1.setText("Daily Report");
        button2.setText("Monthly Report");
        button3.setText("Custom Report");
        button4.setText("Clear");
        button5.setText("Filter");
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

        // BUTTON 1 MODEL with ACTION LISTENER (EXIT)
        button1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                
                generateDailySalesReport();

                updateSalesReportTable();
                updateProductSalesReportTable();
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
                
                generateMonthlySalesReport();

                updateSalesReportTable();
                updateProductSalesReportTable();
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
                generateCustomSalesReport();

                updateSalesReportTable();
                updateProductSalesReportTable();
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
                resetSalesReportFilter();

                updateSalesReportTable();
                updateProductSalesReportTable();
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
                filterChoose();
                
                updateSalesReportTable();
                updateProductSalesReportTable();
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
                int choice = JOptionPane.showConfirmDialog(generateReportFrame,
                        "Are you sure you want to close? Any unsaved changes will be lost.",
                        "Confirm Close", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
                System.out.println("Choice: " + choice);
                if (choice == JOptionPane.YES_OPTION) {
                    System.out.println("Closing the window.");
                    generateReportFrame.dispose();
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

        generateReportFrame.add(rightPanel);

        JLabel general_label = new JLabel("Summary Report:");
        general_label.setBounds(5, 5, 250, 35);
        rightPanel.add(general_label);

        // Create table model
        DefaultTableModel generaltableModel = new DefaultTableModel();

        // Create a table and set the model
        salesReportTable = new JTable(generaltableModel);
        salesReportTable.setDefaultEditor(Object.class, null);
        JScrollPane salesReportScrollPane = new JScrollPane(salesReportTable);
        salesReportScrollPane.setBounds(5, 40, 800, 290);
        
        generaltableModel.addColumn("Transaction ID");
        generaltableModel.addColumn("Total Amount");
        generaltableModel.addColumn("Cashier");
        generaltableModel.addColumn("Date");
        generaltableModel.addColumn("Payment Status");

        rightPanel.add(salesReportScrollPane);

        // Label for 
        JLabel itemInventory_label = new JLabel("Products");
        itemInventory_label.setBounds(5, 335, 250, 35);
        rightPanel.add(itemInventory_label);

        // Create a table model for the second table
        product_TableModel = new DefaultTableModel();
        product_Table = new JTable(product_TableModel);
        product_Table.setDefaultEditor(Object.class, null);
        JScrollPane product_TableScroll = new JScrollPane(product_Table);
        product_TableScroll.setBounds(5, 370, 800, 290);
        rightPanel.add(product_TableScroll);
        product_TableModel.addColumn("PRODUCT ID");
        product_TableModel.addColumn("NAME");
        product_TableModel.addColumn("QUANTITY");
        product_TableModel.addColumn("TOTAL SALES");

        resetSalesReportFilter();
        updateSalesReportTable();
        updateProductSalesReportTable();

        if (access_level == "employee"){
            button2.setEnabled(false);
            button2.setBackground(Color.decode("#84817a"));
            button3.setEnabled(false);
            button3.setBackground(Color.decode("#84817a"));
            button4.setEnabled(false);
            button4.setBackground(Color.decode("#84817a"));
            button5.setEnabled(false);
            button5.setBackground(Color.decode("#84817a"));
        }
    } // end of customerDetailsFrame

    public void generateDailySalesReport() {
        String filterFilePath = "srfilter.txt"; // Ensure this is the correct path
    
        // Set the filter values for the daily report
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filterFilePath))) {
            writer.write("dateSelectRange.fromDate = " + LocalDate.now() + "\n");
            writer.write("dateSelectRange.toDate = " + LocalDate.now().plusDays(1) + "\n");
            writer.write("orderStatus.showStatus = paid\n");
            System.out.println("Filter file updated successfully.");
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Failed to update the filter file.");
        }
    
        // Verify if the file was updated correctly
        try {
            System.out.println("Contents of the filter file:");
            Files.lines(Paths.get(filterFilePath)).forEach(System.out::println);
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Failed to read the filter file.");
        }
    
        // Update the table with the daily report data
        updateSalesReportTable();
        updateProductSalesReportTable();
    
        // Ask the user if they want to see the updated table
        int response = JOptionPane.showConfirmDialog(null, "Do you want to see the updated table before saving?", "Confirm", JOptionPane.YES_NO_OPTION);
        if (response == JOptionPane.YES_OPTION) {
            return;
        }
    
        // Save the table to an Excel file
        saveTableToExcel("DailySalesReport " + LocalDate.now().toString());
    }

    public void generateMonthlySalesReport() {
        // Ask the user to select a month
        String[] months = new String[12];
        for (int i = 0; i < 12; i++) {
            months[i] = Month.of(i + 1).getDisplayName(TextStyle.FULL, Locale.getDefault());
        }
        String selectedMonth = (String) JOptionPane.showInputDialog(null, "Select Month:", "Month Selection",
                JOptionPane.QUESTION_MESSAGE, null, months, months[0]);

        if (selectedMonth == null) {
            JOptionPane.showMessageDialog(null, "No month selected. Report generation cancelled.", "Cancelled", JOptionPane.WARNING_MESSAGE);
            return;
        }

        // Get the current year and the selected month number
        int monthNumber = Arrays.asList(months).indexOf(selectedMonth) + 1;
        YearMonth yearMonth = YearMonth.of(LocalDate.now().getYear(), monthNumber);

        // Set the date range for the selected month
        LocalDate fromDate = yearMonth.atDay(1);
        LocalDate toDate = yearMonth.atEndOfMonth().plusDays(1);

        // Set the filter values for the monthly report
        String filterFilePath = "srfilter.txt"; // Ensure this is the correct path
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filterFilePath))) {
            writer.write("dateSelectRange.fromDate = " + fromDate + "\n");
            writer.write("dateSelectRange.toDate = " + toDate + "\n");
            writer.write("orderStatus.showStatus = paid\n");
            System.out.println("Filter file updated successfully.");
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Failed to update the filter file.");
        }

        // Verify if the file was updated correctly
        try {
            System.out.println("Contents of the filter file:");
            Files.lines(Paths.get(filterFilePath)).forEach(System.out::println);
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Failed to read the filter file.");
        }

        // Update the table with the monthly report data
        updateSalesReportTable();
        updateProductSalesReportTable();

        // Ask the user if they want to see the updated table
        int response = JOptionPane.showConfirmDialog(null, "Do you want to see the updated table before saving?", "Confirm", JOptionPane.YES_NO_OPTION);
        if (response == JOptionPane.YES_OPTION) {
            return;
        }

        // Save the table to an Excel file
        saveTableToExcel("MonthlySalesReport " + LocalDate.now().toString());
    }

    public void generateCustomSalesReport() {
        int choice = JOptionPane.showOptionDialog(null,
                "Do you want to use the data currently displayed in the table or generate new data?",
                "Data Choice",
                JOptionPane.YES_NO_CANCEL_OPTION,
                JOptionPane.QUESTION_MESSAGE,
                null,
                new String[]{"Use Current Data", "Generate New Data"},
                "Use Current Data");
    
        if (choice == JOptionPane.CANCEL_OPTION || choice == JOptionPane.CLOSED_OPTION) {
            JOptionPane.showMessageDialog(null, "Report generation cancelled.", "Cancelled", JOptionPane.WARNING_MESSAGE);
            return;
        }
    
        if (choice == JOptionPane.YES_OPTION) {
            // Save the table to an Excel file using the current data
            saveTableToExcel("CustomSalesReport " + LocalDate.now().toString());
            return;
        }
    
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    
        // Ask the user for the starting date
        String fromDateInput = JOptionPane.showInputDialog(null, "Enter the starting date (yyyy-MM-dd):", "Starting Date", JOptionPane.QUESTION_MESSAGE);
        if (fromDateInput == null || fromDateInput.trim().isEmpty()) {
            JOptionPane.showMessageDialog(null, "No starting date entered. Report generation cancelled.", "Cancelled", JOptionPane.WARNING_MESSAGE);
            return;
        }
    
        LocalDate fromDate;
        try {
            fromDate = LocalDate.parse(fromDateInput.trim(), formatter);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Invalid starting date format. Report generation cancelled.", "Error", JOptionPane.ERROR_MESSAGE);
            return;
        }
    
        // Ask the user for the ending date
        String toDateInput = JOptionPane.showInputDialog(null, "Enter the ending date (yyyy-MM-dd):", "Ending Date", JOptionPane.QUESTION_MESSAGE);
        if (toDateInput == null || toDateInput.trim().isEmpty()) {
            JOptionPane.showMessageDialog(null, "No ending date entered. Report generation cancelled.", "Cancelled", JOptionPane.WARNING_MESSAGE);
            return;
        }
    
        LocalDate toDate;
        try {
            toDate = LocalDate.parse(toDateInput.trim(), formatter);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Invalid ending date format. Report generation cancelled.", "Error", JOptionPane.ERROR_MESSAGE);
            return;
        }
    
        // Ask the user for the order status
        String[] statuses = {"pending", "paid", "both"};
        String selectedStatus = (String) JOptionPane.showInputDialog(null, "Select order status:", "Order Status",
                JOptionPane.QUESTION_MESSAGE, null, statuses, statuses[0]);
    
        if (selectedStatus == null) {
            JOptionPane.showMessageDialog(null, "No order status selected. Report generation cancelled.", "Cancelled", JOptionPane.WARNING_MESSAGE);
            return;
        }
    
        String orderStatus;
        if ("both".equals(selectedStatus)) {
            orderStatus = "pending', 'paid";
        } else {
            orderStatus = selectedStatus;
        }
    
        // Set the filter values for the custom report
        String filterFilePath = "srfilter.txt"; // Ensure this is the correct path
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filterFilePath))) {
            writer.write("dateSelectRange.fromDate = " + fromDate + "\n");
            writer.write("dateSelectRange.toDate = " + toDate + "\n");
            writer.write("orderStatus.showStatus = " + orderStatus + "\n");
            System.out.println("Filter file updated successfully.");
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Failed to update the filter file.");
        }
    
        // Verify if the file was updated correctly
        try {
            System.out.println("Contents of the filter file:");
            Files.lines(Paths.get(filterFilePath)).forEach(System.out::println);
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Failed to read the filter file.");
        }
    
        // Update the table with the custom report data
        updateSalesReportTable();
        updateProductSalesReportTable();
    
        // Ask the user if they want to see the updated table
        int response = JOptionPane.showConfirmDialog(null, "Do you want to see the updated table before saving?", "Confirm", JOptionPane.YES_NO_OPTION);
        if (response == JOptionPane.YES_OPTION) {
            return;
        }
    
        // Save the table to an Excel file
        saveTableToExcel("CustomSalesReport " + LocalDate.now().toString());
    }
    
    public void filterChoose() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    
        // Ask the user for the starting date
        String fromDateInput = JOptionPane.showInputDialog(null, "Enter the starting date (yyyy-MM-dd):", "Starting Date", JOptionPane.QUESTION_MESSAGE);
        if (fromDateInput == null || fromDateInput.trim().isEmpty()) {
            JOptionPane.showMessageDialog(null, "No starting date entered. Filter application cancelled.", "Cancelled", JOptionPane.WARNING_MESSAGE);
            return;
        }
    
        LocalDate fromDate;
        try {
            fromDate = LocalDate.parse(fromDateInput.trim(), formatter);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Invalid starting date format. Filter application cancelled.", "Error", JOptionPane.ERROR_MESSAGE);
            return;
        }
    
        // Ask the user for the ending date
        String toDateInput = JOptionPane.showInputDialog(null, "Enter the ending date (yyyy-MM-dd):", "Ending Date", JOptionPane.QUESTION_MESSAGE);
        if (toDateInput == null || toDateInput.trim().isEmpty()) {
            JOptionPane.showMessageDialog(null, "No ending date entered. Filter application cancelled.", "Cancelled", JOptionPane.WARNING_MESSAGE);
            return;
        }
    
        LocalDate toDate;
        try {
            toDate = LocalDate.parse(toDateInput.trim(), formatter);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Invalid ending date format. Filter application cancelled.", "Error", JOptionPane.ERROR_MESSAGE);
            return;
        }
    
        // Ask the user for the order status
        String[] statuses = {"pending", "paid", "both"};
        String selectedStatus = (String) JOptionPane.showInputDialog(null, "Select order status:", "Order Status",
                JOptionPane.QUESTION_MESSAGE, null, statuses, statuses[0]);
    
        if (selectedStatus == null) {
            JOptionPane.showMessageDialog(null, "No order status selected. Filter application cancelled.", "Cancelled", JOptionPane.WARNING_MESSAGE);
            return;
        }
    
        String orderStatus;
        if ("both".equals(selectedStatus)) {
            orderStatus = "pending', 'paid";
        } else {
            orderStatus = selectedStatus;
        }
    
        // Set the filter values for the custom report
        String filterFilePath = "srfilter.txt"; // Ensure this is the correct path
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filterFilePath))) {
            writer.write("dateSelectRange.fromDate = " + fromDate + "\n");
            writer.write("dateSelectRange.toDate = " + toDate + "\n");
            writer.write("orderStatus.showStatus = " + orderStatus + "\n");
            System.out.println("Filter file updated successfully.");
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Failed to update the filter file.");
        }
    
        // Verify if the file was updated correctly
        try {
            System.out.println("Contents of the filter file:");
            Files.lines(Paths.get(filterFilePath)).forEach(System.out::println);
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Failed to read the filter file.");
        }
    
        // Update the table with the custom report data
        updateSalesReportTable();
        updateProductSalesReportTable();
    
        JOptionPane.showMessageDialog(null, "Table updated with the selected filters.", "Filter Applied", JOptionPane.INFORMATION_MESSAGE);
    }

    private void saveTableToExcel(String fileName) {
        Workbook workbook = new XSSFWorkbook();

        // Calculate total sales for General Sales Report
        DefaultTableModel generalSalesModel = (DefaultTableModel) salesReportTable.getModel();
        double totalSales = 0;
        for (int i = 0; i < generalSalesModel.getRowCount(); i++) {
            totalSales += (Double) generalSalesModel.getValueAt(i, 1); // Assuming column 1 is the total price column
        }

        // Create General Sales Report sheet
        Sheet generalSalesSheet = workbook.createSheet("General Sales Report");
        addSheetData(generalSalesSheet, generalSalesModel, "GENERAL SALES REPORT - Total Sales: " + totalSales);

        // Create Product Sales Report sheet
        Sheet productSalesSheet = workbook.createSheet("Product Sales Report");
        DefaultTableModel productSalesModel = (DefaultTableModel) product_Table.getModel();
        addSheetData(productSalesSheet, productSalesModel, "PRODUCT SALES REPORT");

        try (FileOutputStream outputStream = new FileOutputStream(fileName + ".xlsx")) {
            workbook.write(outputStream);
            workbook.close();
            JOptionPane.showMessageDialog(null, "Sales report saved to Excel file successfully.", "Report Saved", JOptionPane.INFORMATION_MESSAGE);
        } catch (IOException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "Error saving the report to Excel file.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void addSheetData(Sheet sheet, DefaultTableModel model, String headerText) {
        // Adding table header
        Row headerRow = sheet.createRow(0);
        Cell headerCell = headerRow.createCell(0);
        headerCell.setCellValue(headerText);
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, model.getColumnCount() - 1)); // Merge cells for the header

        // Adding column headers
        Row columnHeaderRow = sheet.createRow(1);
        for (int i = 0; i < model.getColumnCount(); i++) {
            Cell cell = columnHeaderRow.createCell(i);
            cell.setCellValue(model.getColumnName(i));
        }

        // Adding data
        for (int i = 0; i < model.getRowCount(); i++) {
            Row row = sheet.createRow(i + 2);
            for (int j = 0; j < model.getColumnCount(); j++) {
                Cell cell = row.createCell(j);
                Object value = model.getValueAt(i, j);
                if (value instanceof Number) {
                    cell.setCellValue(((Number) value).doubleValue());
                } else if (value instanceof Boolean) {
                    cell.setCellValue((Boolean) value);
                } else {
                    cell.setCellValue(value.toString());
                }
            }
        }

        // Auto-size columns to fit the content
        for (int i = 0; i < model.getColumnCount(); i++) {
            sheet.autoSizeColumn(i);
        }
    }

    /**
     * Establishes Connection to the database
     */
    private Connection connect() throws SQLException {
        String url1 = "jdbc:mysql://localhost:3306/prj_tan";
        String url2 = "jdbc:mysql://localhost:3306/prj_yanez"; // <-- Put Your Database Name Here
        String username = "root";
        String password = ""; 

        try {
            return DriverManager.getConnection(url1, username, password);
        } catch (SQLException e1) {
            System.out.println("Failed to connect to prj_tan, attempting to connect to prj_yanez...");
            try {
                return DriverManager.getConnection(url2, username, password);
            } catch (SQLException e2) {
                System.err.println("Failed to connect to both prj_tan and prj_yanez.");
                e2.printStackTrace();
                throw e2;  // rethrow the last exception
            }
        }
    }

    private static final String FILTER_FILE = "srfilter.txt";

    public void updateSalesReportTable() {
        Map<String, String> filter = readSalesReportFilter();
        String query = constructQuery(filter);
        System.out.println(query);

        try (Connection conn = connect();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query)) {

            DefaultTableModel tableModel = (DefaultTableModel) salesReportTable.getModel();
            tableModel.setRowCount(0); // Clear existing rows

            while (rs.next()) {
                Object[] row = {
                        rs.getInt("transaction_ID"),
                        rs.getDouble("transaction_TotalPrice"),
                        rs.getString("cashier"),
                        rs.getTimestamp("transaction_Date"),
                        rs.getString("transaction_OrderStatus")
                };
                tableModel.addRow(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProductSalesReportTable() {

        if (salesReportTable.getModel().getRowCount() == 0) {
            product_TableModel.setRowCount(0);
            return; // Exit method if the table is empty
        }


        Set<Integer> transactionIds = new HashSet<>();

        // Get all transaction IDs from the sales report table
        DefaultTableModel salesReportModel = (DefaultTableModel) salesReportTable.getModel();
        for (int i = 0; i < salesReportModel.getRowCount(); i++) {
            transactionIds.add((Integer) salesReportModel.getValueAt(i, 0));
        }

        Map<String, String> filter = readSalesReportFilter();
        String fromDate = filter.get("dateSelectRange.fromDate");
        String toDate = filter.get("dateSelectRange.toDate");

        String query = "SELECT p.product_ID, p.product_name, SUM(i.product_quantity) AS quantity, " +
                "SUM(i.product_quantity * p.product_price) AS totalSales " +
                "FROM tbl_item i " +
                "JOIN tbl_product p ON i.product_ID = p.product_ID " +
                "JOIN tbl_transaction t ON i.transaction_ID = t.transaction_ID " +
                "WHERE t.transaction_ID IN (" + transactionIds.stream().map(String::valueOf).collect(Collectors.joining(",")) + ") " +
                "AND t.transaction_Date BETWEEN '" + fromDate + "' AND '" + toDate + "' " +
                "GROUP BY p.product_ID, p.product_name " +
                "ORDER BY totalSales DESC";

        try (Connection conn = connect();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query)) {

            DefaultTableModel productTableModel = (DefaultTableModel) product_Table.getModel();
            productTableModel.setRowCount(0); // Clear existing rows

            while (rs.next()) {
                Object[] row = {
                        rs.getInt("product_ID"),
                        rs.getString("product_name"),
                        rs.getInt("quantity"),
                        rs.getDouble("totalSales")
                };
                productTableModel.addRow(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void resetSalesReportFilter() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILTER_FILE))) {
            writer.write("dateSelectRange.fromDate = " + LocalDate.now() + "\n");
            writer.write("dateSelectRange.toDate = " + LocalDate.now().plusDays(1) + "\n");
            writer.write("orderStatus.showStatus = paid\n");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public Map<String, String> readSalesReportFilter() {
        Map<String, String> filterValues = new HashMap<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILTER_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("=");
                if (parts.length == 2) {
                    filterValues.put(parts[0].trim(), parts[1].trim());
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return filterValues;
    }

    public String constructQuery(Map<String, String> filter) {
        String fromDate = filter.getOrDefault("dateSelectRange.fromDate", "1970-01-01");
        String toDate = filter.getOrDefault("dateSelectRange.toDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        String showStatus = filter.getOrDefault("orderStatus.showStatus", "paid");

        String query = "SELECT t.transaction_ID, t.transaction_TotalPrice, " +
        "CONCAT(e.employee_FirstName, ' ', e.employee_LastName) AS cashier, " +
        "t.transaction_Date, t.transaction_OrderStatus " +
        "FROM tbl_transaction t " +
        "JOIN tbl_employee e ON t.employee_ID = e.employee_ID " +

        "WHERE t.transaction_Date BETWEEN '" + fromDate + "' AND '" + toDate + "' " +
        "AND t.transaction_OrderStatus IN ('" + showStatus + "') " +
        "AND t.transaction_ActiveStatus = 'active'";

        System.out.println("Report Query: " + query.toString());
        return query;
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
