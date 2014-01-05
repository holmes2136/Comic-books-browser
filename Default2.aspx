<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="TestYellowDark_Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en">
<head runat="server">
    <title>未命名頁面</title>

<style type="text/css">

#container{
   width:1024;
   height:800px;
   clear:both;
}

#left{
   width:494px;
   height:800px;
   float:left;
}

#right{
   width:494px;
   height:800px;
   float:right;
}

#canvas{
   width:300px;
   height:300px;
   position:absolute;
   z-index:1;
   left:50%;
   top:50%;
   margin-top:-150px;
   margin-left:-150px;
   background-color:gray;
}

#left_arrow{
   left:-5%;
   top:50%;
   z-index:1;
   position:absolute;
}

#right_arrow{
   right:-5%;
   top:50%;
   z-index:1;
   position:absolute;
}


</style>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<script type="text/javascript">
    
    
    var imglist = ['1','2','3','4','5'];
    var index = 0;
    
    window.onload = function(){
        
        var link;
        
        getData();
        
        $('#right_arrow').click(function(e){
 
           index = index + 1;
           
           if(index == 4){index = 0;}
           
           getData();
　　　　
        });
        
        $('#left_arrow').click(function(e){
            
           index = index - 1;
           
           if(index == 0){index = 4;}
           
           getData();
           
        });
        
       }
        
       function Save(link){
       
            //alert(link);
            window.history.pushState(null, null,link);
　　     
        }
        
        window.addEventListener('popstate', function(e) {     
            getHistory();
 　　  });
        
        
        function getData(){
           
           var linkSplit = imglist[index];
           
　　　   $.ajax({
                type:"GET",
                url: "api/Api.ashx",
                data: {page: linkSplit}
            }).done(function(msg) {
                $('#test').attr('src',msg.Name);
            });
　　　　
　　　    Save(linkSplit);　
        }
        
        function getHistory(){
        
           var linkSplit = window.location.toString().split('/').pop();
　　　   
　　　   $.ajax({
                type:"GET",
                url: "api/Api.ashx",
                data: {page: linkSplit}
            }).done(function(msg) {
                $('#test').attr('src',msg.Name);
            });
        
        }
        
        function getObj(){
            return imglist[index];     
        }

        
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <div id="container">
                <div id="left">
                </div>
                <div id="right">
                </div>
            </div>
            <div id="canvas">
                <div id="left_arrow">
                    <img src="images/fancy_nav_left.png" />
                </div>
                <img id="test"  title="" src="" width="300" height="300"/>
                <div id="right_arrow">
                    <img src="images/fancy_nav_right.png" />
                </div>
            </div>
    </div>
    </form>
</body>
</html>
