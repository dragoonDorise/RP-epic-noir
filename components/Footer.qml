import QtQuick 2.12
    Rectangle {
        id: footer
        color: footerCSS.background
        width: footerCSS.width
        height: footerCSS.height
        anchors.bottom: main.bottom
        z:99
       //Rectangle{
       //  id: footer__border
       //  anchors.top: parent.top
       //  anchors.left: parent.left
       //  anchors.leftMargin: 20
       //  width: parent.width-40;
       //  height:1
       //  color: theme.text
       //}
        
       // Image {
       //     id: rp2
       //     width: 36
       //     fillMode: Image.PreserveAspectFit
       //     source: "../assets/icons/"+ theme.footer_icon
       //     asynchronous: true        
       //     anchors.top: parent.top
       //     anchors.left: parent.left
       //     anchors.leftMargin: 42
       //     anchors.topMargin: 14
       // }      
       property var buttonSize : aspectRatio === 169 ? 20 : 10
       property var buttonTextSize : aspectRatio === 169 ? 12 : 8
       property var buttonMargin : aspectRatio === 169 ? 1 : 0.6
       // property var buttonSize : aspectRatio === 169 ? 20 : 10
           
        
        Rectangle{
            id: footer__legend
            color:"transparent"
            anchors.right: parent.right
            width:500
            height: parent.height
            anchors.verticalCenter: parent.verticalCenter
            
            Rectangle{
                id: footer__legend_A
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: footer__legend_B.left
                anchors.rightMargin: buttonMargin*70*screenRatio
                
                Rectangle{
                    height:buttonSize*screenRatio
                    width:buttonSize*screenRatio
                    color:"#444"
                    radius:buttonSize
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right  
                                
                    Text{
                         text:"A"
                         color:"white"                    
                         anchors.verticalCenter: parent.verticalCenter
                         anchors.horizontalCenter: parent.horizontalCenter
                         font.pixelSize: buttonTextSize*screenRatio
                    }
                    Text{
                         text:"Accept"
                         color: theme.text                       
                         anchors.verticalCenter: parent.verticalCenter
                         anchors.left: parent.right
                         anchors.leftMargin: 4
                         font.pixelSize: buttonTextSize*screenRatio
                         
                    }
                }
            }
            Rectangle{
                id: footer__legend_B
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: buttonMargin*60*screenRatio
                
                Rectangle{
                    height:buttonSize*screenRatio
                    width:buttonSize*screenRatio
                    color:"#444"
                    radius:20
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right  
                                
                    Text{
                         text:"B"
                         color:"white"                    
                         anchors.verticalCenter: parent.verticalCenter
                         anchors.horizontalCenter: parent.horizontalCenter
                         font.pixelSize: buttonTextSize*screenRatio
                    }
                    Text{
                         text:"Back"
                         color: theme.text                       
                         anchors.verticalCenter: parent.verticalCenter
                         anchors.left: parent.right
                         anchors.leftMargin: 4
                         font.pixelSize: buttonTextSize*screenRatio
                         
                    }
                }
            }
            Rectangle{
                id: footer__legend_Y
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: footer__legend_A.left
                anchors.rightMargin: buttonMargin*64*screenRatio
                Rectangle{
                    height:buttonSize*screenRatio
                    width:buttonSize*screenRatio
                    color:"#444"
                    radius:20
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right  
                              
                    Text{
                         text:"Y"
                         color:"white"                    
                         anchors.verticalCenter: parent.verticalCenter
                         anchors.horizontalCenter: parent.horizontalCenter
                         font.pixelSize: buttonTextSize*screenRatio
                    }
                    Text{
                         text:"Music"
                         color: theme.text                       
                         anchors.verticalCenter: parent.verticalCenter
                         anchors.left: parent.right
                         anchors.leftMargin: 4
                         font.pixelSize: buttonTextSize*screenRatio
                         
                    }
                }
            }            
            Rectangle{
                id: footer__legend_X
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: footer__legend_Y.left
                anchors.rightMargin: buttonMargin*80*screenRatio
                Rectangle{
                    height:buttonSize*screenRatio
                    width:buttonSize*screenRatio
                    color:"#444"
                    radius:buttonSize
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right  
                    visible: currentPage === 'ListPage' ? 1 : 0            
                    Text{
                         text:"X"
                         color:"white"                    
                         anchors.verticalCenter: parent.verticalCenter
                         anchors.horizontalCenter: parent.horizontalCenter
                         font.pixelSize: buttonTextSize*screenRatio
                    }
                    Text{
                         text:"Favorite"
                         color: theme.text                       
                         anchors.verticalCenter: parent.verticalCenter
                         anchors.left: parent.right
                         anchors.leftMargin: 4
                         font.pixelSize: buttonTextSize*screenRatio
                    }
                }
            }

            Rectangle{
                id: footer__legend_R
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: footer__legend_X.left
                anchors.rightMargin: buttonMargin*60*screenRatio
                Rectangle{
                    height:buttonSize*screenRatio
                    width:buttonSize*screenRatio
                    color:"#444"
                    radius:buttonSize
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right  
                    visible: currentPage === 'ListPage' ? 1 : 0            
                    Text{
                         text:"R1"
                         color:"white"                    
                         anchors.verticalCenter: parent.verticalCenter
                         anchors.horizontalCenter: parent.horizontalCenter
                         font.pixelSize: buttonTextSize*screenRatio
                    }
                    Text{
                         text:"Next"
                         color: theme.text                       
                         anchors.verticalCenter: parent.verticalCenter
                         anchors.left: parent.right
                         anchors.leftMargin: 4
                         font.pixelSize: buttonTextSize*screenRatio
                         
                    }
                }
            }            
            
                
            Rectangle{
                id: footer__legend_L
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: footer__legend_R.left
                anchors.rightMargin: buttonMargin*60*screenRatio
                Rectangle{
                    height:buttonSize*screenRatio
                    width:buttonSize*screenRatio
                    color:"#444"
                    radius:buttonSize
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right  
                    visible: currentPage === 'ListPage' ? 1 : 0            
                    Text{
                         text:"L1"
                         color:"white"                    
                         anchors.verticalCenter: parent.verticalCenter
                         anchors.horizontalCenter: parent.horizontalCenter
                         font.pixelSize: buttonTextSize*screenRatio
                    }
                    Text{
                         text:"Prev"
                         color: theme.text                       
                         anchors.verticalCenter: parent.verticalCenter
                         anchors.left: parent.right
                         anchors.leftMargin: 4
                         font.pixelSize: buttonTextSize*screenRatio
                         
                    }
                }
            }            


        }
        
        
    }    
    