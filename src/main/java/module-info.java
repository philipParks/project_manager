module com.booyesum.project_manager {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.booyesum.project_manager to javafx.fxml;
    exports com.booyesum.project_manager;
    exports com.booyesum.project_manager.controller;
    opens com.booyesum.project_manager.controller to javafx.fxml;
}