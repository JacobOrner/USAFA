# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'CounterGUI.ui'
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

class Ui_CounterGUI(object):
    def setupUi(self, CounterGUI):
        CounterGUI.setObjectName(_fromUtf8("CounterGUI"))
        CounterGUI.resize(400, 300)
        self.verticalLayout = QtGui.QVBoxLayout(CounterGUI)
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.main_layout = QtGui.QVBoxLayout()
        self.main_layout.setObjectName(_fromUtf8("main_layout"))
        self.count_layout = QtGui.QHBoxLayout()
        self.count_layout.setObjectName(_fromUtf8("count_layout"))
        self.count_label = QtGui.QLabel(CounterGUI)
        font = QtGui.QFont()
        font.setPointSize(32)
        self.count_label.setFont(font)
        self.count_label.setAlignment(QtCore.Qt.AlignCenter)
        self.count_label.setObjectName(_fromUtf8("count_label"))
        self.count_layout.addWidget(self.count_label)
        self.main_layout.addLayout(self.count_layout)
        self.button_layout = QtGui.QHBoxLayout()
        self.button_layout.setObjectName(_fromUtf8("button_layout"))
        spacerItem = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.button_layout.addItem(spacerItem)
        self.increment_button = QtGui.QPushButton(CounterGUI)
        font = QtGui.QFont()
        font.setPointSize(24)
        self.increment_button.setFont(font)
        self.increment_button.setObjectName(_fromUtf8("increment_button"))
        self.button_layout.addWidget(self.increment_button)
        spacerItem1 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Fixed, QtGui.QSizePolicy.Minimum)
        self.button_layout.addItem(spacerItem1)
        self.reset_button = QtGui.QPushButton(CounterGUI)
        font = QtGui.QFont()
        font.setPointSize(12)
        self.reset_button.setFont(font)
        self.reset_button.setObjectName(_fromUtf8("reset_button"))
        self.button_layout.addWidget(self.reset_button)
        spacerItem2 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Fixed, QtGui.QSizePolicy.Minimum)
        self.button_layout.addItem(spacerItem2)
        self.decrement_button = QtGui.QPushButton(CounterGUI)
        font = QtGui.QFont()
        font.setPointSize(24)
        self.decrement_button.setFont(font)
        self.decrement_button.setObjectName(_fromUtf8("decrement_button"))
        self.button_layout.addWidget(self.decrement_button)
        spacerItem3 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.button_layout.addItem(spacerItem3)
        self.main_layout.addLayout(self.button_layout)
        self.verticalLayout.addLayout(self.main_layout)

        self.retranslateUi(CounterGUI)
        QtCore.QMetaObject.connectSlotsByName(CounterGUI)

    def retranslateUi(self, CounterGUI):
        CounterGUI.setWindowTitle(_translate("CounterGUI", "Counter", None))
        self.count_label.setText(_translate("CounterGUI", "0", None))
        self.increment_button.setText(_translate("CounterGUI", "+", None))
        self.reset_button.setText(_translate("CounterGUI", "Reset", None))
        self.decrement_button.setText(_translate("CounterGUI", "-", None))

