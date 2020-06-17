# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'C:/Users/C18Jacob.Orner/Documents/Schoolwork/USAFA_CS210_2015/Labs/Gooey/PolygonGui.ui'
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

class Ui_PolygonGui(object):
    def setupUi(self, PolygonGui):
        PolygonGui.setObjectName(_fromUtf8("PolygonGui"))
        PolygonGui.resize(640, 480)
        palette = QtGui.QPalette()
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Active, QtGui.QPalette.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Active, QtGui.QPalette.Window, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Inactive, QtGui.QPalette.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Inactive, QtGui.QPalette.Window, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Disabled, QtGui.QPalette.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Disabled, QtGui.QPalette.Window, brush)
        PolygonGui.setPalette(palette)
        self.verticalLayout_2 = QtGui.QVBoxLayout(PolygonGui)
        self.verticalLayout_2.setObjectName(_fromUtf8("verticalLayout_2"))
        self.main_layout = QtGui.QVBoxLayout()
        self.main_layout.setObjectName(_fromUtf8("main_layout"))
        self.top_layout = QtGui.QHBoxLayout()
        self.top_layout.setObjectName(_fromUtf8("top_layout"))
        self.drawing_widget = QtGui.QWidget(PolygonGui)
        palette = QtGui.QPalette()
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Active, QtGui.QPalette.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Active, QtGui.QPalette.Window, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Inactive, QtGui.QPalette.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Inactive, QtGui.QPalette.Window, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Disabled, QtGui.QPalette.Base, brush)
        brush = QtGui.QBrush(QtGui.QColor(255, 255, 255))
        brush.setStyle(QtCore.Qt.SolidPattern)
        palette.setBrush(QtGui.QPalette.Disabled, QtGui.QPalette.Window, brush)
        self.drawing_widget.setPalette(palette)
        self.drawing_widget.setAutoFillBackground(True)
        self.drawing_widget.setObjectName(_fromUtf8("drawing_widget"))
        self.top_layout.addWidget(self.drawing_widget)
        self.main_layout.addLayout(self.top_layout)
        self.bottom_layout = QtGui.QHBoxLayout()
        self.bottom_layout.setObjectName(_fromUtf8("bottom_layout"))
        spacerItem = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.bottom_layout.addItem(spacerItem)
        self.triangle_button = QtGui.QPushButton(PolygonGui)
        self.triangle_button.setObjectName(_fromUtf8("triangle_button"))
        self.bottom_layout.addWidget(self.triangle_button)
        spacerItem1 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Fixed, QtGui.QSizePolicy.Minimum)
        self.bottom_layout.addItem(spacerItem1)
        self.square_button = QtGui.QPushButton(PolygonGui)
        self.square_button.setObjectName(_fromUtf8("square_button"))
        self.bottom_layout.addWidget(self.square_button)
        spacerItem2 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Fixed, QtGui.QSizePolicy.Minimum)
        self.bottom_layout.addItem(spacerItem2)
        self.rhombus_button = QtGui.QPushButton(PolygonGui)
        self.rhombus_button.setObjectName(_fromUtf8("rhombus_button"))
        self.bottom_layout.addWidget(self.rhombus_button)
        spacerItem3 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Fixed, QtGui.QSizePolicy.Minimum)
        self.bottom_layout.addItem(spacerItem3)
        self.blank_button = QtGui.QPushButton(PolygonGui)
        self.blank_button.setObjectName(_fromUtf8("blank_button"))
        self.bottom_layout.addWidget(self.blank_button)
        spacerItem4 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Fixed, QtGui.QSizePolicy.Minimum)
        self.bottom_layout.addItem(spacerItem4)
        self.button_layout = QtGui.QVBoxLayout()
        self.button_layout.setObjectName(_fromUtf8("button_layout"))
        spacerItem5 = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        self.button_layout.addItem(spacerItem5)
        self.replace_radio = QtGui.QRadioButton(PolygonGui)
        self.replace_radio.setChecked(True)
        self.replace_radio.setObjectName(_fromUtf8("replace_radio"))
        self.button_layout.addWidget(self.replace_radio)
        self.insert_radio = QtGui.QRadioButton(PolygonGui)
        self.insert_radio.setObjectName(_fromUtf8("insert_radio"))
        self.button_layout.addWidget(self.insert_radio)
        self.append_radio = QtGui.QRadioButton(PolygonGui)
        self.append_radio.setObjectName(_fromUtf8("append_radio"))
        self.button_layout.addWidget(self.append_radio)
        spacerItem6 = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        self.button_layout.addItem(spacerItem6)
        self.bottom_layout.addLayout(self.button_layout)
        self.main_layout.addLayout(self.bottom_layout)
        self.verticalLayout_2.addLayout(self.main_layout)

        self.retranslateUi(PolygonGui)
        QtCore.QMetaObject.connectSlotsByName(PolygonGui)

    def retranslateUi(self, PolygonGui):
        PolygonGui.setWindowTitle(_translate("PolygonGui", "Form", None))
        self.triangle_button.setText(_translate("PolygonGui", "Triangle", None))
        self.square_button.setText(_translate("PolygonGui", "Square", None))
        self.rhombus_button.setText(_translate("PolygonGui", "Rhombus", None))
        self.blank_button.setText(_translate("PolygonGui", "Blank", None))
        self.replace_radio.setText(_translate("PolygonGui", "Replace Closest Point", None))
        self.insert_radio.setText(_translate("PolygonGui", "Insert Before Closest Point", None))
        self.append_radio.setText(_translate("PolygonGui", "Append click point to end", None))

