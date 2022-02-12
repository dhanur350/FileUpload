<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileUpload.aspx.cs" Inherits="FileSave.FileUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>File Upload And Display</title>
    <link href="StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <h1>File Upload And Selector</h1>
        <img src="Img/Visual_Studio_Icon_2019.jpg" class="icon" />
        <div style="line-height: 1cm; align-items: center; left: 0px; height: 349px;" class="boxstyle">
            <div>
                <h2>Please Choose a file from your storage to upload</h2>
            </div>
            <div>
                <asp:FileUpload ID="Fileuplod" runat="server" Height="38px" Width="331px" />
            </div>
            <div style="font-family:'Microsoft JhengHei'";>
                <asp:Label ID="filenme" runat="server">File Name</asp:Label>
                <asp:TextBox ID="txtbox" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnUpload" runat="server" Text="Upload File" OnClick="btnUpload_Click" Font-Size="Large" Height="29px" />
            </div>
            <div class="message">
                <asp:Label ID="lblMessage" runat="server" Font-Bold="true" Font-Size="XX-Large"></asp:Label>
            </div>
        </div>
        <div class="displaydata">
            <h3>Display Data</h3>
            <asp:GridView ID="Gridvew" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="469px" OnSelectedIndexChanged="Gridvew_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkBtn" Text='<%# Bind("FileName")%>' runat="server" OnClick="Linkbtn_Click"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            
        </div>
    </form>
</body>
</html>
