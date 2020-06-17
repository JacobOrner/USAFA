from Crypto_GR_Files import Ui_MainWindow as Gui
from PyQt4 import QtCore, QtGui
import sys
import CryptoFunctions as John


def main():
    """Launch a GUI created with Qt Designer."""
    # Create a QApplication to handle event processing.
    qt_app = QtGui.QApplication(sys.argv)

    # Create an instance of the app and show the main window.
    my_app = App()
    my_app.main_window.show()

    # Execute the QApplication, exiting when it returns (i.e., the window is closed).
    sys.exit(qt_app.exec_())  # Note the underscore at the end of exec_().


class App:
    """Application class to create and control the gui."""

    def __init__( self ):
        """Initialize the gui."""
        # Create the main window in which our gui will display.

        self.main_window = QtGui.QMainWindow()  # QMainWindow() for menu and status bar.

        # Create an instance of our gui and set it up in the main window.
        self.gui = Gui()  # Generic name "Gui" from "as Gui" clause of import statement.
        self.gui.setupUi(self.main_window)
        self.john = John.A()

        self.gui.alphabet_label.setText(self.john.get_alphabet())
        self.gui.method_box.addItem("Caesar")
        self.gui.method_box.addItem("Affine")
        self.gui.method_box.addItem("Vignere")
        self.gui.en_de_crypt_box.addItem("Encrypt")
        self.gui.en_de_crypt_box.addItem("Decrypt")
        self.gui.crypt_button.clicked.connect(self.crypt)
        self.gui.action_notes.triggered.connect(self.notes)
        self.gui.actionChange_Alphabet.triggered.connect(self.change_alphabet)
        self.gui.actionBrute_Force_Casaer.triggered.connect(self.brute_force)
        self.gui.actionGCD.triggered.connect(self.gcd)
        self.gui.actionModular_Inverse.triggered.connect(self.modular_inverse)
        self.gui.actionLarge_Exponent.triggered.connect(self.large_exponent)
        self.gui.actionProbable_Shift_Vignere.triggered.connect(self.probable_shift)
        self.gui.actionProbable_Key_Vignere.triggered.connect(self.probable_key)
        self.gui.actionFind_ax_r_mod.triggered.connect(self.ax_mod)
        self.gui.actionFind_ax_2_r_mod.triggered.connect(self.ax_squared_mod)
        self.gui.actionGauss.triggered.connect(self.gauss)
        self.gui.actionEntropy.triggered.connect(self.entropy)

    def change_alphabet(self):
        msg = QtGui.QInputDialog().getText(self.main_window, "Change Alphabet", "Letters")
        self.john.set_alphabet(msg[0])
        self.gui.alphabet_label.setText(self.john.get_alphabet())

    def brute_force(self):
        msg = QtGui.QInputDialog().getText(self.main_window, "Brute Forcer", "Message")
        QtGui.QMessageBox.information(self.main_window, "Results", John.pretty_print_caesar(msg[0]))

    def gcd(self):
        num1 = QtGui.QInputDialog().getInt(self.main_window, "GCD", "Number")
        num2 = QtGui.QInputDialog().getInt(self.main_window, "GCD", "MOD")
        QtGui.QMessageBox.information(self.main_window, "Results", str(John.gcd(num1[0], num2[0])))

    def modular_inverse(self):
        num1 = QtGui.QInputDialog().getInt(self.main_window, "Modular Inverse", "Number 1")
        num2 = QtGui.QInputDialog().getInt(self.main_window, "Modular Inverse", "Number 2")
        QtGui.QMessageBox.information(self.main_window, "Results", str(John.modular_inverse(num1[0], num2[0])))

    def large_exponent(self):
        b = QtGui.QInputDialog().getInt(self.main_window, "Large Exponent", "Base")
        e = QtGui.QInputDialog().getInt(self.main_window, "Large Exponent", "Exponent")
        m = QtGui.QInputDialog().getInt(self.main_window, "Large Exponent", "MOD")
        QtGui.QMessageBox.information(self.main_window, "Results", str(John.big_exponent(b[0], e[0], m[0])))

    def probable_shift(self):
        msg = QtGui.QInputDialog().getText(self.main_window, "Probable Vignere Shift", "Message")
        b = QtGui.QInputDialog().getInt(self.main_window, "Probable Vignere Shift", "Limit")
        QtGui.QMessageBox.information(self.main_window, "Results", str(John.probable_shift_vignere(msg[0], b[0])))

    def probable_key(self):
        msg = QtGui.QInputDialog().getText(self.main_window, "Probable Vignere Key", "Message")
        b = QtGui.QInputDialog().getInt(self.main_window, "Probable Vignere Key", "Key Length")
        QtGui.QMessageBox.information(self.main_window, "Results", str(John.pretty_results(msg[0], b[0])))

    def ax_mod(self):
        a = QtGui.QInputDialog().getInt(self.main_window, "a * x = r (mod)", "a")
        remainder = QtGui.QInputDialog().getInt(self.main_window, "a * x = r (mod)", "r")
        mod = QtGui.QInputDialog().getInt(self.main_window, "a * x = r (mod)", "MOD")
        limit = QtGui.QInputDialog().getInt(self.main_window, "a * x = r (mod)", "Limit (0 to set limit to mod)")
        QtGui.QMessageBox.information(self.main_window, "Results", "List: " + str(John.almost_modular_inverse(a[0], remainder[0], mod[0], limit[0])))

    def ax_squared_mod(self):
        a = QtGui.QInputDialog().getInt(self.main_window, "a * x^2 = r (mod)", "a")
        remainder = QtGui.QInputDialog().getInt(self.main_window, "a * x^2 = r (mod)", "r")
        mod = QtGui.QInputDialog().getInt(self.main_window, "a * x^2 = r (mod)", "MOD")
        QtGui.QMessageBox.information(self.main_window, "Results", "List: " + str(John.almost_modular_inverse_squared(remainder[0], mod[0], a[0])))

    def gauss(self):
        QtGui.QMessageBox.information(self.main_window, "Error", "Must complete from within program\nFunctionality coming soon.")

    def entropy(self):
        QtGui.QMessageBox.information(self.main_window, "Error", "Must complete from within program\nFunctionality coming soon.")

    def notes(self):
        QtGui.QMessageBox.information(self.main_window, "Notes", John.notes())

    def crypt(self):
        method = self.gui.method_box.currentText()
        en_or_de = self.gui.en_de_crypt_box.currentText()
        alpha_shift = self.gui.alpha_or_shift.toPlainText()
        beta_or_key = self.gui.beta.toPlainText()
        cipher_or_plain = self.gui.cipher_plain_text.toPlainText()
        if method == "Caesar" and en_or_de == "Encrypt" and alpha_shift != "" and cipher_or_plain != "":
            self.gui.output_label.setText(John.encrypt_caesar(cipher_or_plain, int(alpha_shift)))
        elif method == "Caesar" and en_or_de == "Decrypt" and alpha_shift != "" and cipher_or_plain != "":
            self.gui.output_label.setText(John.decrypt_caesar(cipher_or_plain, int(alpha_shift)))
        elif method == "Affine" and en_or_de == "Encrypt" and alpha_shift != "" and beta_or_key != "" and cipher_or_plain != "":
            self.gui.output_label.setText(John.encrypt_affine(cipher_or_plain, int(alpha_shift), int(beta_or_key)))
        elif method == "Affine" and en_or_de == "Decrypt" and alpha_shift != "" and beta_or_key != "" and cipher_or_plain != "":
            self.gui.output_label.setText(John.decrypt_affine(cipher_or_plain, int(alpha_shift), int(beta_or_key)))
        elif method == "Vignere" and en_or_de == "Encrypt" and beta_or_key != "" and cipher_or_plain != "":
            self.gui.output_label.setText(John.encrypt_vignere(cipher_or_plain, int(beta_or_key)))
        elif method == "Vignere" and en_or_de == "Decrypt" and beta_or_key != "" and cipher_or_plain != "":
            self.gui.output_label.setText(John.decrypt_vignere(cipher_or_plain, int(beta_or_key)))
        else:
            self.gui.output_label.setText("Unable to complete function.")


if __name__ == "__main__":
    main()