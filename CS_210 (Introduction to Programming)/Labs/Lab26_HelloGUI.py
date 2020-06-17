# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'C:/Users/Randall.Bower/Documents/Courses/CS210/USAFA_CS210_2015_Working/Labs/Gooey/HelloGui.ui'
#
# Created: Fri Oct 23 09:37:01 2015
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

class Ui_HelloGui(object):
    def setupUi(self, HelloGui):
        HelloGui.setObjectName(_fromUtf8("HelloGui"))
        HelloGui.resize(320, 240)
        self.horizontalLayout_2 = QtGui.QHBoxLayout(HelloGui)
        self.horizontalLayout_2.setObjectName(_fromUtf8("horizontalLayout_2"))
        self.main_layout = QtGui.QHBoxLayout()
        self.main_layout.setObjectName(_fromUtf8("main_layout"))
        self.hello_label = QtGui.QLabel(HelloGui)
        font = QtGui.QFont()
        font.setPointSize(32)
        self.hello_label.setFont(font)
        self.hello_label.setAlignment(QtCore.Qt.AlignCenter)
        self.hello_label.setObjectName(_fromUtf8("hello_label"))
        self.main_layout.addWidget(self.hello_label)
        self.horizontalLayout_2.addLayout(self.main_layout)

        self.retranslateUi(HelloGui)
        QtCore.QMetaObject.connectSlotsByName(HelloGui)

    def retranslateUi(self, HelloGui):
        HelloGui.setWindowTitle(_translate("HelloGui", "Hello", None))
        self.hello_label.setText(_translate("HelloGui", "Hello, World!", None))
