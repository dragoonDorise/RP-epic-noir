import QtQuick 2.12

  Rectangle {
      id: header
      color: headerCSS.background
      width: headerCSS.width
      height: headerCSS.height-headerHeightCorrection // Zoom option
      anchors.top: parent.top      
      z:99
      visible: currentPage === 'HomePage' ? 1 : 0 ;
      property var percent: api.device.batteryPercent*100
      Rectangle{
        id: header__battery
        width:84
        color:"transparent"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: aspectRatio === 169 ? 22 : 12
        anchors.rightMargin: aspectRatio === 169 ? 69 : 16
        
        Text{
            id: header__battery_number
            text: Math.floor(percent)+" %"    
            anchors { top: parent.top }   
            color: theme.title
            font.pixelSize: aspectRatio === 169 ? 32 : 18
            visible: headerHeightCorrection === 0 ? 1 : 0;
        }      
        
        Image {
              id: header__battery_icon
              width: aspectRatio === 169 ? 50 : 30
              fillMode: Image.PreserveAspectFit
              source: "../assets/icons/battery.png"
              asynchronous: true      
              anchors { top: parent.top }   
              anchors.left: header__battery_number.right
              anchors.leftMargin: 6
              anchors.topMargin: aspectRatio === 169 ? 6 : 3
              z:3999              
         }        
          Rectangle {
              id: header__battery_icon_fill
              anchors.leftMargin: 2
              anchors.topMargin: 3
              anchors.top: header__battery_icon.top
              anchors.left: header__battery_icon.left
              color: percent > 21 ? "#ffffff" : "#fee024"
              radius: 2
              width: aspectRatio === 169 ? Math.floor(percent*0.4) : Math.floor(percent*0.4)
              height: aspectRatio === 169 ? 20 : 10
          }
         
      }
      
      Text{
          id: header__time
          text: Qt.formatTime(new Date(), "hh:mm")         
          anchors.right: header__battery.left
          anchors.top: parent.top
          anchors.topMargin: aspectRatio === 169 ? 22 : 12
          anchors.rightMargin: 24
          color: theme.title
          font.pixelSize: aspectRatio === 169 ? 32 : 18
          visible: headerHeightCorrection === 0 ? 1 : 0;
      }      
      
      
      Text{
          id: header__music
          text: "Music: "+music[api.memory.get('musicArray')]
          anchors.right: header__time.left
          anchors.top: parent.top
          anchors.topMargin: aspectRatio === 169 ? 22 : 12
          anchors.rightMargin: 24
          color: theme.title
          font.pixelSize: aspectRatio === 169 ? 32 : 18
          visible: headerHeightCorrection === 0 ? 1 : 0;
      }      
      
      
      
  }