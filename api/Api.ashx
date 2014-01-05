<%@ WebHandler Language="C#" Class="Api" %>

using System;
using System.Web;
using System.Collections;
using System.Collections.Generic;
using System.Web.Script.Serialization;

public class Api : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        Hashtable ht = new Hashtable();
        ht.Add("1", "images/1.jpg");
        ht.Add("2", "images/2.jpg");
        ht.Add("3", "images/3.jpg");
        ht.Add("4", "images/4.jpg");
        ht.Add("5", "images/5.jpg");
        
      
        string page = context.Request.QueryString["page"];

        string path = ht[page].ToString();


        var json = new
        {
            Name = path
        };
        
        context.Response.ContentType = "application/json";

        context.Response.Write(new JavaScriptSerializer().Serialize(json));
        
    
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}