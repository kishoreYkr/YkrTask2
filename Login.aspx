<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FlexipleTask.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <script>
            $(document).ready(function () {
                var x = '';
                if (x == 'Btn') {
                    $("#DivRegister").show();
                    $("#DivLogin").hide();
                    alert("Test");
                }

                $("#lnkRegister").click(function () {
                    $("#DivRegister").show();
                    $("#DivLogin").hide();
                });
                $("#lnkLogin").click(function () {
                    $("#DivRegister").hide();
                    $("#DivLogin").show();
                });
                $("#BtnRegister").click(function () {
                    debugger;
                    $("#DivRegister").show();
                    $("#DivLogin").hide();
                    x = 'Btn';
                });
                $("#BtnLogin").click(function () {
                    $("#DivRegister").hide();
                    $("#DivLogin").show();
                });

            });
        </script>



        <div class="form-group">
            <div class="col-sm-2" style="background-color:lavender;">
                <a id="lnkLogin" style="cursor:pointer;">Login</a> 
            </div>
            <div class="col-sm-2" style="background-color:lavender;">
               <a id="lnkRegister" style="cursor:pointer;">Register</a> 
            </div>
        </div>

        <br />

        <div id="DivLogin" style="display:block;" runat="server">
        <div class="form-group">
          
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="Login" />
            <asp:Label ID="lblMsg" EnableViewState="false" runat="server"></asp:Label>

        </div>
        <div class="form-group">
            <label style="width: 100Px;">UserName:</label>
            <asp:TextBox ID="txtUserName" runat="server" Width="150px"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="None"
                                 ErrorMessage="Please enter username" ValidationGroup="Login"
                 runat="server" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label style="width: 100px;">Password:</label>
            <asp:TextBox ID="txtPwd" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="None"
                                 ErrorMessage="Please enter password" ValidationGroup="Login"
                 runat="server" ControlToValidate="txtPwd"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label style="width: 100px;"></label>
            <asp:Button ID="BtnLogin" ClientIDMode="Static"
                 CssClass="btn btn-success" runat="server" Text="Login" ValidationGroup="Login" OnClick="BtnLogin_Click" />
        </div>
      </div>
        <div id="DivRegister" style="display:none;" runat="server">
             <div class="form-group">
                  <asp:ValidationSummary ID="val1" runat="server" ForeColor="Red" ValidationGroup="Register" />
                 <asp:Label ID="lblRegisterMsg" EnableViewState="false" runat="server"></asp:Label>
            </div>

        <div class="form-group">
            <label style="width: 100Px;">UserName:</label>
            <asp:TextBox ID="TxtPreFix" runat="server" Enabled="false" Width="150px" Text="flexiple_"></asp:TextBox>
            <asp:TextBox ID="txtName" runat="server" Width="150px"></asp:TextBox>

            <asp:RegularExpressionValidator ID="req1" runat="server" ValidationGroup="Register"
                 ErrorMessage="Username allows only letters a-z(lowercase) and underscore allowed" ForeColor="Red"
                ControlToValidate="txtName" ValidationExpression="^[a-z_]*$"></asp:RegularExpressionValidator> 

            <asp:RequiredFieldValidator ID="req2" ErrorMessage="Please enter name" ValidationGroup="Register" Display="None"
                 runat="server" ControlToValidate="txtName"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group">
            <label style="width: 100Px;">Email:</label>
            <asp:TextBox ID="TxtEmail" runat="server" Width="150px"></asp:TextBox>

             <asp:RegularExpressionValidator ID="RequiredFieldValidator1" ForeColor="Red"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ErrorMessage="Email Must contain @ and Only e-mailIDs with .in domain allowed" ValidationGroup="Register"
                 runat="server" ControlToValidate="TxtEmail"></asp:RegularExpressionValidator>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None"
                                 ErrorMessage="Please enter email" ValidationGroup="Register"
                 runat="server" ControlToValidate="TxtEmail"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label style="width: 100Px;">Password:</label>
            <asp:TextBox ID="TxtPassword" runat="server" Width="150px"></asp:TextBox>

             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="None"
                                 ErrorMessage="Please enter password" ValidationGroup="Register"
                 runat="server" ControlToValidate="TxtPassword"></asp:RequiredFieldValidator>

             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red"
                    ValidationExpression="((?=(?:.*?[A-Z]){2,2})(?=(?:.*?\W){2,2}).{4,8})"
                    ErrorMessage="Password length must be between 4 to 8 characters and it contain exactly 2 special characters and 2 uppercase letters" ValidationGroup="Register"
                 runat="server" ControlToValidate="TxtPassword"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <label style="width: 100Px;">Confirm Password:</label>
            <asp:TextBox ID="TxtConfirmPassword" runat="server" Width="150px"></asp:TextBox>
             <asp:CompareValidator ID="c1" ErrorMessage="Password & Confirm Password must besame" ForeColor="Red"
                  runat="server" ControlToValidate="TxtConfirmPassword" ControlToCompare="TxtPassword"></asp:CompareValidator>
          </div>
        <div class="form-group">
            <label style="width: 100px;"></label>
            <asp:Button ID="BtnRegister" runat="server" ClientIDMode="Static"
                 CssClass="btn btn-success" Text="Register" ValidationGroup="Register" OnClick="BtnRegister_Click" />
        </div>
        </div>
    </form>
</body>
</html>
