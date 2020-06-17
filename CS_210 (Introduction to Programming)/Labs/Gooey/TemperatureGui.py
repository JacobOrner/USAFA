# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'TemperatureGui.ui'
#
# Created by: PyQt4 UI code generator 4.11.4
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

class Ui_TemperatureGui(object):
    def setupUi(self, TemperatureGui):
        TemperatureGui.setObjectName(_fromUtf8("TemperatureGui"))
        TemperatureGui.resize(400, 300)
        self.verticalLayout_2 = QtGui.QVBoxLayout(TemperatureGui)
        self.verticalLayout_2.setObjectName(_fromUtf8("verticalLayout_2"))
        self.main_layout = QtGui.QVBoxLayout()
        self.main_layout.setObjectName(_fromUtf8("main_layout"))
        self.top_layout = QtGui.QHBoxLayout()
        self.top_layout.setObjectName(_fromUtf8("top_layout"))
        self.main_layout.addLayout(self.top_layout)
        self.middle_layout = QtGui.QHBoxLayout()
        self.middle_layout.setObjectName(_fromUtf8("middle_layout"))
        self.left_layout = QtGui.QVBoxLayout()
        self.left_layout.setObjectName(_fromUtf8("left_layout"))
        spacerItem = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        self.left_layout.addItem(spacerItem)
        self.fahrenheit_edit = QtGui.QLineEdit(TemperatureGui)
        self.fahrenheit_edit.setObjectName(_fromUtf8("fahrenheit_edit"))
        self.left_layout.addWidget(self.fahrenheit_edit)
        self.fahrenheit_label = QtGui.QLabel(TemperatureGui)
        font = QtGui.QFont()
        font.setItalic(True)
        self.fahrenheit_label.setFont(font)
        self.fahrenheit_label.setAlignment(QtCore.Qt.AlignCenter)
        self.fahrenheit_label.setObjectName(_fromUtf8("fahrenheit_label"))
        self.left_layout.addWidget(self.fahrenheit_label)
        spacerItem1 = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        self.left_layout.addItem(spacerItem1)
        self.middle_layout.addLayout(self.left_layout)
        self.center_layout = QtGui.QVBoxLayout()
        self.center_layout.setObjectName(_fromUtf8("center_layout"))
        spacerItem2 = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        self.center_layout.addItem(spacerItem2)
        self.f_to_c_button = QtGui.QPushButton(TemperatureGui)
        self.f_to_c_button.setObjectName(_fromUtf8("f_to_c_button"))
        self.center_layout.addWidget(self.f_to_c_button)
        self.c_to_f_button = QtGui.QPushButton(TemperatureGui)
        self.c_to_f_button.setObjectName(_fromUtf8("c_to_f_button"))
        self.center_layout.addWidget(self.c_to_f_button)
        spacerItem3 = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        self.center_layout.addItem(spacerItem3)
        self.middle_layout.addLayout(self.center_layout)
        self.right_layout = QtGui.QVBoxLayout()
        self.right_layout.setObjectName(_fromUtf8("right_layout"))
        spacerItem4 = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        self.right_layout.addItem(spacerItem4)
        self.celsius_edit = QtGui.QLineEdit(TemperatureGui)
        self.celsius_edit.setObjectName(_fromUtf8("celsius_edit"))
        self.right_layout.addWidget(self.celsius_edit)
        self.celsius_label = QtGui.QLabel(TemperatureGui)
        font = QtGui.QFont()
        font.setItalic(True)
        self.celsius_label.setFont(font)
        self.celsius_label.setAlignment(QtCore.Qt.AlignCenter)
        self.celsius_label.setObjectName(_fromUtf8("celsius_label"))
        self.right_layout.addWidget(self.celsius_label)
        spacerItem5 = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        self.right_layout.addItem(spacerItem5)
        self.middle_layout.addLayout(self.right_layout)
        self.main_layout.addLayout(self.middle_layout)
        self.bottom_layout = QtGui.QHBoxLayout()
        self.bottom_layout.setObjectName(_fromUtf8("bottom_layout"))
        self.main_layout.addLayout(self.bottom_layout)
        self.verticalLayout_2.addLayout(self.main_layout)

        self.retranslateUi(TemperatureGui)
        QtCore.QMetaObject.connectSlotsByName(TemperatureGui)

    def retranslateUi(self, TemperatureGui):
        TemperatureGui.setWindowTitle(_translate("TemperatureGui", "Temperature Converter", None))
        self.fahrenheit_label.setText(_translate("TemperatureGui", "Fahrenheit Temperature", None))
        self.f_to_c_button.setText(_translate("TemperatureGui", "F to C --->", None))
        self.c_to_f_button.setText(_translate("TemperatureGui", "<--- C to F", None))
        self.celsius_label.setText(_translate("TemperatureGui", "Celsius Temperature", None))

