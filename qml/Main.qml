/*
 * Copyright (C) 2021  test2
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * test2 is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.3

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'test2.test2'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
      id: mypage
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('test2')
        }

        Label {
            id:mylable
            anchors {
                top: header.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            text: i18n.tr('Check the logs!')

            verticalAlignment: Label.AlignVCenter
            horizontalAlignment: Label.AlignHCenter
        }

        Button {
            id: playButton
            height: parent.height*0.2
            width: parent.width * 0.3
            color: "red"
            text: "Press me"

            onClicked: {

                python.call('asdf.playVideo', [], function(returnValue) {
                    console.log('asdf.playVideo returned ' + returnValue);
                    mylable.text = returnValue
            });
        }
       }


    Python {
        id: python

        Component.onCompleted: {

            addImportPath(Qt.resolvedUrl('../src/'));

            importModule('asdf', function() {
                console.log('asdf imported');
            });


        }

        onError: {
            console.log('python error: ' + traceback);
        }
    }
    }
}
