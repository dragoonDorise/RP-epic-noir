import QtQuick 2.12
    Rectangle {
        id: footer
        color: footerCSS.background
        width: footerCSS.width
        height: footerCSS.height
        anchors.bottom: main.bottom
        z:99
  
      Rectangle{
          id: footer__legend
          color:"transparent"
          anchors.right: parent.right
          width:vw(100)
          height: parent.height
          anchors.verticalCenter: parent.verticalCenter
          
          Rectangle{
              id: footer__legend_A
              anchors.verticalCenter: parent.verticalCenter
              anchors.right: footer__legend_B.left
              anchors.rightMargin: 70*screenRatio
              
              Rectangle{
                  height:20*screenRatio
                  width:20*screenRatio
                  color:"#444"
                  radius:20
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.right: parent.right  
                              
                  Text{
                       text:"A"
                       color:"white"                    
                       anchors.verticalCenter: parent.verticalCenter
                       anchors.horizontalCenter: parent.horizontalCenter
                       font.pixelSize: 12*screenRatio
                  }
                  Text{
                       text:"Accept"
                       color: theme.text                       
                       anchors.verticalCenter: parent.verticalCenter
                       anchors.left: parent.right
                       anchors.leftMargin: 4
                       font.pixelSize: 10*screenRatio
                       
                  }
              }
          }
          Rectangle{
              id: footer__legend_B
              anchors.verticalCenter: parent.verticalCenter
              anchors.right: parent.right
              anchors.rightMargin: vw(6)
              
              Rectangle{
                  height:20*screenRatio
                  width:20*screenRatio
                  color:"#444"
                  radius:20
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.right: parent.right  
                              
                  Text{
                       text:"B"
                       color:"white"                    
                       anchors.verticalCenter: parent.verticalCenter
                       anchors.horizontalCenter: parent.horizontalCenter
                       font.pixelSize: 12*screenRatio
                  }
                  Text{
                       text:"Back"
                       color: theme.text                       
                       anchors.verticalCenter: parent.verticalCenter
                       anchors.left: parent.right
                       anchors.leftMargin: 4
                       font.pixelSize: 10*screenRatio
                       
                  }
              }
          }
          Rectangle{
              id: footer__legend_Y
              anchors.verticalCenter: parent.verticalCenter
              anchors.right: footer__legend_A.left
              anchors.rightMargin: 64*screenRatio
              Rectangle{
                  height:20*screenRatio
                  width:20*screenRatio
                  color:"#444"
                  radius:20
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.right: parent.right  
                              
                  Text{
                       text:"Y"
                       color:"white"                    
                       anchors.verticalCenter: parent.verticalCenter
                       anchors.horizontalCenter: parent.horizontalCenter
                       font.pixelSize: 12*screenRatio
                  }
                  Text{
                       text:"Zoom"
                       color: theme.text                       
                       anchors.verticalCenter: parent.verticalCenter
                       anchors.left: parent.right
                       anchors.leftMargin: 4
                       font.pixelSize: 10*screenRatio
                       
                  }
              }
          }            
          Rectangle{
              id: footer__legend_X
              anchors.verticalCenter: parent.verticalCenter
              anchors.right: footer__legend_Y.left
              anchors.rightMargin: 80*screenRatio
              Rectangle{
                  height:20*screenRatio
                  width:20*screenRatio
                  color:"#444"
                  radius:20
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.right: parent.right  
                  visible: currentPage === 'ListPage' ? 1 : 0            
                  Text{
                       text:"X"
                       color:"white"                    
                       anchors.verticalCenter: parent.verticalCenter
                       anchors.horizontalCenter: parent.horizontalCenter
                       font.pixelSize: 12*screenRatio
                  }
                  Text{
                       text:"Favorite"
                       color: theme.text                       
                       anchors.verticalCenter: parent.verticalCenter
                       anchors.left: parent.right
                       anchors.leftMargin: 4
                       font.pixelSize: 10*screenRatio
                  }
              }
          }
          // Rectangle{
          //     id: footer__legend_X_home
          //     anchors.verticalCenter: parent.verticalCenter
          //     anchors.right: footer__legend_Y.left
          //     anchors.rightMargin: 70*screenRatio
          //     Rectangle{
          //         height:20*screenRatio
          //         width:20*screenRatio
          //         color:"#444"
          //         radius:20
          //         anchors.verticalCenter: parent.verticalCenter
          //         anchors.right: parent.right  
          //         visible: currentPage === 'HomePage' ? 1 : 0            
          //         Text{
          //              text:"X"
          //              color:"white"                    
          //              anchors.verticalCenter: parent.verticalCenter
          //              anchors.horizontalCenter: parent.horizontalCenter
          //              font.pixelSize: 12*screenRatio
          //         }
          //         Text{
          //              text:"Zoom"
          //              color: theme.text                       
          //              anchors.verticalCenter: parent.verticalCenter
          //              anchors.left: parent.right
          //              anchors.leftMargin: 4
          //              font.pixelSize: 10*screenRatio
          //              
          //         }
          //     }
          // }
          
          Rectangle{
              id: footer__legend_R
              anchors.verticalCenter: parent.verticalCenter
              anchors.right: footer__legend_X.left
              anchors.rightMargin: 60*screenRatio
              Rectangle{
                  height:20*screenRatio
                  width:20*screenRatio
                  color:"#444"
                  radius:20
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.right: parent.right  
                  visible: currentPage === 'ListPage' ? 1 : 0            
                  Text{
                       text:"R1"
                       color:"white"                    
                       anchors.verticalCenter: parent.verticalCenter
                       anchors.horizontalCenter: parent.horizontalCenter
                       font.pixelSize: 12*screenRatio
                  }
                  Text{
                       text:"Next"
                       color: theme.text                       
                       anchors.verticalCenter: parent.verticalCenter
                       anchors.left: parent.right
                       anchors.leftMargin: 4
                       font.pixelSize: 10*screenRatio
                       
                  }
              }
          }            
          
              
          Rectangle{
              id: footer__legend_L
              anchors.verticalCenter: parent.verticalCenter
              anchors.right: footer__legend_R.left
              anchors.rightMargin: 60*screenRatio
              Rectangle{
                  height:20*screenRatio
                  width:20*screenRatio
                  color:"#444"
                  radius:20
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.right: parent.right  
                  visible: currentPage === 'ListPage' ? 1 : 0            
                  Text{
                       text:"L1"
                       color:"white"                    
                       anchors.verticalCenter: parent.verticalCenter
                       anchors.horizontalCenter: parent.horizontalCenter
                       font.pixelSize: 12*screenRatio
                  }
                  Text{
                       text:"Prev"
                       color: theme.text                       
                       anchors.verticalCenter: parent.verticalCenter
                       anchors.left: parent.right
                       anchors.leftMargin: 4
                       font.pixelSize: 10*screenRatio
                       
                  }
              }
          }            
  
  
      }
      
      
  }    