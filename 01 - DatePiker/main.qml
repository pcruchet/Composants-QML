import QtQuick 2.15
import QtQml 2.3
import QtQuick.Controls
import QtQuick.Layouts 1.3

import "calendrier.js" as Calendrier

Window
{
    width: 300
    height: 300
    visible: true
    title: qsTr("Calendrier")

    property int leJour: new Date().getDate()
    property int leMois: new Date().getMonth()
    property int lAnnee: new Date().getFullYear()


    GridLayout
    {
        id: calendarLayout
        visible: true
        rows: 3
        y: 20
        anchors.horizontalCenter: parent.horizontalCenter

        RowLayout
        {
            Layout.row: 0
            Layout.fillWidth: true
            spacing: 10

            Button
            {
                implicitWidth: 20
                text: "<"
                onClicked:
                {
                    if(leMois === 0)
                    {
                        leMois = 11
                        lAnnee -= 1
                    } else leMois -= 1
                }
            }
            Rectangle
            {
                width: 60
                Text
                {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    text: Calendrier.obtenirMois(monthGrid.title)
                    font.bold: true
                }
            }
            Button
            {
                implicitWidth: 20
                text: ">"
                onClicked:
                {
                    if(leMois === 11)
                    {
                        leMois = 0
                        lAnnee += 1
                    } else leMois += 1
                }
            }
            Button
            {
                implicitWidth: 20
                text: "<"
                onClicked: lAnnee -= 1
            }
            Text
            {
                text: lAnnee
                font.bold: true
            }
            Button
            {
                implicitWidth: 20
                text: ">"
                onClicked: lAnnee += 1
            }
        }

        DayOfWeekRow
        {
            id: dayOfWeek
            locale: monthGrid.locale
            Layout.row: 1
            Layout.fillWidth: true
            font.bold: false
        }

        MonthGrid
        {
            id: monthGrid
            Layout.row: 2
            Layout.fillWidth: true
            month: leMois
            year:  lAnnee

            delegate: Item
            {
                Rectangle
                {

                    width:  dayOfWeek.width / 7
                    height: width
                    border.color: "gray"
                    x: (index % 7) * width
                    y: (Math.floor(index/7)) * width
                    Text
                    {
                        id: textDelegate
                        text: model.day
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        color: model.month === leMois ? model.day === leJour ? "red" : "black" : "gray"
                        font.bold: model.day === leJour ? true : false
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            var memo = leMois
                            leJour = Calendrier.obtenirJour(date)
                            leMois = Calendrier.obtenirNumMois(date) - 1
                            if(memo === 0 && leMois === 11)
                                lAnnee -= 1
                            else
                            {
                                if(memo == 11 && leMois === 0)
                                    lAnnee += 1
                            }
                        }
                    }
                }
            }
        }
    }
}
