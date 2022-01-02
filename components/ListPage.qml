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
         // header.height=0 
         // header_list__search_input.text='Search...'
          navigate('HomePage');
          return;
      }  
      
    }
 
    HeaderList{
      id: header_list
    }
       
    Rectangle {
        id: main
        color: mainCSS.background
        width: wrapperCSS.width
        height: mainCSS.height
        anchors.top: parent.top
        anchors.topMargin: headerCSS.height+60
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
                              width:games.width
                              height:game_title.height+10
                              anchors.top: parent.top
                              anchors.topMargin: -4
                              color:"#272c35"
                              visible: selected ? true : false                          
                          }     
                          
                          Text {
                            id: game_title_selected
                            text: modelData.title     
                            anchors.left: parent.left
                            anchors.leftMargin: 12
                            color: "white"
                           
                            font.family: bodyFont.name
                            font.pixelSize: 20
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                            visible: selected ? true : false 
                            z:2
                          }                                     
                          
                          Text {
                            id: game_title
                              text: modelData.title                
                              anchors.left: parent.left
                              anchors.leftMargin: 12
                              color: "#434643"
                              font.family: bodyFont.name
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
              width: parent.width    
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
              width: parent.width    
             
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