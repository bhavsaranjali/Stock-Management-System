<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/login.aspx.cs" Inherits="webapp1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log in</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->         
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition login-page">
    <form id="form1" runat="server">
        <div>
          <div class="login-box">
  <div class="login-logo">
    <b>Cements</b>4U
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Sign in to start your session</p>

      <form action="../../index3.html" method="post">
        <div class="input-group mb-3">
          <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Mobile" TextMode="Number" required=""></asp:TextBox>

          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          
          <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Password" TextMode="Password" required="" ></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
             
              <asp:CheckBox id="remember" runat="server" />
              <label for="remember">
                Are u a Distributer?
              </label>
            </div>
            
          </div>
          
          <!-- /.col -->
          <div class="col-4">
            <asp:Button ID="Button1" runat="server" Text="Sign In" class="btn btn-primary btn-block" OnClick="btnclick" />
          </div>
          <!-- /.col -->
          
        </div>
      </form>

      <div class="social-auth-links text-center mb-3">
        <p>- OR -</p>
        <asp:Button ID="Button2" runat="server" Text="Admin Login" class="btn btn-block btn-primary" OnClick="Button2_Click" />
      </div>
      <!-- /.social-auth-links -->

      <p class="mb-1">
        <a href="forgot-password.html">I forgot my password</a>
      </p>
      <p class="mb-0">
        <a href="register.aspx" class="text-center">Register a new membership</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>


        </div>
    </form>
</body>
</html>
