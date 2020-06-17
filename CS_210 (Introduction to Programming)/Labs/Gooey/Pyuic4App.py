"""CS 210, Introduction to Programming, Fall 2015, Dr. Bower.

Documentation: None.

This file contains a graphical interface to the Pyuic4 command line tool.
"""

from PyQt4 import QtGui
from os import system
import sys


def main():
    """Launch a GUI created with Qt Designer."""
    # Create a QApplication to handle event processing.
    qt_app = QtGui.QApplication( sys.argv )

    # Create an instance of the app and show the main window.
    my_app = Pyuic4App()
    my_app.main_window.show()

    # Execute the QApplication, exiting when it returns (i.e., the window is closed).
    sys.exit( qt_app.exec_() )  # Note the underscore at the end of exec_().


class Pyuic4App:
    """Application class to create and control the gui."""

    def __init__( self ):
        """Initialize the gui."""
        # Create the main window in which our gui will display.
        self.main_window = QtGui.QWidget()

        # Create an instance of our gui and set it up in the main window.
        self.gui = Ui_Pyuic4Gui()
        self.gui.setupUi( self.main_window )

        # Set the connections between the gui and this app object.
        self.gui.source_browse_button.clicked.connect( self.source_browse )
        self.gui.target_browse_button.clicked.connect( self.target_browse )
        self.gui.generate_button.clicked.connect( self.generate )
        self.gui.source_checkbox.stateChanged.connect( self.copy_source_to_target )

        # Have the main window's closeEvent method call this application's close_event
        # method instead so the user can be asked if they really want to quit.
        self.main_window.closeEvent = self.close_event

        # Save the directories for the source and target files so subsequent
        # clicks on the Browse button remember the previous file location.
        self.source_dir = "./"
        self.target_dir = "./"

    def source_browse( self ):
        """Use a QFileDialog to find the source file."""
        # Use the QFileDialog to get the .ui file name.
        file_name = QtGui.QFileDialog.getOpenFileName( self.main_window, "Open ui file...", self.source_dir, "*.ui" )
        # Make sure the user didn't click Cancel.
        if file_name != "" and file_name.endswith( ".ui" ):
            # Put the selected file name in the text field.
            self.gui.source_filename.setText( file_name )
            self.copy_source_to_target()

            # Save the directory so subsequent clicks on Browse start in the same place.
            self.source_dir = file_name[ :file_name.rfind( "/" ) + 1 ]

    def copy_source_to_target( self ):
        """Check the Use Source Name as Target Name checkbox and react appropriately."""
        if self.gui.source_checkbox.isChecked():
            file_name = self.gui.source_filename.text()
            if file_name != "":
                self.gui.target_filename.setText( file_name[ :-2 ] + "py" )
                self.target_dir = self.source_dir
        else:
            self.gui.target_filename.setText( "" )

    def target_browse( self ):
        """Use a QFileDialog to specify the target file."""
        # Use the QFileDialog to get the file name and put it in the text view.
        file_name = QtGui.QFileDialog.getSaveFileName( self.main_window, "Select py file...", self.target_dir, "*.py" )
        # Make sure the user didn't click Cancel.
        if file_name != "" and file_name.endswith( ".py" ):
            # Put the selected file name in the text field.
            self.gui.target_filename.setText( file_name )

            # Save the directory so subsequent clicks on Browse start in the same place.
            self.target_dir = file_name[ : file_name.rfind( "/" ) + 1 ]

    def generate( self ):
        """Use the pyuic4.bat command to generate the Python source file from the ui file."""
        # Do a bit of error checking before building the command.
        if self.gui.source_filename.text() == "":
            QtGui.QMessageBox.warning( self.main_window, "Error", "Source (.ui) file not specified...", QtGui.QMessageBox.Close )
            return

        if self.gui.target_filename.text() == "":
            QtGui.QMessageBox.warning( self.main_window, "Error", "Target (.py) file not specified...", QtGui.QMessageBox.Close )
            return

        # Build the command to generate the Python source file.
        command = 'pyuic4 "{0}" -o "{1}"'.format( self.gui.source_filename.text(), self.gui.target_filename.text() )

        reply = QtGui.QMessageBox.No
        if self.gui.confirm_checkbox.isChecked():
            reply = QtGui.QMessageBox.question( self.main_window, "Question", "Execute the following?\n\n" + command, QtGui.QMessageBox.Yes, QtGui.QMessageBox.No )

        if not self.gui.confirm_checkbox.isChecked() or reply == QtGui.QMessageBox.Yes:
            print( "Executing...", flush=True )
            print( command, flush=True )
            system( command )
            print( "Done.\n", flush=True )

    def close_event( self, event ):
        """Confirm application exit."""
        # http://stackoverflow.com/questions/1414781/prompt-on-exit-in-pyqt-application
        quit_msg = "Are you sure you want to exit the program?"
        reply = QtGui.QMessageBox.question( self.main_window, "Question", quit_msg, QtGui.QMessageBox.Yes, QtGui.QMessageBox.No )
        if reply == QtGui.QMessageBox.Yes:
            event.accept()
        else:
            event.ignore()

# ################################################################### #
# The code below here is normally in a separate file, but is included #
# here to distribute this tool as a stand-alone, usable, application. #
# ################################################################### #

# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'Pyuic4Gui.ui'
#
# Created: Mon Oct 20 11:53:18 2014
#      by: PyQt4 UI code generator 4.11.2
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)

class Ui_Pyuic4Gui(object):
    def setupUi(self, Pyuic4Gui):
        Pyuic4Gui.setObjectName(_fromUtf8("Pyuic4Gui"))
        Pyuic4Gui.resize(640, 320)
        font = QtGui.QFont()
        font.setPointSize(12)
        Pyuic4Gui.setFont(font)
        self.gui_layout = QtGui.QVBoxLayout(Pyuic4Gui)
        self.gui_layout.setObjectName(_fromUtf8("gui_layout"))
        spacerItem = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Expanding)
        self.gui_layout.addItem(spacerItem)
        self.main_layout = QtGui.QVBoxLayout()
        self.main_layout.setObjectName(_fromUtf8("main_layout"))
        spacerItem1 = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Expanding)
        self.main_layout.addItem(spacerItem1)
        self.title_layout = QtGui.QHBoxLayout()
        self.title_layout.setObjectName(_fromUtf8("title_layout"))
        self.title_label = QtGui.QLabel(Pyuic4Gui)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Preferred, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.title_label.sizePolicy().hasHeightForWidth())
        self.title_label.setSizePolicy(sizePolicy)
        font = QtGui.QFont()
        font.setPointSize(18)
        self.title_label.setFont(font)
        self.title_label.setAlignment(QtCore.Qt.AlignCenter)
        self.title_label.setObjectName(_fromUtf8("title_label"))
        self.title_layout.addWidget(self.title_label)
        self.main_layout.addLayout(self.title_layout)
        spacerItem2 = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Expanding)
        self.main_layout.addItem(spacerItem2)
        self.source_layout = QtGui.QHBoxLayout()
        self.source_layout.setObjectName(_fromUtf8("source_layout"))
        self.source_label = QtGui.QLabel(Pyuic4Gui)
        self.source_label.setObjectName(_fromUtf8("source_label"))
        self.source_layout.addWidget(self.source_label)
        self.source_filename = QtGui.QLineEdit(Pyuic4Gui)
        self.source_filename.setObjectName(_fromUtf8("source_filename"))
        self.source_layout.addWidget(self.source_filename)
        self.source_browse_button = QtGui.QPushButton(Pyuic4Gui)
        font = QtGui.QFont()
        font.setPointSize(10)
        font.setItalic(True)
        self.source_browse_button.setFont(font)
        self.source_browse_button.setObjectName(_fromUtf8("source_browse_button"))
        self.source_layout.addWidget(self.source_browse_button)
        self.main_layout.addLayout(self.source_layout)
        spacerItem3 = QtGui.QSpacerItem(20, 20, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        self.main_layout.addItem(spacerItem3)
        self.target_layout = QtGui.QHBoxLayout()
        self.target_layout.setObjectName(_fromUtf8("target_layout"))
        self.target_label = QtGui.QLabel(Pyuic4Gui)
        self.target_label.setObjectName(_fromUtf8("target_label"))
        self.target_layout.addWidget(self.target_label)
        self.target_filename = QtGui.QLineEdit(Pyuic4Gui)
        self.target_filename.setObjectName(_fromUtf8("target_filename"))
        self.target_layout.addWidget(self.target_filename)
        self.target_browse_button = QtGui.QPushButton(Pyuic4Gui)
        font = QtGui.QFont()
        font.setPointSize(10)
        font.setItalic(True)
        self.target_browse_button.setFont(font)
        self.target_browse_button.setObjectName(_fromUtf8("target_browse_button"))
        self.target_layout.addWidget(self.target_browse_button)
        self.main_layout.addLayout(self.target_layout)
        spacerItem4 = QtGui.QSpacerItem(20, 20, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        self.main_layout.addItem(spacerItem4)
        self.control_layout = QtGui.QHBoxLayout()
        self.control_layout.setObjectName(_fromUtf8("control_layout"))
        spacerItem5 = QtGui.QSpacerItem(120, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.control_layout.addItem(spacerItem5)
        self.generate_button = QtGui.QPushButton(Pyuic4Gui)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Expanding)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.generate_button.sizePolicy().hasHeightForWidth())
        self.generate_button.setSizePolicy(sizePolicy)
        self.generate_button.setObjectName(_fromUtf8("generate_button"))
        self.control_layout.addWidget(self.generate_button)
        spacerItem6 = QtGui.QSpacerItem(20, 20, QtGui.QSizePolicy.Fixed, QtGui.QSizePolicy.Minimum)
        self.control_layout.addItem(spacerItem6)
        self.options_layout = QtGui.QVBoxLayout()
        self.options_layout.setObjectName(_fromUtf8("options_layout"))
        self.source_checkbox = QtGui.QCheckBox(Pyuic4Gui)
        font = QtGui.QFont()
        font.setPointSize(10)
        self.source_checkbox.setFont(font)
        self.source_checkbox.setChecked(True)
        self.source_checkbox.setObjectName(_fromUtf8("source_checkbox"))
        self.options_layout.addWidget(self.source_checkbox)
        self.confirm_checkbox = QtGui.QCheckBox(Pyuic4Gui)
        font = QtGui.QFont()
        font.setPointSize(10)
        self.confirm_checkbox.setFont(font)
        self.confirm_checkbox.setChecked(True)
        self.confirm_checkbox.setObjectName(_fromUtf8("confirm_checkbox"))
        self.options_layout.addWidget(self.confirm_checkbox)
        self.control_layout.addLayout(self.options_layout)
        spacerItem7 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.control_layout.addItem(spacerItem7)
        self.main_layout.addLayout(self.control_layout)
        spacerItem8 = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Expanding)
        self.main_layout.addItem(spacerItem8)
        self.gui_layout.addLayout(self.main_layout)
        spacerItem9 = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Expanding)
        self.gui_layout.addItem(spacerItem9)

        self.retranslateUi(Pyuic4Gui)
        QtCore.QMetaObject.connectSlotsByName(Pyuic4Gui)

    def retranslateUi(self, Pyuic4Gui):
        Pyuic4Gui.setWindowTitle(_translate("Pyuic4Gui", "Pyuic4 Gui", None))
        self.title_label.setText(_translate("Pyuic4Gui", "PyQt Designer User Interface Compiler", None))
        self.source_label.setText(_translate("Pyuic4Gui", "Source (.ui) File:", None))
        self.source_browse_button.setText(_translate("Pyuic4Gui", "Browse...", None))
        self.target_label.setText(_translate("Pyuic4Gui", "Target (.py) File:", None))
        self.target_browse_button.setText(_translate("Pyuic4Gui", "Browse...", None))
        self.generate_button.setText(_translate("Pyuic4Gui", "Generate Target File", None))
        self.source_checkbox.setText(_translate("Pyuic4Gui", "Use Source name as Target name.", None))
        self.confirm_checkbox.setText(_translate("Pyuic4Gui", "Confirm before generating Target", None))


# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()
