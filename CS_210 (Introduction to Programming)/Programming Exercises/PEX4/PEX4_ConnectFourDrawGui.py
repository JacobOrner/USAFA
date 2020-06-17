# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'C:/Users/C18Jacob.Orner/Documents/Schoolwork/USAFA_CS210_2015/PEXes/PEX4/ConnectFourDrawGui.ui'
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

class Ui_ConnectFour(object):
    def setupUi(self, ConnectFour):
        ConnectFour.setObjectName(_fromUtf8("ConnectFour"))
        ConnectFour.resize(480, 500)
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
        ConnectFour.setPalette(palette)
        self.gui_layout = QtGui.QVBoxLayout(ConnectFour)
        self.gui_layout.setObjectName(_fromUtf8("gui_layout"))
        self.main_layout = QtGui.QVBoxLayout()
        self.main_layout.setObjectName(_fromUtf8("main_layout"))
        self.status_label = QtGui.QLabel(ConnectFour)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Preferred, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.status_label.sizePolicy().hasHeightForWidth())
        self.status_label.setSizePolicy(sizePolicy)
        self.status_label.setMinimumSize(QtCore.QSize(0, 20))
        self.status_label.setMaximumSize(QtCore.QSize(16777215, 20))
        font = QtGui.QFont()
        font.setPointSize(14)
        self.status_label.setFont(font)
        self.status_label.setAlignment(QtCore.Qt.AlignCenter)
        self.status_label.setObjectName(_fromUtf8("status_label"))
        self.main_layout.addWidget(self.status_label)
        self.drawing_widget = QtGui.QWidget(ConnectFour)
        self.drawing_widget.setObjectName(_fromUtf8("drawing_widget"))
        self.main_layout.addWidget(self.drawing_widget)
        self.gui_layout.addLayout(self.main_layout)

        self.retranslateUi(ConnectFour)
        QtCore.QMetaObject.connectSlotsByName(ConnectFour)

    def retranslateUi(self, ConnectFour):
        ConnectFour.setWindowTitle(_translate("ConnectFour", "Connect Four", None))
        self.status_label.setText(_translate("ConnectFour", "Red\'s turn...", None))

