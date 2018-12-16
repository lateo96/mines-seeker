import QtQuick.Controls 2.12

Dialog {
    id: confirmModeChangeDialog

    anchors.centerIn: parent

    implicitWidth: 400

    focus: true
    modal: true
    title: qsTr("Confirm mode change")
    standardButtons: Dialog.Yes | Dialog.No

    Label {
        elide: Label.ElideRight
        text: qsTr("<b><i>Changing the mode will end the current game.</i></b><br>" +
                   "Continue?")
    }

    onAccepted: {
        arcade.changeMode(gameMenu.gameMenuListView.currentIndex)
        gameMenu.close()
    }
    onRejected: {
        gameMenu.gameMenuListModel.setProperty(gameMode, "itemChecked", false)
        gameMenu.gameMenuListModel.setProperty(gameMode, "itemChecked", true)
        gameMenu.gameMenuListView.currentIndex = gameMode
    }
} // confirmModeChangeDialog
