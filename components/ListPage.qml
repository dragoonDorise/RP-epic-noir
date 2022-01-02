import QtQuick 2.12


  Item{
    id: listpage     
    property var itemWidth : 600/itemsRow
    property var itemHeight : itemWidth
    Keys.onPressed: {
      //Back to Home            
      if (api.keys.isCancel(event)) {
          event.accepted = true;
          // gameView.model = currentCollection.games
          // gameViewStyle = 'standard'
          searchValue=''
          // header__search_input.focus = false
          // gameView.focus = true 
          header.height=0 
          header__search_input.text='Search...'
          navigate('HomePage');
          return;
      }  
      
    }
 
    Rectangle {
        id: header
        color: headerCSS.background
        width: headerCSS.width
        height: headerCSS.height
        anchors.top: parent.top
        // visible:false
        clip:true
        
        Rectangle{
          id: header_inner
          anchors.top: parent.top
          anchors.left: parent.left
          anchors.topMargin: 0
          anchors.leftMargin: 20          
          color:"transparent"
          width:parent.width-40
          height: 40
          
          Rectangle{
            id: header__system
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 0
            width:  40
            height: 40  
            color:"transparent"    
            visible:false      
            Image {
                id: header__system_logo
                width:parent.width
                height: parent.width
                fillMode: Image.PreserveAspectFit
                //source: "../assets/images/systems/" + currentCollection.shortName + ".png"
                source: "../assets/images/"+theme.system_icon
                asynchronous: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            
            
            Text{
              text: currentCollection.name
              anchors.left: header__system_logo.right
              anchors.leftMargin: 12
              color: theme.title
              font.pixelSize: 22
              anchors.verticalCenter: parent.verticalCenter
              width:300       
              elide: Text.ElideRight       
            }
          }    
          
          Rectangle{
            id: header__filters
            color:"transparent"
            anchors.top: parent.top
            anchors.right: parent.right
            height: 32
            width:parent.width
            
            Rectangle{
              id: header__search
              color:"white";
              anchors.top: parent.top
              anchors.topMargin: 10 
              anchors.right: parent.right
              width:parent.width
              height: 30 
              //anchors.verticalCenter: parent.verticalCenter                
              border.color: theme.text
              border.width:1
              radius:2
              visible:true
              
                Rectangle{
                    id: header__search_button
                    height:16
                    width:16
                    color:"#444"
                    radius:20
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right 
                    anchors.rightMargin: 6 
                    visible: currentPage === 'ListPage' ? 1 : 0            
                    Text{
                         text:"Y"
                         color:"white"                    
                         anchors.verticalCenter: parent.verticalCenter
                         anchors.horizontalCenter: parent.horizontalCenter
                         font.pixelSize:8
                    }
                }              
              
                  TextInput{
                      id:header__search_input
                      text:"Search.."
                      width:parent.width
                      height: parent.height                   
                      anchors.top: parent.top
                      anchors.left: parent.left
                      anchors.leftMargin: 6 
                      anchors.topMargin: 8
                      color: theme.text
                      onTextEdited: {
                          gameView.currentIndex = 0 //We move the highlight to the first item
                          searchValue = header__search_input.text
                          gameView.model = searchGames
                      }
                      
                        Keys.onPressed: {
                          if (api.keys.isAccept(event)) {
                              navigate('ListPage');
                              return;
                          }  
                          if (event.key == Qt.Key_Down) {
                              navigate('ListPage');  
                              return;
                          }
                          // if (api.keys.isCancel(event)) {
                          //     searchValue=''
                          //     header__search_input.text='Search...'                            
                          //     gameView.focus = true                           
                          //     return;
                          // }  
                          
                          
                        }
                       
                  }
                            // searchValue = "ninja"
                            // gameView.model = searchGames              
              
            }              
          }      
            

          
        }
        
    }
       
    Rectangle {
        id: main
        color: mainCSS.background
        width: wrapperCSS.width
        height: mainCSS.height
        anchors.top: header.bottom
        
        Rectangle {
            id: games
            color: "transparent"
            width: parent.width*0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 20
            height:parent.height-20-anchors.topMargin
            ListView {
                id: gameView
                width: parent.width;
                height: parent.height
                model: currentCollection.games
                delegate: gameViewDelegate
                clip:true
                anchors.left: parent.left
                anchors.leftMargin: 22
                anchors.top: parent.top
                anchors.bottom: parent.bottom        
                focus: currentPage === 'ListPage' ? true : false ;
                
                snapMode: ListView.SnapOneItem
                // highlightRangeMode: ListView.StrictlyEnforceRange
                
                // Keys.onUpPressed:       { moveCurrentIndexUp();navSound.play(); }
                // Keys.onDownPressed:     { moveCurrentIndexDown();navSound.play(); }
                // Keys.onLeftPressed:     { moveCurrentIndexLeft();navSound.play(); }
                // Keys.onRightPressed:    { moveCurrentIndexRight();navSound.play(); }
                // cellWidth: itemWidth
                // cellHeight: itemHeight
                
                Component {
                    id: gameViewDelegate 

                    Item
                    {
                      height:40                      
                      id: delegateContainer
                      property bool selected: delegateContainer.ListView.isCurrentItem
                      property var gameViewStyle : 'standard'
                      
                      Keys.onPressed: {
                        //Launch game
                        if (api.keys.isAccept(event)) {
                            event.accepted = true;
                            currentGameIndex = index
                            launchSound.play()
                            currentGame.launch();                            
                            return;
                        }  
                        
                        //toggleItemsRow     
                        if (api.keys.isFilters(event)) {
                            event.accepted = true;
                           
                            
                            if (header.height == 50){
                              header.height=0  
                            }else{
                               header.height=50
                               searchValue = ''
                               header__search_input.clear()            
                               header__search_input.focus = true
                               
                            }
                            
                            toggleSound.play()
                            //Show only current favs, not working right now...
                            // if ( gameViewStyle === 'standard'){
                            //   gameView.model = currentFavorites
                            //   gameViewStyle = 'favs'
                            //   return;
                            // }else{
                            //   gameView.model = currentCollection.games
                            //   gameViewStyle = 'standard'
                            // }
                            
                        }  
                        //Favorite
                        if (api.keys.isDetails(event)) {
                            event.accepted = true;
                            favSound.play()                            
                            currentGameIndex = index
                            currentGame.favorite = !currentGame.favorite
                            return;
                        }                        
                        //Next collection
                        if (api.keys.isNextPage(event)) {
                            event.accepted = true;
                            goBackSound.play()
                            currentCollectionIndex = currentCollectionIndex+1                           
                            return;
                        }  
                        
                        //Prev collection
                        if (api.keys.isPrevPage(event)) {
                            event.accepted = true;
                            goBackSound.play()
                            currentCollectionIndex = currentCollectionIndex-1
                            return;
                        }  
                        
                        //Search
                        if (api.keys.isPageDown(event)) {
                            event.accepted = true;
                            goBackSound.play()
                            searchValue = ''
                            header__search_input.clear()            
                            header__search_input.focus = true
                            
                            return;
                        }  
                        
                        
                                    
                      }                          
                    
                      Rectangle{
                        color:"transparent"
                        height: parent.height
                        width:parent.width

                          Rectangle{
                              id: game_selected
                              width:game_title.width
                              height:game_title.height
                              color:"#936a8e"
                              visible: selected ? true : false                          
                          }                
                          
                          Text {
                            id: game_title
                              text: modelData.title                
                              // white, 20px, condensed font
                              color: "white"
                              //font.family: globalFonts.condensed
                              font.pixelSize: 20
                              verticalAlignment: Text.AlignVCenter
                              elide: Text.ElideRight
                              
                              Image {              
                                  width: 10
                                  fillMode: Image.PreserveAspectFit
                                  source: "../assets/icons/heart_solid.svg"
                                  asynchronous: true     
                                  visible: modelData.favorite && currentCollection.shortName !== "all-favorites" 
                                  anchors {
                                      left: parent.right; 
                                      top: parent.top;
                                  }
                                  anchors.topMargin: 4
                                  anchors.leftMargin: 4
                              }    
                              
                          }                          
                                             
                      }
                      
                    }      
                    
                             
                }
                                
            }
        
           
        }
        
        Rectangle{
          id:game_details
          width: parent.width*0.5
          color:"transparent"
          anchors.left:games.right
          anchors.top: parent.top
          anchors.bottom: parent.bottom
          
          Image {
              id: game_details_logo
              width: 200    
              sourceSize { width: 200; }                                    
              fillMode: Image.PreserveAspectCrop
              source: "../assets/images/logos/"+currentCollection.shortName+".png"
              asynchronous: true      
              anchors.top: parent.top   
              anchors.right: parent.right  
              anchors.topMargin: 40
              anchors.rightMargin: 20          
              
              visible: currentPage === 'ListPage' ? true : false ;
          }     
          
          Image {
              id: game_screenshot
              width: 250    
              height: 250
              fillMode: Image.PreserveAspectFit
              anchors.top:game_details_logo.bottom
              anchors.right: parent.right
              anchors.topMargin: 20
              anchors.rightMargin: 20          

              asynchronous: true    
              source: {
                  if (currentCollection.shortName !== "android") {
                      if (currentCollection.games.get(gameView.currentIndex).assets.screenshots[0]) {
                          return currentCollection.games.get(gameView.currentIndex).assets.screenshots[0]
                      }
                      return ""
                  }
                  return ""
              }                                                               
          }      
          
          
          
        }
        
    }  
    
     Footer{
      id: footer
    }   

}