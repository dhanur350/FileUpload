using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;

namespace FileSave
{
    public partial class FileUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                loaddata();
            }
        }
        void loaddata()
        {
            var st = from s in db.saves select s;
            Gridvew.DataSource = st;
            Gridvew.DataBind();
        }
        DataClasDataContext db = new DataClasDataContext();
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (Fileuplod.HasFile)
            {
                string fname = Fileuplod.FileName;
                var fileloc = "Uploads/";
                string pathstring = System.IO.Path.Combine(fileloc, fname);
                var st = new save
                {
                    FileName = txtbox.Text,
                    FileLocation = pathstring,
                };
                db.saves.InsertOnSubmit(st);
                db.SubmitChanges();
                Fileuplod.SaveAs(Server.MapPath(pathstring));
                lblMessage.Text = "Your File is uploaded";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.BackColor = System.Drawing.Color.YellowGreen;
                loaddata();
            }
            else
            {
                lblMessage.Text = "Your File is not uploaded , please check to select a file";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void Linkbtn_Click(object sender,EventArgs e)
        {
            int rowindex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            string filelocation = Gridvew.Rows[rowindex].Cells[3].Text;
            string filepath = Server.MapPath("~/"+filelocation);
            WebClient web = new WebClient();
            Byte[] FileBuffer = web.DownloadData(filepath);
            if(FileBuffer!=null)
            {
                Response.ContentType = "application/bat";
                Response.AddHeader("cotent-length", FileBuffer.Length.ToString());
                Response.BinaryWrite(FileBuffer);
            }
        }
        protected void Gridvew_SelectedIndexChanged(object sender, EventArgs e) 
        {

        }
    }
}
//if(Fileuplod.HasFile)
//{ 
//    Fileuplod.SaveAs(Server.MapPath("~/Uploads/" + Fileuplod.FileName));
//    lblMessage.Text = "Your File is uploaded";
//    
//}
//else
//{
//    
//}